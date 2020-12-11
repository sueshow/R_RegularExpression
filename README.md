# R_Text-Mining 

## 字串處理
* strsplit()：切割
* substr()：子集合
* toupper()/toupper()：大/小寫轉換
* paste()/paste0()：文字連接
* str_trim()：前後空白去除 (需安裝stringr)
```
library(tidyverse)
```
<br>

## Regular Expression
正則表示式 (Regular Expression) 是在處理純文字資料時，幾乎可以解決所有問題的技術。正則表示式是一種描述文字模式的語言。它不是單純依照應用歸納出來的工具，背後具有相當的數學基礎。正則表示式的誕生，來自於美國數學家 Stephen Cole Kleene 在超過半個世紀之前的研究成果。目前各種程式語言中，幾乎都內建正則表示式，但是他們的語法主要分成兩個派系：
* 出自於電機電子工程師學會 (IEEE) 制定的標準
* 來自於另一個程式語言：Perl
<br>

正規表示式的常用語法分類如下：
* 逃脫字元：\
* 表示數量
  * *：出現 0~ 無限多次，等於{0,}
  * +：出現 1~ 無限多次，等於{1,}
  * ?：出現 0~1 次，等於{0,1}
  * {n}：出現 n 次
  * {n,}：出現 n~無限多次，o{1,}等於o+，o{0,}等於o*
  * {n,m}：出現 n~m 次
* 表示位置
  * ^：出現在字串開始的位置，^也匹配“\n”或“\r”之後的位置
  * $：出現在字串結束的位置，$也匹配“\n”或“\r”之前的位置
  * \b：出現空字串 (空白) 開始或結束的位置
  * \B：出現非字串開始或結束的位置
* 運算子
  * .：出現所有的字元一次，包括空字串
  * [...]：出現字元清單 (…) 中的字元一次，可用-表示範圍，如[A-Z]，[a-z]，[0-9]
  * [^...]：不出現字元清單 (…) 中的字元
  * \：要搜尋字串中的特殊字元時，前方須加上\
  * |：或
* 特殊符號
  * .：可以用來表達任何字元
  * \d：比對任一個數字，等於 [0-9]
  * \D：比對任一個非數字，等於 [^0-9]
  * \w：文字數字與底線，等於 [[:alnum:]] or [A-z0-9_]
  * \W：非文字數字與底線，等於 [^A-z0-9_]
  * \s：空白字元，包括空格、定位字元、換頁符等，等於 [\f\n\r\t\v]，如 /\s\w*/ 可比對 “A b” 中的 “b”
  * \S：非空白字元，等於 [^\f\n\r\t\v]，如 /\S/\w* 可比對 “A b” 中的 “A”
  * \b：比對英文字的邊界，如 /\bn\w/ 可以比對 “noonday” 中的 “no”； /\wy\b/ 可比對 “possibly yesterday.” 中的 “ly”
  * \B：比對非「英文字的邊界」，如 /\w\Bn/ 可以比對 “noonday” 中的 “on”； /y\B\w/ 可以比對 “possibly yesterday.” 中的 “ye”
  * [\b]：比對退位字元 (Backspace character)，如：比對一個 backspace
  * \cX：比對控制字元 (Control character)，其中 X 是控制字元，如 /\cM/ 可以比對一個字串中的 control-M
  * \f：比對換頁符 (form-feed)，等於 \x0c 和 \cL
  * \n：比對換行符號，等於 \x0a 和 \cJ
  * \r：比對回車符 (carriage return)，等於 \x0d 和 \cM
  * \t：比對定位字元 (Tab)，等於 \x09 和 \cI
  * \v：比對垂直定位字元 (Vertical tab)，等於 \x0b 和 \cK
  * [:lower:]：小寫字，等於 [a-z]
  * [:upper:]：大寫字，等於 [A-Z]
  * [:digit:]：所有數字，等於 [0-9]
  * [:xdigit:]：hex digits
  * [:alpha:]：所有英文字，等於 [[:lower:][:upper:]] or [A-z]
  * [:alnum:]：所有英文字和數字，等於 [[:alpha:][:digit:]] or [A-z0-9]
  * [:space:]：space characters
  * [:blank:]：空白字元，包括空白和 tab
  * [:cntrl:]：control characters
  * [:punct:]：標點符號 ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
  * [:graph:]：letters, numbers, and punctuation
  * [:print:]：letters, numbers, punctuation, and whitespace
  * \ooctal：比對八進位，其中octal是八進位數目，如 /\oocetal123/ 可比對 8 進位的 ASCII 中 “123” 所相對應的字元
  * \xhex：比對十六進位，其中hex是十六進位數目，如 /\xhex38/ 可比對 16 進位的 ASCII 中 “38” 所相對應的字元
* 小技巧
  * 善用 ^ 標示起始位置
  * 善用 \b 偵測字元邊界
  * 善用 .*? 忽略後續字串
  * (x)：比對 x 並將符合的部分存入一個變數 
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
text <- c("Hellow, Adam!", "Hi, Adam!", "How are you, Adam.")
regexpr("Adam", text) 
```
<br>

* gregexpr(pattern, text, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
```
gregexpr("Adam", text) 
```
<br>

* regexec(pattern, text, ignore.case=FALSE, fixed=FALSE, useBytes=FALSE)
```
regexec("Adam", text)
```
<br>

## 常用範例
* username：^[a-z0-9_-]{3,15}$

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/username.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/username_ex.JPG" width=200>
<br>


* phone number：^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/phonenumber.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/phonenumber_ex.JPG" width=200>
<br>


* email：[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/email.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/email_ex.JPG" width=200>
<br>


* date：(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/date_ex.JPG" width=200>
<br>


* ascii：[ -~]

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ascii.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ascii_ex.JPG" width=200>
<br>


* password：^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/password.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/password_ex.JPG" width=200>
<br>


* ipv4：(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ipv4.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ipv4_ex.JPG" width=200>
<br>


* ipv6：(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ipv6_ex.JPG" width=200>
<br>


* ssn：^(?!0{3})(?!6{3})[0-8]\d{2}-(?!0{2})\d{2}-(?!0{4})\d{4}$

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ssn.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ssn_ex.JPG" width=200>
<br>


## 參考資訊
* https://molecular-service-science.com/2015/01/18/text-processing-in-r-using-grep/
* https://datascienceandr.org/articles/RegularExpression.html
* https://yijutseng.github.io/DataScienceRBook/manipulation.html
* https://blog.poychang.net/note-regular-expression/
* stringer：https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html
* 練習/測試：https://regex101.com/
* 常用的正規表示式：https://ihateregex.io/
* 視覺化呈現正規表示式的規則路徑：https://jex.im/regulex/#!flags=&re=%5E(a%7Cb)*%3F%24

