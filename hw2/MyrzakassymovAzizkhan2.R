# Myrzakassymov Azizkhan HW2

# First task (DNA)


s <- "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
s <- strsplit(s, "")[[1]]

cat(
  sum(s == "A"),
  sum(s == "C"),
  sum(s == "G"),
  sum(s == "T")
)


# Second task (RNA)


s <- "GATGGAACTTGACTACGTAAATT"
rna <- chartr("T", "U", s)

cat(rna)


# Third task (REVC)


s <- "AAAACCCGGT"
complement = chartr("ATCG", "TAGC", s)
reverse <- paste(rev(strsplit(complement, "")[[1]]), collapse = "")

cat(reverse)


# Fourth task (REVP)


s <- "TCAATGCATGCGGGTCTATATGCAT"

rev_comp <- function(s) {
  comp <- chartr("ACGT", "TGCA", s)
  paste(rev(strsplit(comp, "")[[1]]), collapse = "")
}

n <- nchar(s)

for (i in 1:n) {
  for (len in 4:12) {
    if (i + len - 1 <= n) {
      sub <- substr(s, i, i + len - 1)
      if (sub == rev_comp(sub)) {
        cat(i, len, "\n")
      }
    }
  }
}