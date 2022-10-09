
import pandas as pd
import numpy as np
from tqdm import tqdm

mainfile = input("Enter your Input file Name: ") #S2_Duplicates_removed.csv
neardrugtargetlist = input("Enter near drug target list: ")   #Table_8A_Sider_DrugwithTarget_5nearDrugs_Scored.tsv
sider_sideeff=input("Enter near Sider Sideeffect table: ")   #Table_2A_Sider_drug_no_effect.csv
output = input("Enter your Output file Name: ") #Table_11A_300Drug_NearDrug_Target.csv

df = pd.read_csv(mainfile)
length=len(df)

df=df[['DRUG_NAME','DRUG_ID','SMILES']]

df_symp = pd.read_csv(sider_sideeff,sep = '\t')
length=len(df_symp)

drugname=df_symp["drugname"]
side_eff=df_symp["side_effect_name"]
no_side=df_symp["no_of_side_effect"]

drugsymp={}
for i in range(length):
    key=drugname[i].lower()
    value=no_side[i]
    drugsymp[key]=value

df['NoSideEffects'] = df['DRUG_NAME'].str.lower().map(drugsymp)

drugsympall={}
for i in range(length):
    key=drugname[i].lower()
    value=side_eff[i]
    drugsympall[key]=value

df['AllSideEffects'] = df['DRUG_NAME'].str.lower().map(drugsympall)

#df.to_csv('Table_5A_300_Sider_drugmaped.csv', index=False)

#df_sider=pd.read_csv("Table_8A_Sider_DrugwithTarget_5nearDrugs_Scored.tsv")
df_sider=pd.read_csv(neardrugtargetlist)

df_sider.rename(columns = {'drugname':'DRUG_NAME'}, inplace = True)
df["DRUG_NAME"]=df["DRUG_NAME"].str.lower() 

df.dropna(subset = ["NoSideEffects"], inplace=True)

def mapping(df,dfkey,dfvalue):
    key=dfkey
    value=dfvalue
    dictionary={}

    for i in range(len(df)):
        dictionary[key[i]]=value[i]
    return dictionary

df=df.reset_index()

s2=mapping(df,df['DRUG_NAME'].str.lower(),df['DRUG_ID'])
df_sider['DB_DRUG_ID'] = df_sider['DRUG_NAME'].str.lower().map(s2)
df_sider.dropna(subset = ["DB_DRUG_ID"], inplace=True)
df_sider.to_csv(output, index = False)

