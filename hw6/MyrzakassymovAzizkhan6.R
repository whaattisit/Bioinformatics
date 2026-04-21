# Myrzakassymov Azizkhan
# 6 Homework
#

# Read input
input <- readLines("inputlab6.txt")

# threshold
threshold <- as.numeric(input[1])

quality_lines <- input[seq(5, length(input), by = 4)]

bad_reads_count <- 0

for (line in quality_lines) {
  codes <- as.numeric(charToRaw(line))

  scores <- codes - 33
  
  if (mean(scores) < threshold) {
    bad_reads_count <- bad_reads_count + 1
  }
}

print(bad_reads_count)