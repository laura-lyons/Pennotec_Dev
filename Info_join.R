renv::activate()

renv::install('tidyverse')


library(tidyverse)

sampleInfo <- read_csv('data/sampleInfo.csv')
sampleOrder <- read_csv('data/sampleOrder.csv')

uploadInfo <- left_join(sampleOrder, sampleInfo, by = "Label")
View(uploadInfo)

upload <- uploadInfo %>% mutate(class = str_c(Class, '_', Cake))

upload <- as_tibble(upload)
write_csv(upload, "data/upload.csv")
