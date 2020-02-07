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

write(unlist(data3), "data/movie_review.txt")
data4 <- read.table("data/movie_review.txt")

library(rvest)
url <- "https://search.naver.com/search.naver?where=post&sm=tab_jum&query=%EC%84%9C%EC%9A%B8+%EA%B4%80%EA%B4%91+%EB%AA%85%EC%86%8C"
text <- read_html(url, encoding="utf-8")
nodes <- html_nodes(text, "a.sh_blog_title")
title <- html_text(nodes)
title

# 연속 페이지 불러오기
url <- "https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query=%EC%84%9C%EC%9A%B8%20%EA%B4%80%EA%B4%91%20%EB%AA%85%EC%86%8C&sm=tab_pge&srchby=all&st=sim&where=post&start="
for (page in 0:10){
  cat(paste(url, page*10+1, sep=""), "\r\n")
}

searchTitle <- NULL
for (page in 0:40){
  text <- read_html(paste(url, page, sep=""), encoding="UTF-8")
  nodes <- html_nodes(text, "a.sh_blog_title")
  page <- html_text(nodes)
  searchTitle <- cbind(searchTitle, page)
}
searchTitle

install.packages("KoNLP")
library(KoNLP) # https://drive.gumu.kr/sharing/IK7Bkj1lw KoNLP 오류시 다운 후 pacakge 경로안에 붙여넣기
library(wordcloud)
library(stringr)
# 데이터 중에서 명사만 골라낸 후 nouns변수에 할당
# extractNoun KoNLP패키지에 포함된 함수(주어진 데이터에서 한글 명사만 골라주는 역할)
data2 <- sapply(searchTitle, extractNoun, USE.NAMES = F)
data2
class(data2)
head(unlist(data2), 30)

# Filtering
data3 <- unlist(data2)
data3 <- Filter(function(x){nchar(x)>=2}, data3) # 2글자 이상만 필터링
data3 <- gsub("서울", "", data3) # "서울" -> ""로 변경
head(data3, 30)
data3[209]
data3 <- gsub("\\d+", "", data3) # 모든 숫자 없애기
data3[22]

data3 <- unlist(data2)
data3 <- Filter(function(x){nchar(x)>=2}, data3) # 2글자 이상만 필터링
filterFunction <- function(filterItem, items){
  for(i in 1:length(filterItem)){
    items <- gsub((filterItem[i]), "", items)
  }
  return (items)
}

testItems = data3[200:209]; testItems
data3 <- unlist(data2)
filterItem <- c("한옥","마을","남산골","전통","정원","서울","가볼만한곳","남산서울타워","야경","서울관광명")
data3 <- filterFunction(filterItem, data3); data3
data3 <- Filter(function(x){nchar(x)>=2}, data3)
head(data3, 30)
write(searchTitle, "data/서울관광명소.txt")

data4 <- read.table("data/서울관광명소.txt", fill=T)
data4; class(data4)
table(data4$V1)
wordcount <- table(data4$V1)
head(sort(wordcount, decreasing=T), 20)

library(RColorBrewer)
palete <- brewer.pal(9, "Set3") # font color
display.brewer.pal(9, "Set3")

library(wordcloud)
wordcloud(
  names(wordcount),
  freq=wordcount,
  scale=c(4,0.2), # 폰트크기 c(MAX, MIN)
  rot.per=0.25, # 회전되는 단어의 빈도
  min.freq=1, # 등장하는 단어의 최소 빈도 단위
  random.order=F, # 빈도가 큰 단어를 중앙에 두도록 함
  random.color=T, # 실행시마다 단어의 색 변화하도록 함
  colors=palete)

top10 <- head(sort(wordcount, decreasing=T), 10)
top10
pie(top10)
pie(top10, col=rainbow(10), radius=1)

pct <- round(top10/sum(top10)*100, 1)
names(top10)
lab <- paste(names(top10), "\n", pct, "%")
lab
pie(top10, main="서울시가볼만한 장소", col=rainbow(10), cex=0.7, labels=lab)

# 3D Pie chart
install.packages("plotrix")
library(plotrix)
bchart <- top10
th_pct <- round(bchart/sum(bchart)*100,1)
th_names <- names(bchart)
th_labels <- paste(th_names, "\n", "(", th_pct, ")")
pie3D(bchart, main="서울시가볼만한 장소", col=rainbow(10), cex=0.6, labels=th_labels, explode=0.05)

# bar chart
bchart <- head(sort(wordcount, decreasing=T), 10); bchart
bplot <- barplot(bchart, main="서울시가볼만한 장소", col=rainbow(10), cex.names=0.7, las=2, ylim=c(0,30))
bplot <- barplot(bchart, main="서울시가볼만한 장소", col=rainbow(10), cex.names=0.7, las=2, ylim=c(0,130))
text(x=bplot, y=bchart*1.05, labels=paste("(", pct, "%", ")"), col="navy", cex=0.7)
text(x=bplot, y=bchart*0.95, labels=paste(bchart, "건"), col="navy", cex=0.7)

bplot<- barplot(bchart, main="서울시가볼만한 장소", col=rainbow(10), cex.names=0.6, las=2, xlim=c(0,130), horiz=T)
pct <- round(bchart/sum(bchart)*100, 1)
text(y=bplot, x=bchart*0.3, labels=paste(bchart, "건"), col="navy", cex=0.7)
text(y=bplot, x=bchart*1.2, labels=paste("(", pct, "%", ")"), col="navy", cex=0.7)
