library("caret", lib.loc="~/R/win-library/3.5")
library("stats", lib.loc="C:/Program Files/R/R-3.5.1/library")
library("devtools", lib.loc="~/R/win-library/3.5")
install_github("ropensci/skimr", ref = "develop")

library("psych", lib.loc="~/R/win-library/3.5")
library(dplyr)
library(RColorBrewer)
library(zoo)
library(openxlsx)
install.packages("rpart")
library(stringr)
install.packages("devtools")

library(devtools)
4

qdap::mgsub()

#Aexport<-readxl::read_xlsx("aquaexportUSD.xlsx")
Aexport<-read.xlsx("aquaexportUSD.xlsx")
head(Aexport)
dim(Aexport)
length(Aexport)
class(Aexport)
class(Aexport$COMMODITY_DESC)
colnames(Aexport)
#skimr::skim(Aexport)

Aexport$COMMODITY_DESC_dupe <- Aexport$COMMODITY_DESC
CTSSPLIT<-str_split_fixed(Aexport$COMMODITY_DESC_dupe,"-",3)
AexportN<- as.data.frame(CTSSPLIT)
colnames(AexportN)<-c("Category","type_export","Subcategory")
head(AexportN)

wb1<- loadWorkbook("aquaexportUSD.xlsx")
addWorksheet(wb1,sheetName="splittedcol")
writeData(wb1, sheet ="splittedcol",AexportN)
saveWorkbook(wb1,file="aquaexportUSD.xlsx", overwrite = TRUE)

traceback()
remove.packages("tibble")
install.packages("tibble")


#Type_export = fresh, frozen LIVE,ORNAMENTAL,COOKED,CANNED
#Key words for type_export
   #Type of export |	Keyword
     #LIVE	         |  Live
      #ORNAMENTAL	 |Ornamental
      #FRESH |	Fresh
#FROZEN 	|Frozen
#COOKED	|steaks,fellets,prepared
#CANNED	|Brine,oil, canned

#------------------#
#Category= Trout,Salmon,Clams,Mussels,Scallops,Shrimps and Prawns,Ornamental,Oysters

#Subcategory=Atlantic salmon,CHINOOK SALMON,Chum Salmon,coho salmon,
#            Clams- excluding GEODUCK CLAMS,GEODUCK CLAMS,Mussels
#            Scallops,Oysters-general,Seed Oysters,Oysters in Brine
#             Ornamental,Pacific Salmon,Salmon-ROE,Pink Salmon,Rainbow Trout
#              Salmon-packed,Sock-eye salmon,Cooked Trout,Live Trout,Shrimps and Prawns
#---------------------#


#############


"
if (condition1) { 
  expr1
} else if (condition2) {
  expr2
} else if  (condition3) {
  expr3
} else {
  expr4
}"


export<-read.xlsx("aquaexportUSD1.xlsx")
head(export)
class(export$Category)
unique(export$ Category)
unique(export$type_export)
str
gsu
e1<- export %>% mutate ( for  (i in 1:length(export)){
               gsub("OYSTERS " ,"OYSTERS" ,export$Category)
               gsub(" SHRIMPS AND PRAWNS","SHRIMPS AND PRAWNS",export$Category)
               gsub(" FROZEN" ,"FROZEN" ,export$type_export)
               gsub(" LIVE" ,"LIVE" ,export$type_export)
               gsub("SALTED " ,"SALTED" ,export$type_export)
               gsub(" SHELL ON" ,"SHELL ON" ,export$Subcategory)
               gsub("GENERAL "  ,"GENERAL" ,export$Subcategory)
               gsub(" PEELED"  ,"PEELED" ,export$Subcategory)
               }
               )
               

unique(e1$Category)


destnames<-read.xlsx("aquaimportUSD.xlsx",sheet = "Sheet4")
chngnames<-read.xlsx("aquaimportUSD.xlsx",sheet = "Sheet5")
head(destnames);head(chngnames$New.name)

wrkbook1<- loadWorkbook("aquaimportUSD.xlsx")
addWorksheet(wrkbook1,sheetName="changedheadings")
mgsu
newnames<-as.data.frame(mgsub(chngnames$COMMODITY_IMPORT_ITEM,chngnames$New.name,destnames$COMMODITY_DESC))
class(newnames);head(destnames$COMMODITY_DESC)
head(newnames);colnames(newnames)<- "new names"
writeData(wrkbook1, sheet ="changedheadings",newnames)
saveWorkbook(wrkbook1,file="aquaimportUSD.xlsx", overwrite = TRUE)



