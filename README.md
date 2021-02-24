# R_Text-Mining 

## 字串處理
<table border="1" width="40%">
    <tr>
        <th width="30%">Code 語法</a>
        <th width="10%">Description 說明</a>
    </tr>
    <tr>
        <td> strsplit() </td>
        <td> 切割 </td>
    </tr>
    <tr>
        <td> substr() </td>
        <td> 子集合 </td>
    </tr>
    <tr>
        <td> toupper()/toupper() </td>
        <td> 大/小寫轉換 </td>
    </tr>
    <tr>
        <td> paste()/paste0() </td>
        <td> 文字連接 </td>
    </tr>
    <tr>
        <td> str_trim() </td>
        <td> 前後空白去除 (需安裝stringr) </td>
    </tr>
</table>
<br>

```
library(tidyverse)
str_trim("  Hello   ")
```
> [1] "Hello" <>
<br>

## Regular Expression
正則表示式 (Regular Expression) 是在處理純文字資料時，幾乎可以解決所有問題的技術。正則表示式是一種描述文字模式的語言。它不是單純依照應用歸納出來的工具，背後具有相當的數學基礎。正則表示式的誕生，來自於美國數學家 Stephen Cole Kleene 在超過半個世紀之前的研究成果。目前各種程式語言中，幾乎都內建正則表示式，但是他們的語法主要分成兩個派系：
* 出自於電機電子工程師學會 (IEEE) 制定的標準
* 來自於另一個程式語言：Perl
<br>

正規表示式的常用語法分類如下：
<table border="1" width="50%">
    <tr>
        <th width="10%">Type 類型</a>
        <th width="10%">Meta Character 元字符</a>
        <th width="30%">Description 說明</a>
    </tr>
    <tr>
        <td> 逃脫字元 </td>
        <td> \ </td>
        <td></td>
    </tr>
    <tr>
        <td rowspan="6"> 表示數量 </td>
        <td> * </td> 
        <td> 出現 0~ 無限多次，等於{0,} </td>
    </tr>
    <tr>
        <td> + </td>
        <td> 出現 1~ 無限多次，等於{1,} </td>
    </tr>
    <tr>
        <td> ? </td>
        <td> 出現 0~1 次，等於{0,1} </td>
    </tr>
    <tr>
        <td> {n} </td>
        <td> 出現 n 次 </td>
    </tr>
    <tr>
        <td> {n,} </td>
        <td> 出現 n~無限多次，o{1,}等於o+，o{0,}等於o* </td>
    </tr>
    <tr>
        <td> {n,m} </td>
        <td> 出現 n~m 次 </td>
    </tr>
    <tr>
        <td rowspan="4"> 表示位置 </td>
        <td> ^ </td> 
        <td> 出現在字串開始的位置，`^`也匹配 `\n` 或 `\r` 之後的位置 </td>
    </tr>
    <tr>
        <td> $ </td>
        <td> 出現在字串結束的位置，`$`也匹配 `\n` 或 `\r` 之前的位置 </td>
    </tr>
    <tr>
        <td> \b </td>
        <td> 出現空字串 (空白) 開始或結束的位置 </td>
    </tr>
    <tr>
        <td> \B </td>
        <td> 出現非字串開始或結束的位置 </td>
    </tr>
    <tr>
        <td rowspan="5"> 運算子 </td>
        <td> . </td> 
        <td> 出現所有的字元一次，包括空字串 </td>
    </tr>
    <tr>
        <td> [...] </td>
        <td> 出現字元清單 (…) 中的字元一次，可用-表示範圍，如`[A-Z]`，`[a-z]`，`[0-9]` </td>
    </tr>
    <tr>
        <td> [^...] </td>
        <td> 不出現字元清單 (…) 中的字元 </td>
    </tr>
    <tr>
        <td> \ </td>
        <td> 要搜尋字串中的特殊字元時，前方須加上 `\` </td>
    </tr>
    <tr>
        <td> | </td>
        <td> 或 </td>
    </tr>
    <tr>
        <td rowspan="30"> 特殊符號 </td>
        <td> . </td> 
        <td> 可以用來表達任何字元 </td>
    </tr>
    <tr>
        <td> \d </td>
        <td> 比對任一個數字，等於 `[0-9]` </td>
    </tr>
    <tr>
        <td> \D </td>
        <td> 比對任一個非數字，等於 `[^0-9]` </td>
    </tr>
    <tr>
        <td> \w </td>
        <td> 文字數字與底線，等於 `[[:alnum:]]` or `[A-z0-9_]` </td>
    </tr>
    <tr>
        <td> \W </td>
        <td> 非文字數字與底線，等於 [^A-z0-9_] </td>
    </tr>
    <tr>
        <td> \s </td>
        <td> 空白字元，包括空格、定位字元、換頁符等，等於 `[\f\n\r\t\v]`，如 `/\s\w*/` 可比對 “A b” 中的 “b” </td>
    </tr>
    <tr>
        <td> \S </td>
        <td> 非空白字元，等於 `[^\f\n\r\t\v]`，如 `/\S/\w*` 可比對 “A b” 中的 “A” </td>
    </tr>
    <tr>
        <td> \b </td>
        <td> 比對英文字的邊界，如 `/\bn\w/` 可以比對 “noonday” 中的 “no”； `/\wy\b/` 可比對 “possibly yesterday.” 中的 “ly” </td>
    </tr>
    <tr>
        <td> \B </td>
        <td> 比對非「英文字的邊界」，如 `/\w\Bn/` 可以比對 “noonday” 中的 “on”； `/y\B\w/` 可以比對 “possibly yesterday.” 中的 “ye” </td>
    </tr>
    <tr>
        <td> [\b] </td>
        <td> 比對退位字元 (Backspace character)，如：比對一個 backspace </td>
    </tr>
    <tr>
        <td> \cX </td>
        <td> 比對控制字元 (Control character)，其中 X 是控制字元，如 `/\cM/` 可以比對一個字串中的 control-M </td>
    </tr>
    <tr>
        <td> \f </td>
        <td> 比對換頁符 (form-feed)，等於 `\x0c` 和 `\cL` </td>
    </tr>
    <tr>
        <td> \n </td>
        <td> 比對換行符號，等於 `\x0a` 和 `\cJ` </td>
    </tr>
    <tr>
        <td> \r </td>
        <td> 比對回車符 (carriage return)，等於 `\x0d` 和 `\cM` </td>
    </tr>
    <tr>
        <td> \t </td>
        <td> 比對定位字元 (Tab)，等於 `\x09` 和 `\cI` </td>
    </tr>
    <tr>
        <td> \v </td>
        <td> 比對垂直定位字元 (Vertical tab)，等於 `\x0b` 和 `\cK` </td>
    </tr>
    <tr>
        <td> [:lower:] </td>
        <td> 小寫字，等於 `[a-z]` </td>
    </tr>
    <tr>
        <td> [:upper:] </td>
        <td> 大寫字，等於 `[A-Z]` </td>
    </tr>
    <tr>
        <td> [:digit:] </td>
        <td> 所有數字，等於 `[0-9]` </td>
    </tr>
    <tr>
        <td> [:xdigit:] </td>
        <td> hex digits </td>
    </tr>
    <tr>
        <td> [:alpha:] </td>
        <td> 所有英文字，等於 `[[:lower:][:upper:]]` or `[A-z]` </td>
    </tr>
    <tr>
        <td> [:alnum:] </td>
        <td> 所有英文字和數字，等於 `[[:alpha:][:digit:]]` or `[A-z0-9]` </td>
    </tr>
    <tr>
        <td> [:space:] </td>
        <td> space characters </td>
    </tr>
    <tr>
        <td> [:blank:] </td>
        <td> 空白字元，包括空白和 tab </td>
    </tr>
    <tr>
        <td> [:cntrl:] </td>
        <td> control characters </td>
    </tr>
    <tr>
        <td> [:punct:] </td>
        <td> 標點符號 ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~. </td>
    </tr>
    <tr>
        <td> [:graph:] </td>
        <td> letters, numbers, and punctuation </td>
    </tr>
    <tr>
        <td> [:print:] </td>
        <td> letters, numbers, punctuation, and whitespace </td>
    </tr>
    <tr>
        <td> \ooctal </td>
        <td> 比對八進位，其中octal是八進位數目，如 `/\oocetal123/` 可比對 8 進位的 ASCII 中 “123” 所相對應的字元 </td>
    </tr>
    <tr>
        <td> \xhex </td>
        <td> 比對十六進位，其中hex是十六進位數目，如 `/\xhex38/` 可比對 16 進位的 ASCII 中 “38” 所相對應的字元 </td>
    </tr>
    <tr>
        <td rowspan="4"> 小技巧 </td>
        <td> </td> 
        <td> 善用 `^` 標示起始位置 </td>
    </tr>
    <tr>
        <td> </td>
        <td> 善用 `\b` 偵測字元邊界 </td>
    </tr>
    <tr>
        <td> </td>
        <td> 善用 `.*?` 忽略後續字串 </td>
    </tr>
    <tr>
        <td> (x) </td>
        <td> 比對 x 並將符合的部分存入一個變數 </td>
    </tr>
</table>
<br>


## 搜尋字串：GREP套件包
* grep(pattern, x, ignore.case=FALSE, perl=FALSE, value=FALSE, fixed=FALSE, useBytes=FALSE, invert=FALSE)
  * 回傳符合條件之向量位置(index) 
```
stringVector <- c("a", "abc", "ac", "abbc", "abbbc", "abbbbc")
grep("ab?c", stringVector,value=T)
grep("ab{2,}c", stringVector,value=T)
```
> "abc" "ac"  <br>
> "abbc"   "abbbc"  "abbbbc"<br>
```
grep("bc$", stringVector, value=T)
grep("\\bde", stringVector, value=T)
grep("\\Bde", stringVector, value=T)
```
> "abc"    "abbc"   "abbbc"  "abbbbc"  <br>
> character(0) <br>
> character(0) <br>
```
stringVector<-c("03-2118800","02-23123456","0988123456",
                "07-118","0-888","csim@mail.cgu.edu.tw","csim@.","csim@",
                "http://www.is.cgu.edu.tw/")
grep("[0-9]{2}-[0-9]{7,8}",stringVector,value=T)
grep("[a-zA-Z0-9_]+@[a-zA-Z0-9._]+",stringVector,value=T)
```
> "03-2118800"  "02-23123456" <br>
> "csim@mail.cgu.edu.tw" "csim@." <br>
```
grep("\\d{2}-\\d{7,8}",stringVector,value=T)
grep("\\w+@[a-zA-Z0-9._]+",stringVector,value=T)
```
> "03-2118800"  "02-23123456" <br>
> "csim@mail.cgu.edu.tw" "csim@." <>
<br>

* grepl(pattern, x, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 回傳每個向量是否符合條件(TRUE or FALSE)
```
plant = c("apple","berry","grape")
grep('e',plant) 
table(grepl('e',plant))
table(grepl('p',plant))
```
> [1] 1 2 3    <br>
> TRUE         <br> 
>   3          <br>
> FALSE  TRUE  <br>
>    1      2  <br>
<br>

* sub(pattern, replacement, x, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 多個指定 replacement ，用來取代字元的函數
  * sub 及 gsub 作用相同
```
sub("_","","123_456_789")         # 替換第一個出現的_ 為無空白
```
> "123456_789" <br>
<br>

* gsub(pattern, replacement, x, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 文字取代
  * 範例：消除空白
```
gsub("_","","123_456_789")        # 替換所有出現的_ 為無空白
```
```
string <- '    some text on line one; 
and then some text on line two     '

# R 3.2.0之前
gsub(pattern = "(^ +| +$)",
     replacement = "",
     x = string)
    
# R 3.2.0及更高 
trimws(x = string)

# 所有空白
gsub(pattern = "\\s",   
     replacement = "",
     x = string)
```
> "123456789" <br>
> some text on line one; \nand then some text on line two <br> 
> sometextonlineone;andthensometextonlinetwo <br> 
```
# 完全去除
trim <- function (x){
  gsub("^\\s+|\\s+$", "", x)
  }

trim("   test  ") 
```
> test <br>
<br>

* regexpr(pattern, text, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
  * 帶有兩個值，第一個值：符合條件的字串出現在指定範圍當中的位置是從第幾個字元開始。第二個值：「 match.length 」表示的是符合條件的結果有幾個字元
  * regexpr、 gregexpr 及 regexec 似乎都一樣
```
text <- c("Hellow, Adam!", "Hi, Adam!", "How are you, Adam.")
regexpr("Adam", text) 
```
> [1]  9  5 14  <br>
> attr(,"match.length") <br>
> [1] 4 4 4   <br>
> attr(,"index.type")  <br>
> [1] "chars"  <br>
> attr(,"useBytes")  <br>
> [1] TRUE <br>
<br>

* gregexpr(pattern, text, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)
```
text <- c("Hellow, Adam!", "Hi, Adam!", "How are you, Adam.")
gregexpr("Adam", text) 
```
> [[1]]                 <br>
> [1] 9                 <br>
> attr(,"match.length") <br>
> [1] 4                 <br>
> attr(,"index.type")   <br>
> [1] "chars"           <br>
> attr(,"useBytes")     <br>
> [1] TRUE              <br>
> <br>
> [[2]]                 <br>
> [1] 5                 <br>
> attr(,"match.length") <br>
> [1] 4                 <br>
> attr(,"index.type")   <br>
> [1] "chars"           <br>
> attr(,"useBytes")     <br>
> [1] TRUE              <br>
> <br>
> [[3]]                 <br>
> [1] 14                <br>
> attr(,"match.length") <br>
> [1] 4                 <br>
> attr(,"index.type")   <br>
> [1] "chars"           <br>
> attr(,"useBytes")     <br>
> [1] TRUE              <br>
<br>

* regexec(pattern, text, ignore.case=FALSE, fixed=FALSE, useBytes=FALSE)
```
regexec("Adam", text)
```
<br>

## 常用範例
* username：`^[a-z0-9_-]{3,15}$`

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/username.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/username_ex.JPG" width=200>
<br>


* phone number：`^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$`

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/phonenumber.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/phonenumber_ex.JPG" width=200>
<br>


* email：
  * `[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+`
  * `/^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4})*$/`

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/email.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/email_ex.JPG" width=200>
<br>


* date：
  * MM/DD/YYYY
    * `(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})`
    * `/^((0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2})*$/`
  * YYYY/MM/DD：`/^(((?:19|20)[0-9]{2})[- /.](0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01]))*$/`
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/date_ex.JPG" width=200>
  
<br>


* ascii：`[ -~]`

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ascii.JPG" width=400>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ascii_ex.JPG" width=200>
<br>


* password：`^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$`

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/password.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/password_ex.JPG" width=200>
<br>


* ipv4：`(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}`
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ipv4.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ipv4_ex.JPG" width=200>
<br>


* ipv6：`(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))`

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ipv6_ex.JPG" width=200>
<br>


* ssn：`^(?!0{3})(?!6{3})[0-8]\d{2}-(?!0{2})\d{2}-(?!0{4})\d{4}$`

<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ssn.JPG" width=800>
<img src="https://github.com/sueshow/R_Text-Mining/blob/main/picture/ssn_ex.JPG" width=200>
<br>


* MAC_IEEE 802：MAC-48 標準格式`_6`組由 `:` 或 `-` 做區隔的雙位數 16 進制數字
  * `/^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/`
<br>  

* 驗證使用者帳號，第一個字不為數字，只接受大小寫字母、數字及底線
  * `/^[a-zA-Z]\w*$/`
<br>  

* 高強度密碼：6 位數以上，且至少包含大寫字母、小寫字母、數字、符號各一。若需要調整，將其對應的小括號內容拿掉即可
  * `/^(?=.*[^a-zA-Z0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$/`
<br>  

* URL網址：允許 http, https, ftp 協定，且可取出 Protocol, Domain, Path, Query
  * `/^(?:(https?|ftp):\/\/)?((?:[a-zA-Z0-9.\-]+\.)+(?:[a-zA-Z0-9]{2,4}))((?:/[\w+=%&.~\-]*)*)\??([\w+=%&.~\-]*)$/`
<br>  

* 中文 (Unicode)：`[\u4e00-\u9fa5]`
* 正整數：`/^\+?\d+$/`
* 整數：`/^[+-]?\d+$/`
* float：`/^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/`
<br>  




## 參考資訊
* https://molecular-service-science.com/2015/01/18/text-processing-in-r-using-grep/
* https://datascienceandr.org/articles/RegularExpression.html
* https://yijutseng.github.io/DataScienceRBook/manipulation.html
* https://blog.poychang.net/note-regular-expression/
* stringer：https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html
* stringer：http://blog.fens.me/r-stringr/
* 練習/測試：https://regex101.com/
* 常用的正規表示式：https://ihateregex.io/
* 視覺化呈現正規表示式的規則路徑：https://jex.im/regulex/#!flags=&re=%5E(a%7Cb)*%3F%24

