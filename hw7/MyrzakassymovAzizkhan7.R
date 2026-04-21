# Myrzakassymov Azizkhan homework 7
# IPRB

k <- 2 # homozygous dominant
m <- 2 # heterozygous 
n <- 2 # homozygous recessive
sum <- k + m + n

# probabilities
from_aa <- n/sum * (n-1)/(sum-1) # probability of recessive allele from aa + aa

from_Aa_aa <- m/sum * (n)/(sum-1) # probability of recessive allele from Aa + aa

from_Aa_Aa <- m/sum * (m-1)/(sum-1) * 0.25 # probability of recessive allele from Aa + Aa

pr_aa <- from_aa + from_Aa_aa + from_Aa_Aa 

print(1 - pr_aa)