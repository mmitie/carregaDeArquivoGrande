library(tidyverse)
setwd("C:/dados")
my_file <- 'arquivogrande.txt'


f <- function(x, pos) {
  x <- unlist(x)
  #supondo que vc queria apenas os registros em que o campo nas posicoes 38/39 seja igual a "01"
  filtro <- x[substring(x, 38, 39) == "01"]
  
  write.table(
    #supondo que a chave esteja nos campos 14 a 24 e a informacao desejada nos campos 59 a 67
    cbind(substring(filtro,14,24),substring(filtro,59,67)), 
    file = "arquivopequeno.csv",
    append = TRUE, sep = ";", col.names = FALSE, row.names = FALSE) 
}


read_lines_chunked(
  my_file, 
  DataFrameCallback$new(f), 
  chunk_size = 100000, 
  skip = 0,
  locale = default_locale(), 
  na = character(),
  progress = FALSE
)



