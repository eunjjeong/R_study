# plot()
var1 <- c(1,2,3,4,5)
plot(var1)
var2 <- c(2,2,2)
plot(var2)
# x, y 축의 값을 다 지정해서 출력하기
x <- 1:3
y <- 3:1
plot(x, y)
# x, y 축의 최대 한계값 지정하기
plot(x, y, xlim=c(1,10), ylim=c(1,5))
# x축과 y축 제목, 그래프 제목 지정해서 출력
plot(x,y,xlim=c(1,10), ylim=c(1,5), xlab="x축 값", ylab="y축 값", main="Plot Test")
# 조금 더 멋진 그래프 예
v1 <- c(100,130,120,160,150)
plot(v1, type='o', col='red', ylim=c(0,200), axes=F, ann=F)
axis(1, at=1:5, lab=c("MON", "TUE", "WED", "THU", "FRI"))
axis(2, ylim=c(0,200))
title(main="FRUIT", col.main="red", font.main=4)
title(xlab="DAY", col.lab="black")
title(ylab="PRICE", col.lab="black")

# 그래프의 배치 조정하기 (mfrow)
v1 <- c(100,130,120,160,150)
par(mfrow=c(1,3))
plot(v1, type="o")
plot(v1, type="s")
plot(v1, type="l")
pie(v1)
plot(v1, type="o")
barplot(v1)

# 그래프 그릴 때 여백 조정하기
par(mfrow=c(1,1))
a <- c(1,2,3)
plot(a, xlab="aaa")
par(mgp=c(3,1,0))
plot(a, xlab="aaa")
par(mgp=c(0,1,0)) # mgp=c(제목위치, 지표값위치, 지표선위치)
plot(a, xlab='aaa')
par(mgp=c(3,2,0))
plot(a, xlab='aaa')
par(mgp=c(3,2,1))
plot(a, xlab='aaa')

# oma 옵션 테스트하기 <- 그래프 전체의 여백 조정하기 입니다
par(oma=c(2,1,0,0))
plot(a, xlab='aaa')
par(oma=c(0,2,0,0))
plot(a, xlab='aaa')

# 여러개의 그래프를 중첩으로 그리기
v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1, type='s', col='red', ylim=c(1,5))
par(new=T) # 이 부분이 중복 허용 부분
plot(v2, type='o', col='blue', ylim=c(1,5))
par(new=T) # 이 부분이 중복 허용 부분
plot(v3, type='l', col='green')

plot(v1, type='s', col='red', ylim=c(1,10))
lines(v2, type='o', col='blue', ylim=c(1,5))
lines(v3, type='l', col='pink', ylim=c(1,15))

# 범례 추가하기
# legend(x 축 위치, y 축 위치, 내용, cex=글자크기, col=색상, pch=크기, lty=선모양)
plot(v1, type='s', col='red', ylim=c(1,10))
lines(v2, type='o', col='skyblue', ylim=c(1,5))
lines(v3, type='l', col='pink', ylim=c(1,15))
legend(4, 9.5, c("v1","v2","v3"), cex=0.8, col=c("red", "skyblue", "pink"), lty=1)

# barplot() 막대그래프
x <- c(1,2,3,4,5)
barplot(x)
barplot(x, horiz=T) # 그래프를 가로로 출력하기
# 그룹으로 묶어서 출력시키기 - beside=T 사용
x <- matrix(c(5,4,3,2),2,2)
barplot(x, beside=T, names=c(5,3), col=c("hotpink", "skyblue"))
x
# 하나의 막대 그래프로 출력하기
barplot(x, names=c(5,3), col=c("hotpink", "skyblue"), ylim=c(0,12))
# 그룹으로 묶어서 가로로 출력시키기 - beside=T, horiz=T 사용
par(oma=c(1,0.5,1,0.5))
# oma부분은 그래프내의 여백을 표시하는데 (하, 왼쪽, 상, 오른쪽) 여백을 지정하는 값
barplot(x, names=c(5,3), beside=T, col=c("hotpink", "skyblue"), horiz=T)
# 하나의 막대 그래프에 두개 합쳐서 눕혀서 출력하기
barplot(x, horiz=T, names=c(5,3), col=c("hotpink", "skyblue"), xlim=c(0,12))
# 여러 막대 그래프를 그룹으로 묶어서 한꺼번에 출력
v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame(BANANA=v1, CHERRY=v2, ORANGE=v3)
qty; class(qty); as.matrix(qty)
# nrow는 dataframe의 행의 수를 출력하는 함수
barplot(as.matrix(qty), main="Fruit's Sales QTY", beside=T, col=rainbow(nrow(qty)), ylim=c(0,400)) 
# 하나의 막대 그래프에 여러가지 내용을 한꺼번에 출력
barplot(t(qty),
        main="Fruits Sales QTY",
        ylim=c(0,900),
        col=rainbow(length(qty)),
        space=0.1,
        cex.axis = 0.8,
        las=1,
        names.arg=c("MON", "TUE", "WED", "THU", "FRI"),
        cex=0.8)
legend(0.1, 800, names(qty), cex=0.7, fill=rainbow(length(qty)))
length(qty)
qty
t(qty)
length(t(qty))

# 조건을 주고 그래프 그리기
# peach 값이 200이상일 경우는 "red", 180-199는 "yellow", 그 이하는 "green" 색으로 출력
peach <- c(180,200,250,198,170)
colors <- c()
for(i in 1:length(peach)){
  if(peach[i]>=200){
    colors <- c(colors, "red")
  } else if (peach[i] >= 180){
    colors <- c(colors, "yellow")
  } else{
    colors <- c(colors, "green")
  }
}
barplot(peach, main="Peach Sales QTY", names.arg=c("MON", "TUE", "WED", "THU", "FRI"), col=colors)

# hist()
height <- c(182,175,167,172,163,178,181,166,159,155)
height; class(height)
hist(height, main="histogram of height")

par(mfrow=c(1,2), oma=c(2,2,0.1,0.1))
hist <- c(1,1,2,3,3,3)
hist(hist)
plot(hist, main="plot")

# pie()
par(mfrow=c(1,1), oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1, radius=1)

# 시작 각도를 90도로 지정하기
pie(p1, radius=1, init.angle=90)
# 색깔과 label 명을 지정
pie(p1,
    radius=1,
    init.angle=90,
    col=rainbow(length(p1)),
    label=c("Week 1", "Week 2", "Week 3", "Week 4"))
# 수치 값을 함께 출력
p1 <- c(10,20,30,40)
pct <- round(p1/sum(p1)*100,1)
lab <- paste(pct, " %")
p1; pct; lab
pie(p1,
    radius=1,
    init.angle=90,
    col=rainbow(length(p1)),
    label=lab)
legend(1,
       1.1,
       c("Week 1", "Week 2", "Week 3", "Week 4"),
       cex=0.5,
       fill=rainbow(length(p1)))
# 범례를 생략하고 그래프에 바로 출력하기
lab1 <- c("Week 1", "Week 2", "Week 3", "Week 4")
lab2 <- paste(lab1, "\n", pct, " %")
pie(p1,
    radius=1,
    init.angle=90,
    col=rainbow(length(p1)),
    label=lab2)

# pie3D()
install.packages("plotrix")
library(plotrix)

p1 <- c(10,20,30,40,50)
f_day <- round(p1/sum(p1)*100,1)
f_label <- paste(f_day, "%")
pie3D(p1,
      main="3D Pie Chart",
      col=rainbow(length(p1)),
      cex=0.5,
      labels=f_label,
      explode=0.05 ) # explode : 파이들의 간격
legend(0.5,
       1,
       c("MON", "TUE", "WED", "THU", "FRI"),
       cex=0.4,
       fill=rainbow(length(p1)))

# boxplot()
v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1,v2,v3)
boxplot(v1,v2,v3,
        col=c("blue", "yellow", "pink"),
        names=c("Blue", "Yellow", "Pink"),
        horizontal=T)

# igraph()
install.packages("igraph")
library(igraph)

g1 <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(g1)

name <- c('서진수 대표이사', '일지매 부장', '김유신 과장', '손흥민 대리', '노정호 대리', '이순신 부장', '유관순 과장', '신사임당 대리', '강감찬 부장', '광개토 과장', '정몽주 대리')
pemp <- c('서진수 대표이사', '서진수 대표이사', '일지매 부장', '김유신 과장', '김유신 과장', '서진수 대표이사', '이순신 부장', '유관순 과장', '서진수 대표이사', '강감찬 부장', '광개토 과장')
name; pemp
emp <- data.frame(이름=name, 상사이름=pemp)
emp
g <- graph.data.frame(emp, directed=T)
plot(g,
     layout=layout.fruchterman.reingold,
     vertex.size=8,
     edge.arrow.size=0.5)
str(g)

# 화살표와 이름 안 나오게 출력
g3 <- graph.data.frame(emp, directed=F)
plot(g3,
     layout=layout.fruchterman.reingold,
     vertex.size=8,
     edge.arrow.size=0.5,
     vertex.label=NA)

# d3Network 설치
install.packages("devtools")
library(devtools)
install.packages("RCurl")
library(RCurl)
install_github("christophergandrud/d3Network", force=T)
library(d3Network)
library(igraph)

name <- c('Angela Bassett', 'Jessica Lange', 'Winona Ryder', 'Michelle Pteitter', 'Whoopi Goldberg', 'Emma Thompson', 'Julia Roberts', 'Sharon Stone', 'Meryl Streep', 'Susan Sarandon', 'Nicole Kidman')
pemp <- c('Angela Bassett', 'Angela Bassett', 'Jessica Lange', 'Winona Ryder', 'Winona Ryder', 'Angela Bassett', 'Emma Thompson', 'Julia Roberts', 'Angela Bassett', 'Meryl Streep', 'Susan Sarandon')
emp <- data.frame(이름=name, 상사이름=pemp)
emp
d3SimpleNetwork(emp, width=600, height=600, file="d3.html")


g <- read.csv("data/군집분석.csv", head=T);
g_graph <- data.frame("학생"=g$학생, "교수"=g$교수)
head(g_graph, 10)

# ggplot2
install.packages("ggplot2")
library(ggplot2)
library(igraph)

plot(g,
     layout=layout.fruchterman.reingold,
     vertex.size=2,
     edge.arrow.size=0.5,
     vertex.color="green",
     vertex.label=NA)

plot(g,
     layout=layout.kamada.kawai,
     vertex.size=2,
     edge.arrow.size=0.5,
     vertex.label=NA)

g <- read.csv("data/군집분석.csv", head=T);
graph <- data.frame("학생"=g$학생, "교수"=g$교수)
head(graph, 5)
g <- graph.data.frame(graph, directed=T)
library(stringr)
gubun1 <- V(g)$name
head(gubun1, 5)
gubun <- str_sub(gubun1, start=1, end=1)
head(gubun, 5)

# 학생일 경우 컬러를 red 교수일 경우 컬러를 green
colors <- c()
for (i in 1:length(gubun)) {
  if (gubun[i] == 'S') {
    colors <- c(colors, "red")
  } else {
    colors <- c(colors, "green")
  }
}

# 학생일 경우 점의 크기를 2, 교수일 경우 점의 크기를 6
sizes <- c()
for (i in 1:length(gubun)) {
  if (gubun[i] == 'S') {
    sizes <- c(sizes, 2)
  } else {
    sizes <- c(sizes, 6)
  }
}

plot(g,
     layout=layout.fruchterman.reingold,
     vertex.size=sizes,
     edge.arrow.size=0.5,
     vertex.color=colors)

# 이름 없애기
plot(g,
     layout=layout.fruchterman.reingold,
     vertex.size=sizes,
     edge.arrow.size=0.5,
     vertex.color=colors,
     vertex.label=NA)

# 화살표 표시 없애기
plot(g,
     layout=layout.fruchterman.reingold,
     vertex.size=sizes,
     edge.arrow.size=0,
     vertex.color=colors,
     vertex.label=NA)

# 학생과 교수의 도형 모양 다르게 하고 화살표 없애고 색상도 다르게 하기
plot(g,
     layout=layout.kamada.kawai,
     vertex.size=sizes,
     edge.arrow.size=0,
     vertex.color=colors,
     vertex.label=NA)

# 교수 모양은 square 교수의 점의 모양은 circle
shapes <- c()
for (i in 1:length(gubun)){
  if (gubun[i] == 'S'){
    shapes <- c(shapes, "circle")
  } else {
    shapes <- c(shapes, "square")
  }
}

plot(g,
     layout=layout.kamada.kawai,
     vertex.size=sizes,
     edge.arrow.size=0,
     vertex.color=colors,
     vertex.label=NA,
     vertex.shape=shapes)

# d3Network() 패키지로 메르스 환자 표시
library(devtools)
library(RCurl)
library(d3Network)

virus1 <- read.csv("data/메르스전염현황.csv", header=T)
head(virus1, 5)
d3SimpleNetwork(virus1, width=900, height=1200, file="data/mers.html")

# treemap
install.packages("treemap")
library("treemap")

total <- read.csv("data/학생시험결과전체점수.csv", header=T, sep=",")
head(total, 5)
treemap(total, vSize="점수", index=c("점수", "이름"))
treemap(total, vSize="점수", index=c("조", "이름"))
treemap(total, vSize="점수", index=c("점수", "조", "이름"))

# stars() 함수로 비교분석
total <- read.table("data/학생별전체성적_new.txt", header=T, sep=",")
head(total, 5)

# 각 행번호로 되어 있는 것을 이름으로 변경해 주는 작업 
# 학생별로 각 과목 성적을 불러올 때 이름이 필요해서 이 작업을 진행
row.names(total) <- total$이름 
head(total, 5)
total <- total[, 2:7]
head(total, 5)
stars(total, # dataframe 이나 matrix 형태의 다변량 데이터셋 이름
      key.loc = c(8,4,6), # x, y 좌표 위치에 각 변수들의 이름을 범례로 표시
      frame.plot=T, # 그래프 외곽 테두리
      nrow=4, ncol=4,
      flip.labels = T,
      main="학생별 과목별 성적분석",
      draw.segments = F)

stars(total,
      key.loc = c(8.5, 2.1),
      frame.plot=F,
      nrow=3, ncol=4,
      flip.labels=T,
      full=T,
      main="학생별 과목별 성적분석",
      draw.segment=T)

stars(total,
      key.loc = c(0, 7),
      flip.labels = F,
      frame.plot=T,
      full=F,
      main="학생별 과목별 다이어그램-반원차트",
      draw.segments = T)

# radarchart()
install.packages("fmsb")
library(fmsb)

layout <- data.frame(분석력=c(5,1), 창의력=c(15,3), 판단력=c(3,0), 리더쉽=c(5,1), 사교성=c(5,1))
class(layout); layout
set.seed(123) # 임의의 데이터를 생성
data1 <- data.frame(
  분석력=runif(3,1,5), 
  창의력=rnorm(3,10,2), 
  판단력=c(0.5,NA,3), 
  리더쉽=runif(3,1,5), 
  사교성=c(5,2.5,4))
data1
data2 <- rbind(layout, data1)
data2
op <- par(mar=c(1,0.5,3,1), mfrow=c(2,2)) # 여백과 배치를 조정
radarchart(data2, axistype=1, seg=5, plty=1, title='one type')
radarchart(data2, axistype=2, pcol=topo.colors(3), plty=1, title='two type')
radarchart(data2, axistype=3, pty=32, plty=1, axislabcol="grey", na.itp=F, title='three type')
radarchart(data2, axistype=0, plwd=1:5, pcol=1, title='four type')

par(mfrow=c(1,1))
plot(1:15)
abline(h=8)
segments(10,2,12,3) # 점 (2,2)와 (3,3)을 지나는 선분 그리기
rect(1,6,3,8) # 사각형 그리기
arrows(5,5,7,7) # 화살표 그리기
text(8,9,"TEXT") # 글자 쓰기
text(2,8,"TEST",srt=45) # (2,8) 지점에 "TEST" 라는 글자를 45도 기울여 출력
title("THIS IS TEST", "SUB") # 제목 표시하기

# ggplot2 
# 함수의 확장 버전으로 다양한 형태로 데이터를 표현가능
library(ggplot2)
koreanScore <- read.table("data/학생별국어성적_new.txt", header=T, sep=",")
koreanScore
# ggplot(dataframe, aes(x=x축, y=축)) + geom 함수
ggplot(koreanScore, aes(x=이름, y=점수)) + geom_point()
ggplot(koreanScore, aes(x=이름, y=점수)) + geom_bar(stat="identity")
ggplot(koreanScore, aes(x=이름, y=점수)) + geom_bar(stat="identity", fill="pink", colour="hotpink")
gg <- ggplot(koreanScore, aes(x=이름, y=점수)) + geom_bar(stat="identity", fill="pink", colour="hotpink")
gg + theme(axis.text.x=element_text(angle=10, hjust=1, vjust=1, color="navy", size=12))

# 하나의 막대에 여러 항목 나오도록 출력
score_kem <- read.csv("data/학생별과목별성적_국영수_new.csv", header=T)
View(head(score_kem, 9))
library(plyr)
sort_kem1 <- arrange(score_kem, 이름, 과목) # 이름 과목 sort
View(head(sort_kem1, 9))

# ddply(데이터, (그룹 지을 변수명), 데이터처리)
sort_kem2 <- ddply(sort_kem1, "이름", transform, 누적합계=cumsum(점수))
View(head(sort_kem2, 9))
sort_kem3 <- ddply(sort_kem2, "이름", transform, 누적합계=cumsum(점수), label=cumsum(점수)-0.5*점수)
View(head(sort_kem3, 9))

ggplot(sort_kem3, aes(x=이름, y=점수, fill=과목)) + geom_bar(stat="identity") + geom_text(aes(y=label, label=paste(점수, '점')), colour="black", size=4)
ggplot(sort_kem3, aes(x=이름, y=점수, fill=과목)) + geom_bar(stat="identity") + geom_text(aes(y=label, label=paste(점수, '점')), colour="black", size=4) + guides(fill=guide_legend(reverse=T)) + theme(axis.text.x=element_text(angle=10, hjust=1, vjust=1, colour="navy", size=8))

# geom_segment()
score <- read.table("data/학생별전체성적_new.txt", header=T, sep=",")
score
score[,c("이름", "영어")]
ggplot(score, aes(x=영어, y=reorder(이름,영어))) + geom_point(size=6) + theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(color="hotpink", linetype="dashed"))
ggplot(score, aes(x=영어, y=reorder(이름,영어))) + 
  geom_segment(aes(yend=이름), xend=0, color="red") +
  geom_point(size=6, color="pink") + 
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(color="hotpink", linetype="dashed"))

# geom_point() 함수와 scatterplots
install.packages("gridExtra")
library(gridExtra)
v_mt <- mtcars
View(head(v_mt, 10))

graph1 <- ggplot(v_mt, aes(x=hp, y=mpg)) + geom_point()
graph1
graph2 <- graph1 + geom_point(colour="skyblue") # color change
graph2
graph3 <- graph2 + geom_point(aes(color=factor(am))) # 종류별로 다른 색상 지정하기
graph3
graph4 <- graph1 + geom_point(colour="orange", size = 7) # 크기 지정하기
graph4
graph5 <- graph1 + geom_point(aes(size=wt)) # 값 별로 다른 크기 지정하기
graph5
graph6 <- graph1 + geom_point(aes(shape=factor(am), size=wt)) # 종류별로 크기와 모양 지정하기
graph6
graph7 <- graph1 +
  geom_point(aes(shape=factor(am), color=factor(am), size=wt)) +
  scale_color_manual(values=c("hotpink", "pink")) # 종류별로 크기와 모양 지정하기
graph7
graph8 <- graph1 + geom_point(color="pink") + geom_line(color="hotpink") # 선 추가하기
graph8
graph9 <- graph1 + geom_point(color="blue") +
  geom_line(color="skyblue") +
  labs(x="마력", y="연비(mile/gallon)") # x축, y축 이름 바꾸기
graph9

# geom_line()
three <- read.csv("data/학생별과목별성적_3기_3명.csv", header=T)
View(head(three, 10))

library(plyr)
sort_score <- arrange(three, 이름, 과목)
View(head(sort_score, 10))

ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름)) + geom_line()
ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름)) + geom_line() + geom_point()
ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름, fill=이름)) + geom_line() + 
  geom_point(size=4, shape=22)

# geom_area()
dis <- read.csv("data/1군전염병발병현황_년도별.csv", stringsAsFactors=F)
View(head(dis, 10))
ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) + geom_line()
ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) + geom_area()
ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) + geom_area(color="hotpink", fill="pink", alpha=0.4)
ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) + geom_area(fill="pink", alpha=0.4) +
  geom_line(color="red")
