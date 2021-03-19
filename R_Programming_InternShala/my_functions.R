my_stats <- function(vec){
  mean_val <- mean(vec)
  sd_val <- sd(vec)
  median_val <- median(vec)
  sum_val <- sum(vec)
  
  output <- list(mean = mean_val, 
                 sd = sd_val,
                 median = median_val,
                 sum = sum_val)
  return(output)
}

power <- function(x,a){
  y <- x^a
  return(y)
}

fibonacci_seq <- function(n){
  f_sequence <- NULL
  for(i in 1:n){
    if(i <= 2){
      f <- 1 # first two elements are 1
    } else{
      f <- f_sequence[i-2] + f_sequence[i-1] #for all other cases fibonacci number is sum of previous two numbers
    }
    f_sequence <- c(f_sequence, f)
  }
  return(f_sequence)
  print(f)
}