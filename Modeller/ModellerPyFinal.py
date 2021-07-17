#!/usr/bin/env python
# coding: utf-8

# # This is a Modeller Batch Script
# ## Script made under guidance of Rawal Genomics Team
# ### Script made by Prateek Paul
# Source: https://salilab.org/modeller/tutorial/basic.html

# #### #pip install Bio
# ##### Install Modeller from https://salilab.org/modeller/download_installation.html
# ##### Also download suplementary files and put them in same folder https://salilab.org/modeller/supplemental.html
# ##### licence key https://salilab.org/modeller/registration.html
# #### code references https://salilab.org/modeller/tutorial/basic.html

#importing all modelues
import os
import glob
import Bio
import urllib
import shutil, sys 
import numpy as np
import pandas as pd
from Bio.PDB import *
from Bio import SeqIO
from modeller import *
from modeller.automodel import *
#sys.stdout = open("dump.txt", "w")

#creating folder so that main folder looks clean
def folder():
    try:
        os.mkdir('Ready')
        os.mkdir('ali')
        os.mkdir('buildprofile')
        os.mkdir('PDB')
    except:
        print('folder exists')

#generating main sequence ali files
def aligen(ID, Seq):
    ids,v=ID.split('.')
    file1 = open("ali/"+ids+".ali", "w")
    file1.write(">P1;"+ids+"\n")
    file1.write("sequence:"+ids+":::::::0.00: 0.00"+"\n")
    file1.write(Seq+"*")
    file1.close()

#Searching for structures related to the main sequence 
def build_profile(ID):
    ids,v=ID.split('.')
    log.verbose()
    env = Environ()
    sdb = SequenceDB(env)
    sdb.read(seq_database_file='pdb_95.pir', seq_database_format='PIR',
             chains_list='ALL', minmax_db_seq_len=(30, 4000), clean_sequences=True)
    sdb.write(seq_database_file='pdb_95.bin', seq_database_format='BINARY',
              chains_list='ALL')
    sdb.read(seq_database_file='pdb_95.bin', seq_database_format='BINARY',
             chains_list='ALL')
    aln = Alignment(env)
    aln.append(file="ali/"+ids+".ali", alignment_format='PIR', align_codes='ALL')
    prf = aln.to_profile()
    prf.build(sdb, matrix_offset=-450, rr_file='${LIB}/blosum62.sim.mat',
              gap_penalties_1d=(-500, -50), n_prof_iterations=1,
              check_profile=False, max_aln_evalue=0.01)
    prf.write(file="buildprofile/"+ids+'build_profile.prf', profile_format='TEXT')
    aln = prf.to_alignment()
    aln.write(file="buildprofile/"+ids+'build_profile.ali', alignment_format='PIR')


#Downloading the selected pdb files required for the templetes
def pdbDn(pdbid):
    urllib.request.urlretrieve('http://files.rcsb.org/download/'+pdbid+'.pdb', pdbid+'.pdb')

#comparing the downloaded pdb
#presently this step is being skipped 
#and the code is taking the top hit for the pdb 
def compare(listpdb,ID):
    ids,v=ID.split('.')
    env = Environ()
    aln = Alignment(env)
    for (pdb, chain) in (listpdb):
        m = Model(env, file=pdb, model_segment=('FIRST:'+chain, 'LAST:'+chain))
        aln.append_model(m, atom_files=pdb, align_codes=pdb+chain)
    aln.malign()
    aln.malign3d()
    aln.compare_structures()
    aln.id_table(matrix_file='family.mat')
    env.dendrogram(matrix_file='family.mat', cluster_cut=-1.0)

#Aligning Main seq with the template
def align2d(pdbid,chain,ID):
    ids,v=ID.split('.')
    env = Environ()
    aln = Alignment(env)
    mdl = Model(env, file=pdbid, model_segment=('FIRST:A','LAST:A'))
    aln.append_model(mdl, align_codes=pdbid+chain, atom_files=pdbid+'.pdb')
    aln.append(file="ali/"+ids+'.ali', align_codes=ids)
    aln.align2d()
    aln.write(file="ali/"+ids+'-'+pdbid+chain+'.ali', alignment_format='PIR')
    aln.write(file="ali/"+ids+'-'+pdbid+chain+'.pap', alignment_format='PAP')

#building the profile for the selected pdb to main seq
def prf(ids):
        a_file = open("buildprofile/"+ids+'build_profile.prf', "r")
        lines = a_file.readlines()
        a_file.close()
        line=lines[6:]
        f = open("buildprofile/"+ids+'build_profile.prf', "w")
        #f.write('sno \t id \t l1 \t l2')
        for x in line:
            for z in x.split():
                f.write(z+'\t')
            f.write('\n')
        f.close()
        df = pd.read_csv("buildprofile/"+ids+'build_profile.prf', sep='\t', header=None)
        #return (len(df))
        df=df.sort_values(by=([10,11]), ascending=(False,False))
        df=df.reset_index()
        identity = df[10]
        #y=identity[1]
        if len(df) > 0: 
            pdbids=df[1]
            if len(df) > 1:
                x=pdbids[1]
                pdbDn(x[:4])
            else:
                x = 'cannot'
        else:
            x = 'cannot'        
        return (len(df)), identity,x

#Model building
def model(ali,ID,pdbid):
    ids,v=ID.split('.')
    env = Environ()
    a = AutoModel(env, alnfile=ali,
                  knowns=pdbid, sequence=ids,
                  assess_methods=(assess.DOPE,
                                  assess.GA341))
    a.starting_model = 1
    a.ending_model = 5
    a.make()

#Model evaluation and removing of the other files
def eva(ids):
    dope = 0.0
    for file in glob.glob(ids+".*.pdb"):
        fh = open(file)
        for each in fh:
            if "REMARK   6 DOPE score:" in each:
                b = each.split(' ')
                r = b[6].strip()
                if float(r) < float(dope):
                    dope=b[6]
                    mainfile=file
        fh.close()
    pdbs=glob.glob(ids+".*.pdb")
    shutil.move(mainfile, 'Ready')
    for pdbmod in glob.glob(ids+".*"):
        os.remove(pdbmod)

def main():
    folder()
    
    fastafile=input("Enter fasta file name : ")
    with open(fastafile) as handle:
        for record in SeqIO.parse(handle, "fasta"):
            def model(ali,ID,pdbid):
                ids,v=ID.split('.')
                env = Environ()
                a = AutoModel(env, alnfile=ali,
                              knowns=pdbid, sequence=ids,
                              assess_methods=(assess.DOPE,
                                              assess.GA341))
                a.starting_model = 1
                a.ending_model = 5
                a.make()
            
            
            ID=record.id
            Seq=record.seq
            Seq=str(Seq)
            ids,v=ID.split('.')
            aligen(ID, Seq)

            build_profile(ID)
            
            length,identity,x=prf(ids)
            
            if x == 'cannot':
                print('next file')
            else:
                if length > 1:
                    if int(identity[1]) > 34:
                        align2d(x[:4],x[4:5],ID)
                        path = 'ali/'+ids+'-'+x+'.ali'
                        model(path,ID,x)
                        eva(ids)
                        
    #pdbsall=glob.glob("*.pdb")
    for pdbsall in glob.glob("*.pdb"):
        shutil.move(pdbsall, 'PDB')

if __name__ == "__main__":
    main()

