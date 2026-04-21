library(httr)

### TASK 1 ###

# Input
protein_ids <- c("B5ZC00")
#

for (id in protein_ids) 
{
  
  # Forming URL
  clean_id <- strsplit(id, "_")[[1]][1]
  url <- paste0("https://www.uniprot.org/uniprot/", clean_id, ".fasta")
  
  # Making request
  res <- GET(url)
  if(status_code(res) != 200) next
  
  # Parsing FASTA
  content_text <- content(res, "text", encoding = "UTF-8")
  lines <- strsplit(content_text, "\n")[[1]]
  
  # Removing header
  sequence <- paste(lines[-1], collapse = "")
  
  # Finding pattern N{P}[ST]{P}
  pattern <- "N[^P][ST][^P]"
  matches <- gregexpr(paste0( "(?=", pattern, ")" ), sequence, perl = TRUE)
  positions <- as.vector(matches[[1]])
  
  # Output
  if (positions[1] != -1) {
    cat(id, "\n")
    cat(paste(positions, collapse = " "), "\n")
  }
  
}

### TASK 2 ###


solve_protein <- function (protein_seq) {
  
  codon_counts <- c(
    'A'=4, 'R'=6, 'N'=2, 'D'=2, 'C'=2, 'Q'=2, 'E'=2, 'G'=4, 'H'=2, # How many codons makes aminoacids
    'I'=3, 'L'=6, 'K'=2, 'M'=1, 'F'=2, 'P'=4, 'S'=6, 'T'=4, 'W'=1,
    'Y'=2, 'V'=4
  )
  
  amino_acids <- strsplit(protein_seq, "")[[1]]
  
  total_variants <- 3 # Stop codons
  
  for (aa in amino_acids) {
    num <- codon_counts[aa]
    
    total_variants <- (total_variants * num) %% 1000000
  }
  
  return(total_variants)
  
}

# Input
protein_string <- "ADRENALINE"

solve_protein(protein_string)

# For example if protein_string is ADRENALINE, then output is 165888
