# R_Text-Mining 

## 字串處理
* strsplit()：切割
* substr()：子集合
* toupper()/toupper()：大/小寫轉換
* paste()/paste0()：文字連接
* str_trim()：前後空白去除(需安裝stringr)
<br>

## Regular Expression
正則表示式（Regular Expression）是在處理純文字資料時，幾乎可以解決所有問題的技術。正則表示式是一種描述文字模式的語言。 它不是單純依照應用歸納出來的工具，背後具有相當的數學基礎。 正則表示式的誕生，來自於美國數學家Stephen Cole Kleene在超過半個世紀之前的研究成果。目前各種程式語言中，幾乎都內建正則表示式，但是他們的語法主要分成兩個派系：
* 出自於電機電子工程師學會(IEEE)制定的標準
* 來自於另一個程式語言：Perl
<>
正規表示式的常用語法分類如下：
* 逃脫字元

* 表示數量
  * *：出現0~無限多次
  * +：出現1~無限多次
  * ?：出現0~1次
  * {n}：出現n次
  * {n,}：出現n~無限多次
  * {n,m}：出現n~m次
* 表示位置
  * ^：出現在字串開始的位置
  * $：出現在字串結束的位置
  * \b：出現空字串(空白)開始或結束的位置
  * \B：出現非字串開始或結束的位置
* 運算子
  * .：出現所有的字元一次，包括空字串
  * [...]：出現字元清單(…)中的字元一次，可用-表示範圍，如[A-Z]，[a-z]，[0-9]
  * [^...]：不出現字元清單(…)中的字元
  * \：要搜尋字串中的特殊字元時，前方須加上\
  * |：或
* 特殊符號
  * \d：數字，等於 [0-9]
  * \D：非數字，等於 [^0-9]
  * [:lower:]：小寫字，等於 [a-z]
  * [:upper:]：大寫字，等於 [A-Z]
  * [:alpha:]：所有英文字，等於 [[:lower:][:upper:]] or [A-z]
  * [:alnum:]：所有英文字和數字，等於 [[:alpha:][:digit:]] or [A-z0-9]
  * \w：文字數字與底線，等於 [[:alnum:]] or [A-z0-9_]
  * \W：非文字數字與底線，等於 [^A-z0-9_]
  * [:blank:]：空白字元，包括空白和tab
  * \s：空白字元
  * \S：非空白字元
  * [:punct:]：標點符號 ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
<br>

## 搜尋字串：GREP套件包
* grep(pattern, x, ignore.case=FALSE, perl=FALSE, value=FALSE, fixed=FALSE, useBytes=FALSE, invert=FALSE)
  * 回傳符合條件之向量位置(index) 
```
stringVector <- c("a", "abc", "ac", "abbc", "abbbc", "abbbbc")
grep("ab?c", stringVector,value=T)
grep("ab{2,}c", stringVector,value=T)
```
```
grep("bc$", stringVector, value=T)
grep("\\bde", stringVector, value=T)
grep("\\Bde", stringVector, value=T)
```
```
stringVector<-c("03-2118800","02-23123456","0988123456",
                "07-118","0-888","csim@mail.cgu.edu.tw","csim@.","csim@",
                "http://www.is.cgu.edu.tw/")
grep("[0-9]{2}-[0-9]{7,8}",stringVector,value=T)
grep("[a-zA-Z0-9_]+@[a-zA-Z0-9._]+",stringVector,value=T)
```
```
grep("\\d{2}-\\d{7,8}",stringVector,value=T)
grep("\\w+@[a-zA-Z0-9._]+",stringVector,value=T)
```
<br>

* grepl(pattern, x, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 回傳每個向量是否符合條件(TRUE or FALSE)
```
```
<br>

* sub(pattern, replacement, x, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 多個指定 replacement ，用來取代字元的函數
  * sub 及 gsub 作用相同
```
```
<br>

* gsub(pattern, replacement, x, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 文字取代
```
```
<br>

* regexpr(pattern, text, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 帶有兩個值，第一個值：符合條件的字串出現在指定範圍當中的位置是從第幾個字元開始。第二個值：「 match.length 」表示的是符合條件的結果有幾個字元
  * regexpr、 gregexpr 及 regexec 似乎都一樣
```
```
<br>

* gregexpr(pattern, text, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
```
```
<br>

* regexec(pattern, text, ignore.case=FALSE, fixed=FALSE, useBytes=FALSE)
```
```
<br>


## 參考資訊
* https://molecular-service-science.com/2015/01/18/text-processing-in-r-using-grep/
* https://datascienceandr.org/articles/RegularExpression.html
* https://yijutseng.github.io/DataScienceRBook/manipulation.html

* 練習：https://regex101.com/

