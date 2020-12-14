rm(list=ls())
library(stringr)
library(tau)

# 抽取資訊
pirate_path <- tempfile(fileext = ".txt")
download.file("https://raw.githubusercontent.com/wush978/DataScienceAndR/course/02-RDataEngineer-01-Parsing/pirate-info-2015-09.txt", destfile = pirate_path)
pirate_info <- readLines(file(pirate_path, encoding = "BIG5"))
head(pirate_info)

head(
  regmatches(
    pirate_info, 
    regexec("日期：([0-9]{4})年([0-9]{1,2})月([0-9]{1,2})日", pirate_info)
  ))

#==============================#
# 跳脫字元
# 目的：希望能夠抓取兩個小括號之間的數字
x <- "123(45)657"
#小括號就是代表子模式，這是絕對的！
pattern <- "((.*))"
regmatches(x, regexec(pattern, x))
#跑到R 的雙引號中間之後，每一個"\"都要重複兩遍
pattern <- "\\((.*)\\)"
cat(pattern)
regmatches(x, regexec(pattern, x))
#特殊符號，例如大括號、中括號、小括號、+… 在比對的時候，如果這些剛好是你要比對的文字，那就要加上跳脫字元"\"，程式才能正確的詮釋我們想表達的意思

#==============================#
#範例01	
stringVector<-c("a","abc","ac","abbc","abbbc","abbbbc")
grep("ab*",stringVector,value=T)

grep("ab+",stringVector,value=T)

grep("ab?c",stringVector,value=T)

grep("ab{2}c",stringVector,value=T)

grep("ab{2,}c",stringVector,value=T)

grep("ab{2,3}c",stringVector,value=T)

#範例02	
stringVector<-c("abc","bcd","cde","def","abc def","bcdefg abc")
grep("^bc",stringVector,value=T)

grep("bc$",stringVector,value=T)


grep("\\bde",stringVector,value=T)

grep("\\Bde",stringVector,value=T)

#範例03	
stringVector<-c("03-2118800", "02-23123456", "0988123456", "07-118", "0-888", "csim@mail.cgu.edu.tw", "csim@.", "csim@", "http://www.is.cgu.edu.tw/")
grep("[0-9]{2}-[0-9]{7,8}",stringVector,value=T)
grep("\\d{2}-\\d{7,8}",stringVector,value=T)

grep("[0-9]{10}",stringVector,value=T)
grep("\\d{10}",stringVector,value=T)

grep("02|03",stringVector,value=T)

grep("[a-zA-Z0-9_]+@[a-zA-Z0-9._]+",stringVector,value=T)
grep("\\w+@[a-zA-Z0-9._]+",stringVector,value=T)

#範例04	
grep("A{2,4}", c("A", "AA", "AAA", "AAAA", "AAAAA"), value = TRUE)

#不定字元	
head(grep("A.A", flights$tailnum, value = TRUE))

head(grep("N[13]", flights$tailnum, value = TRUE))

#否定字元	
head(grep("N[^13]", flights$tailnum, value = TRUE))

head(grep("N[13]{3}", flights$tailnum, value = TRUE))

#子模式	
head(grep("(12){2}", flights$tailnum, value = TRUE))

#子模式	
head(grep("(1[23]){2}", flights$tailnum, value = TRUE))


help.search(keyword = "character", package = "base")

library(stringr)
install.packages("cwhmisc")
library(cwhmisc)
padding("abc",10," ","center")
a <- rep(1,10^4)
system.time(b <- str_pad(a, 3, side="left", pad="0"))
system.time(c <- sapply(a, padding, space = 3, with = "0", to = "left"))

