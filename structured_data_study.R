# 정형 데이터수집 및 분석
data1 <- read.csv("data/서울시_표시과목별_의원현황_2018.CSV", header=T)
data1; class(data1)
View(data1)
barplot(as.matrix(data1[1:10,2:11]),
        main=paste("서울시 주요 구별 과목별 병원현황-2018년", "\n", "출처[국민건강보험공단]"),
        ylab="병원수",
        beside=T,
        col=rainbow(8),
        ylim=c(0,400))
abline(h=seq(0,400,50),lty=3,lwd=0.2)
name <- data1$표시과목
name
legend(87,400,name,cex=0.7,fill=rainbow(8),bg="white")

# 강남구 차트 그리기
name
V1 <- data1[1:10,2]
class(V1); V1
V1 <- V1/10
barplot(as.matrix(V1),
        main=paste("강남구 병원현황"),
        beside=T,
        axes=F,
        ylab="병원수(단위:10개)",
        xlab="",
        cex.names=0.85,
        las=2, ylim=c(0,40), col=rainbow(8), border="white", names.arg=name)
axis(2,ylim=seq(0,40,10))
abline(h=seq(0,40,5), lty=2)

par(mfrow=c(2,6)) # 2행 6열로 차트 배치하기
name <- data1$표시과목
barplot(as.matrix(V1),
        main=paste("강남구 병원현황"),
        beside=T,
        axes=F,
        ylab="병원수(단위:10개)",
        xlab="",
        cex.names=0.85,
        las=2, ylim=c(0,40), col=rainbow(8), border="white", names.arg=name)
axis(2,ylim=seq(0,40,10))
abline(h=seq(0,40,5), lty=2)

V2 <- data1[1:10,3] # 강동구
V2 <- V2/10
barplot(as.matrix(V2),
        main=paste("강동구 병원현황"),
        beside=T,
        axes=F,
        ylab="병원수(단위:10개)",
        xlab="",
        cex.names=0.85,
        las=2, ylim=c(0,40), col=rainbow(8), border="white", names.arg=name)
axis(2,ylim=seq(0,40,10))
abline(h=seq(0,40,5), lty=2)

V3 <- data1[1:10,4] # 강서구
V3 <- V3/10
barplot(as.matrix(V3),
        main=paste("강서구 병원현황"),
        beside=T,
        axes=F,
        ylab="병원수(단위:10개)",
        xlab="",
        cex.names=0.85,
        las=2, ylim=c(0,40), col=rainbow(8), border="white", names.arg=name)
axis(2,ylim=seq(0,40,10))
abline(h=seq(0,40,5), lty=2)
# ...

par(mfrow=c(1,1))

library(rvest)
url <- "https://www.koreabaseball.com/Record/Player/HitterBasic/Basic1.aspx"
text <- read_html(url, encoding = "utf-8")

# 기록제목
nodes <- html_nodes(text, "th")
title <- html_text(nodes)
title; length(title)
colName <- title

# 선수성적
playNodes <- html_nodes(text, "td")
playerRecord <- html_text(playNodes)
playerRecord[1:16] # 1위
playerRecord[17:32] # 2위
playerRecord[33:48] # 3위

# 프로야구 선수 연봉대비 기록분석
playerRecord
recordFunc <- function(playerRecord){
  players <- NULL
  for(i in seq(1, length(playerRecord), by=16)){
    player <- NULL
    for(j in seq(i, i+15)){
      player <- c(player, playerRecord[j])
    }
    players <- rbind(players, player)
  }
  return (players)
}
players <- recordFunc(playerRecord)
colName
colnames(players) <- colName
head(players, 5)

# 출루율 가져오기
url2 <- "https://www.koreabaseball.com/Record/Player/HitterBasic/Basic2.aspx"
text2 <- read_html(url2, encoding="utf-8")
nodes2 <- html_nodes(text2, "td")
title2 <- html_text(nodes2)

title2[11] # 출루율 OBP
title2[26]
title2[41]

obp <- NULL
length(title2)
for(i in seq(11, length(title2), by=15)){
  obp <- rbind(obp, title2[i])
}
head(obp,5); length(obp)
players <- cbind(players, obp) # 마지막 컬럼 추가
colName <- c(colName, "obp"); colName
colnames(players) <- colName
rownames(players) <- c(seq(1, nrow(players)))
head(players, 10)

# 연봉 선수조회에서 검색
salary <- c(60,32,10.5,150,27,150,140,250,32,26.5,11,45,13,35,11,43,40,56,20,47,25,156,80,24,55,8.5,9,83,120,37)
length(salary)
players <- cbind(players, "sal"=salary) # 마지막 연봉 컬럼에 추가
head(players, 5)

# 연봉대비출루율 계산
dfPlayers <- data.frame(players)
round(dfPlayers$obp/dfPlayers$sal*1000, digits=2)
dfPlayers <- data.frame(players, stringsAsFactors = F)
round(dfPlayers$obp/dfPlayers$sal*1000, digits=2)
str(dfPlayers)
for(t in seq(4, 18)){
  dfPlayers[,t] <- as.numeric(as.character(dfPlayers[,t]))
}
str(dfPlayers)
round(dfPlayers$obp/dfPlayers$sal*1000, digits=2)
dfPlayers <- cbind(dfPlayers, 'obpPerSal'=round(dfPlayers$obp/dfPlayers$sal*1000, digits=2))
colnames(dfPlayers)<-c("순위","선수명","팀명","AVG","경기수","타석","타수","득점","안타","2루타","3루타","홈런","루타","타점","희생번트","희생플라이","출루율","연봉","연봉대비출루율")
View(dfPlayers)
write.csv(dfPlayers, file="data/야구성적.csv")

# bar chart
data <- read.csv("data/야구성적.csv", header=T, encoding="CP949")
data <- data[,2:20]
head(data, 10)
bp <- barplot(data$연봉대비출루율,
              main=paste("야구 선수별 연봉 대비 출루율 분석", "\n"),
              col=rainbow(25),
              cex.names=0.7,
              names=data$선수명,
              las=2,
              ylim=c(0,50))
aver <- round(mean(data$연봉대비출루율), digits=2)
abline(h=aver, col="navy")
lbl <- paste(aver, '%', "(평균출루율)")
text(x=aver-6, y=aver+1, col="red", cex=0.7, labels=lbl)
text(x=bp*1.01,
     y=data$연봉대비출루율*1.05,
     col="black",
     cex=0.7,
     labels=paste(data$연봉대비출루율, '%'))
title(ylab="연봉대비출루율", col.lab="red")

########################################
# 나이팅게일 차트
########################################
colnames(data)
row.names(data) <- data$선수명
data2 <- data[,c(8,9,10,11,12,13,15)] # 타수, 득점, 안타, 2루타, 3루타, 홈런, 타점
head(data2,5)

stars(data2,
      flip.labels = F,
      draw.segments = T,
      frame.plot = T,
      full = T,
      main = '야구선수별 주요 성적 분석-2020년',
      key.loc = c(15,3))

data3 <- read.csv("data/야구성적.csv", header=T, encoding="CP949")
data3$타점 <- as.numeric(as.character(data3$타점))
data3$연봉 <- as.numeric(as.character(data3$연봉))
cal <- round(data3$타점/data3$연봉*10, digits=2)
data3 <- data[,c(2,19)] # 선수명, 연봉대비출루율만 골라내기
data3 <- cbind(data3, "연봉대비타점율"=cal)
head(data3, 5)
line1 <- data3$연봉대비출루율
line2 <- data3$연봉대비타점율

par(mar=c(5,4,4,4)+0.1)
plot(line1,
     type="o",
     axes=F,
     ylab="",
     xlab="",
     ylim=c(0,70),
     lty=2,
     col="navy",
     main="한국 프로야구선수별 기록분석 2018년",
     lwd = 2)
axis(1, at=1:30, lab=data3$선수명, las=2)
axis(2, las=1)
mtext(side=2, line=2.5, "연봉대비출루율")

par(new=T)
plot(line2,
     type="o",
     axes=F,
     ylab="",
     xlab="",
     ylim=c(0,70),
     lty=2,
     col="hotpink")
axis(4, las=1)
mtext(side=4, line=2.5, "연봉대비타점율")
abline(h=seq(0,70,5), v=seq(1,30,1), col="skyblue", lty=2)
legend(22, 70, names(data3[2:3]), cex=0.7, col=c("navy", "hotpink"), lty=1, lwd=2, bg="white")
