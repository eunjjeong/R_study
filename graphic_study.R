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
