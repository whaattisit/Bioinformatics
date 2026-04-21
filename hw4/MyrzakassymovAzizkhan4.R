# Myrzakassymov Azizkhan
# Fourth homework

# very important thing don't touch it 
codon_table <- c(
  'ATA'='I', 'ATC'='I', 'ATT'='I', 'ATG'='M',
  'ACA'='T', 'ACC'='T', 'ACG'='T', 'ACT'='T',
  'AAC'='N', 'AAT'='N', 'AAA'='K', 'AAG'='K',
  'AGC'='S', 'AGT'='S', 'AGA'='R', 'AGG'='R',
  'CTA'='L', 'CTC'='L', 'CTG'='L', 'CTT'='L',
  'CCA'='P', 'CCC'='P', 'CCG'='P', 'CCT'='P',
  'CAC'='H', 'CAT'='H', 'CAA'='Q', 'CAG'='Q',
  'CGA'='R', 'CGC'='R', 'CGG'='R', 'CGT'='R',
  'GTA'='V', 'GTC'='V', 'GTG'='V', 'GTT'='V',
  'GCA'='A', 'GCC'='A', 'GCG'='A', 'GCT'='A',
  'GAC'='D', 'GAT'='D', 'GAA'='E', 'GAG'='E',
  'GGA'='G', 'GGC'='G', 'GGG'='G', 'GGT'='G',
  'TCA'='S', 'TCC'='S', 'TCG'='S', 'TCT'='S',
  'TTC'='F', 'TTT'='F', 'TTA'='L', 'TTG'='L',
  'TAC'='Y', 'TAT'='Y', 'TAA'='_', 'TAG'='_', 'TGA'='_',
  'TGC'='C', 'TGT'='C', 'TGG'='W'
)

# input
DNA <- c("ATGGTCTACATAGCTGACAAACAGCACGTAGCAATCGGTCGAATCTCGAGAGGCATATGGTCACATGATCGGTCGAGCGTGTTTCAAAGTTTGCGCCTAG") # main string
introns <- c("ATCGGTCGAA", "ATCGGTCGAGCGTGT") 

clean_DNA <- DNA
for (i in introns) {
  clean_DNA <- gsub(i, "", clean_DNA)
}

# codon vector consisting of our DNA string :O
codons <- substring(clean_DNA, seq(1, nchar(clean_DNA), 3), seq(3, nchar(clean_DNA), 3) )

# making AA from our codons
protein <- codon_table[codons]

final_protein <- paste(protein[protein != "_"], collapse = "")

print(final_protein)

