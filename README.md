# R_Text-Mining 

## Regular Expression
正則表示式（Regular Expression）是在處理純文字資料時，幾乎可以解決所有問題的技術。正則表示式是一種描述文字模式的語言。 它不是單純依照應用歸納出來的工具，背後具有相當的數學基礎。 正則表示式的誕生，來自於美國數學家Stephen Cole Kleene在超過半個世紀之前的研究成果。目前各種程式語言中，幾乎都內建正則表示式，但是他們的語法主要分成兩個派系：
* 出自於電機電子工程師學會(IEEE)制定的標準
* 來自於另一個程式語言：Perl
<br>

## GREP套件包
* grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,fixed = FALSE, useBytes = FALSE, invert = FALSE)
  * 符合條件的值有幾個
```
```
<br>

* grepl(pattern, x, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)
  * 指定範圍裡是否有符合條件的字串
```
```
<br>

* sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)
  * 多個指定 replacement ，用來取代字元的函數
  * sub 及 gsub 作用相同
```
```
<br>

* gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)
```
```
<br>

* regexpr(pattern, text, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)
  * 帶有兩個值，第一個值：符合條件的字串出現在指定範圍當中的位置是從第幾個字元開始。第二個值：「 match.length 」表示的是符合條件的結果有幾個字元
  * regexpr、 gregexpr 及 regexec 似乎都一樣
```
```
<br>

* gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)
```
```
<br>

* regexec(pattern, text, ignore.case = FALSE,fixed = FALSE, useBytes = FALSE)
```
```
<br>


