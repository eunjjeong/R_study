# 데이터 입출력
# edit()-R에서 제공하는 데이터편집기 사용
product <- data.frame()
product; class(product)
product <- edit(product) 
product

# scan()
input <- scan() # 키보드입력을 통해서 읽기
input
input <- scan(what = "")
input

# 파일에서 데이터 읽기
setwd("/home/jjeong/workspace_R/git_R_study/data")
nums <- scan("sample_num.txt")
nums; class(nums); is.array(nums); is.factor(nums); is.vector(nums); is.list(nums)
reals <- scan("sample_real.txt")
reals; class(reals); is.array(reals); is.factor(reals); is.vector(reals); is.list(reals)
# 파일에서 데이터 읽기(문자, 실수)
# chars <- scan("sample_chars.txt") error
chars <- scan("sample_chars.txt", what="")
chars; class(chars); is.array(chars); is.factor(chars); is.vector(chars); is.list(chars)

# ascii, utf-8
words_ansi <- scan("sample_ansi.txt", what=""); words_ansi
words_utf8 <- scan("sample_utf8.txt", what="", encoding="UTF-8"); words_utf8

# readLines(), read.table()
grades <- read.table("studentgrades.csv", header=T, row.names="StudentID", sep=",")
grades; str(grades)
grades <- read.table("studentgrades.csv", header=T, row.names="StudentID", sep=",", stringsAsFactors = F)
grades
str(grades)

# read.table() 일반 텍스트 형태의 파일을 읽어 데이터프레임에 담기
fruits <- read.table("fruits.txt")
class(fruits); is.array(fruits); is.factor(fruits); is.vector(fruits); is.list(fruits); is.data.frame(fruits)
fruits
fruits <- read.table("fruits.txt", header=T)
fruits
# 주석무시
fruits <- read.table("fruits_2.txt"); fruits
fruits <- read.table("fruits_2.txt", skip=2); fruits
fruits <- read.table("fruits_2.txt", nrow=2); fruits
fruits <- read.table("fruits.txt", header=T, nrow=2); fruits

fruits_csv <- read.csv("fruits_3.csv"); fruits_csv
fruits_csv <- read.csv("fruits_4.csv"); fruits_csv
fruits_csv <- read.csv("fruits_4.csv", header=F); fruits_csv
label <- c("NO", "NAME", "PRICE", "QTY")
fruits_csv <- read.csv("fruits_4.csv", header=F, col.names=label); fruits_csv

# web site
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris.UCI <- read.csv(url, header=F)
head(iris.UCI)

# download.file()
setwd("/home/jjeong/workspace_R/git_R_study/RinAction2")
local.copy <- "iris.csv"
download.file(url=url, destfile=local.copy)
iris.UCI <- read.csv(local.copy, header=F)
head(iris.UCI)

# zip file
url <- "http://www.seanlahman.com/files/database/baseballdatabank-master_2016-03-02.zip"
local.copy <- "lahman2016.zip"
download.file(url, local.copy)
baseball.salary <- read.csv(unzip(zipfile = local.copy, "baseballdatabank-master/core/Salaries.csv"))
head(baseball.salary)

url <- "https://www.nrc.gov/reading-rm/doc-collections/event-status/reactor-status/PowerReactorStatusForLast365Days.txt"
npower <- read.table(url, sep="|", header=T, stringsAsFactors = F)
str(npower)
npower$ReportDt <- as.Date(npower$ReportDt, format="%m/%d/%Y")
head(npower); tail(npower)

library(lattice)
some <- npower[npower$Unit==as.character(unique(npower$Unit)[1:12]),]
xyplot(Power ~ ReportDt | Unit, data = some, type="l", col.line="black", xlab="Time", ylab="Power")
cloud.seeding <- scan("http://ftp.uni-bayreuth.de/math/statlib/datasets/cloud", 
                      skip=15, 
                      nlines=108,
                      what = list(period=character(0),
                                  seeded=character(0),
                                  season=character(0),
                                  te=numeric(0),
                                  tw=numeric(0),
                                  nc=numeric(0),
                                  sc=numeric(0),
                                  nwc=numeric(0)))
str(cloud.seeding)
cloud.seeding
cloud.seeding <- as.data.frame(cloud.seeding)
cloud.seeding
summary(cloud.seeding[4:8])
# 인공강우 실시여부에 따른 강수량 평균
colMeans(subset(cloud.seeding, select=c(te,tw), subset=(seeded=="S" & season=="AUTUMN")))
colMeans(subset(cloud.seeding, select=c(te,tw), subset=(seeded=="U" & season=="AUTUMN")))

# XPath
library(RCurl)
url <- "http://www.abrahamlincolnonline.org/lincoln/speeches/gettysburg.htm"
html <- getURL(url)
str(html)
length(html)
cat(html)

# xpathSApply
library(XML)
html.parsed <- htmlParse(html)
str(html.parsed)
html.node <- xpathSApply(doc=html.parsed, path="//p")
str(html.node)
html.node[[2]]

# xmlValue
text <- xmlValue(html.node[[2]])
str(text)
text
text <- sapply(html.node, xmlValue)
str(text)
text[2]
text <- xpathSApply(html.parsed, path = "//text()", fun=xmlValue)
text[1:5]
text <- xpathSApply(html.parsed, "//text()
                    [not(ancestor::script)][not(ancestor::style)]
                    [not(ancestor::noscript)][not(ancestor::form)]",
                    xmlValue)
text
class(text); summary(text); text[10]

# readHTMLTable()
url <- "https://www.nationmaster.com/country-info/stats/Cost-of-living/Average-monthly-disposable-salary/After-tax#2014"
html.parsed <- getURL(url)
html.tab <- readHTMLTable(doc = html.parsed, stringsAsFactors=F)
str(html.tab)
head(html.tab[[1]])
salary <- html.tab[[1]]
str(salary)
salary2 <- readHTMLTable(doc=html.parsed, which=1, stringAsFactors=F)
str(salary2)

salary <- salary[,-5];
# sapply 함수를 사용해서 쉼표 제거, substirng 함수를 사용해서 달러기호 삭제
salary$AMOUNT <- sapply(salary[,3], function(x) gsub(",", "", as.character(x)))
salary$AMOUNT <- as.numeric(substring(salary$AMOUNT, 2))
str(salary)
head(salary)
summary(salary$AMOUNT)

install.packages("googleVis")
library(googleVis)
Fruits
write.csv(Fruits, "Fruits_sql.csv", quote=F, row.names=F)
fruits_sql <- read.csv.sql("Fruits_sql.csv", sql="SELECT*FROM file WHERE Year=2008"); fruits_sql
install.packages("sqldf")
