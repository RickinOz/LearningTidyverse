#Test readxl (read Excel File as par tof the tidyverse)

library(tidyr)
library(readxl)
getwd()

#This first script is a full solution to merge multiple xlsx file into 1 tibble
  #R video about readxl: https://www.rstudio.com/resources/webinars/whats-new-with-readxl/
  #Github source: https://github.com/rstudio/webinars/tree/master/36-readxl
  #Ref: https://github.com/STAT545-UBC/Discussion/issues/398
  library(tidyverse)
  library(rprojroot)
  library(stringr)
  rootDir <- "D:/Mapping/Project Snowy/LocationExport/"#rprojroot::find_rstudio_root_file()
  
  # List the files in group1 dir with only the extension I want, in this case xlsx
  #Ref:#Ref: https://stackoverflow.com/questions/47511319/read-all-worksheets-as-dataframes-from-multiple-excel-workbooks-of-different-s
  group1Files <- list.files(rootDir, full.names = TRUE, pattern = "*.xlsx") 
  group1Files
  group2Files <- list.files(rootDir, full.names = TRUE, pattern = "*.xlsx") %>% set_names(basename(.))
  group2Files
  
  # name this list, gsub optional, can also use str_sub() for this
  names(group1Files) <- list.files(rootDir) %>% gsub(pattern = ".xlsx$", replacement = "")
  
  # Map_df, but with meaningful IDs
  #group1 <- map_df(group1Files, read_excel, col_names = FALSE,.id = "subj") #.id"subj" will simply apply an incremental number
  #Ref: https://twitter.com/_colinfay/status/949023275534946304?lang=en
  group1 <- map_df(group2Files, read_excel, col_names = FALSE,.id = "file") #.id"file" display the filename  but need to combine with group2Files <- list.files(rootDir, full.names = TRUE, pattern = "*.xlsx") %>% set_names(basename(.))
  group1
  View(group1)




install.packages("plyr")
locationexport<-read_excel("D:/Mapping/Project Snowy/LocationExport/LocationExport_180302_010140.xlsx",
                           col_types = cols(
                             Classification=col_character()))
read_excel("D:/Power BI/AppCommentShort.xlsx")
locationexport
View(locationexport)

library(readxl)
file.list <- list.files("D:/Mapping/Project Snowy/LocationExport/",pattern='*.xlsx')
df.list <- lapply(file.list, read_excel)
df.list <- sapply(file.list, read_excel, simplify=FALSE)
View(df.list)

library(purrr)
file.list <- list.files("D:/Mapping/Project Snowy/LocationExport/",pattern='*.xlsx')
file.list <- setNames(file.list, file.list) # only needed when you need an id-column with the file-names

df <- map_df(file.list, read_excel)#, .id = "id")


getwd() #"C:/Users/Eric/Documents"
library(plyr)
file_list <- list.files("D:/Mapping/Project Snowy/LocationExport/",pattern='*.xlsx')
dataset <- ldply(file_list, read.table, header=TRUE, sep="\t")

View (file.list)
setwd("D:/Mapping/Project Snowy/LocationExport/")

#Ref:https://www.rstudio.com/resources/webinars/whats-new-with-readxl/
#Use the File Panel on the lower Right > click and select Import Dataset ...
Library(readxl)
ExcelFile <- read_excel("D:/R/LocationExport_180302_125959.xlsx")
View(ExcelFile)
