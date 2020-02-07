# 비정형 데이터 수집 및 분석
install.packages("rvest")
library(rvest)

url <- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url, encoding="CP949")

# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title <- strsplit(title, ":")
title
title <- unlist(title); title # list -> 해제
class(title); View(title)

write(title, "data/movie_titles.txt")
readTitles <- readLines("data/movie_titles.txt"); readTitles
NROW(readTitles)

install.packages("KoNLP")
install.packages("wordcloud")
library(KoNLP)
library(wordcloud)
useSejongDic()

wordcount <- table(readTitles)
class(wordcount); wordcount
head(sort(wordcount, decreasing=T), 20)

library(RColorBrewer)
palete <- brewer.pal(9, "Set3")
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=1, random.order = F, random.color=T, colors=palete)

site <- "http://movie.naver.com/movie/point/af/list.nhn?page="
movie.review <- NULL
for(i in 1:100){
  url <- paste(site, i, sep="")
  text <- read_html(url, encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".point")
  point <- html_text(nodes)
  nodes <- html_nodes(text, ".title")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t", "", review)
  review <- gsub("\r\n", "", review)
  review <- gsub("신고", "", review)
  page <- cbind(title, point)
  page <- cbind(page, review)
  movie.review <- rbind(movie.review, page)
}
movie.review
write(movie.review, file="data/movie_reviews2.txt")
class(movie.review)

library(KoNLP)
library(wordcloud)
useSejongDic()

data1 <- readLines("data/movie_reviews2.txt")
data2 <- sapply(data1, extractNoun, USE.NAMES = F); data2
data3 <- unlist(data2)

data3 <- Filter(function(x){nchar(x)>=2}, data3); data3 # 2글자 이상만 필터링
data3 <- gsub("UNCL", "", data3); data3
data3 <- gsub("VOL", "", data3); data3
data3 <- gsub("VS", "", data3); data3

write(unlist(data3), "data/movie_reviews.txt")
data4 <- read.table("data/movie_reviews.txt")
