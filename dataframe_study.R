# Data Frame
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type3", "Type4")
status <- c("Poor", "Improved", "Excellent", "Poor")
admdate <- c(as.Date('2014-10-15'), as.Date('2014-11-01'), as.Date('2014-10-21'), as.Date('2014-10-28'))
patientdata <- data.frame(patientID, admdate, age, diabetes, status)
patientdata
str(patientdata)
class(patientdata)

# patientdata$
patientdata[1:2]
patientdata[c("diabetes", "status")]
patientdata$age
patientdata$admdate

# ATTACH, DETACH, WITH
mtcars; class(mtcars)
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)
attach(mtcars)
summary(mpg); plot(mpg, disp)
detach(mtcars)
with(mtcars, {print(summary(mpg))})
with(mtcars, {plot(mpg,wt)})

# 하나이상의 객체가 같은 이름을 가질 때, attach, detach 접근법은 한계가 있음
mpg<-c(25,36,47); mpg
attach(mtcars)
plot(mpg, disp)
mpg
disp
detach(mtcars)
rm(mpg)

with(mtcars, {
  + nokeepstats <- summary(mpg)
  + keepstats <<- su
})

# case identifier
patientdata <- data.frame(patientID, admdate, age, diabetes, status, row.names = patientID)
patientdata

# vector로 부터 데이터프레임 생성
no <- c(1,2,3,4)
name <- c('Apple', 'Peach', 'Banana', 'Grape')
price <- c(500,200,100,50)
qty <- c(5,2,4,7)
sales <- data.frame(NO=no, NAME=name, PRICE=price, QTY=qty);
sales; class(sales)

# 행렬로 부터 데이터프레임 생성
sales2 <- matrix(c(1, 'Apple', 500, 5,
                   2, 'Peach', 200, 2,
                   3, 'Banana', 100, 4,
                   4, 'Grape', 50, 7), nrow=4, byrow=T); sales2
colnames(sales2) <- c("NO", "NAME", "PRICE", "QTY")
df1 <- data.frame(sales2); df1
sales21 <- matrix(c(1, 'Apple', 500, 5,
                    2, 'Peach', 200, 2,
                    3, 'Banana', 100, 4,
                    4, 'Grape', 50, 7), nrow=4, byrow=T)
df21 <- data.frame(sales21); df21 
names(df21) <- c("NO", "NAME", "PRICE", "QTY")
df21
sales3 <- matrix(c(1,2,3,4,
                   'Apple', 'Peach', 'Banana', 'Grape',
                   500,200,100,50,
                   5,2,4,7), ncol=4); sales3
colnames(sales3) <- c("NO", "NAME", "PRICE", "QTY"); sales3
df2 <- data.frame(sales3); df2
sales31 <- matrix(c(1,2,3,4,
                    'Apple', 'Peach', 'Banana', 'Grape',
                    500,200,100,50,
                    5,2,4,7), ncol=4); sales31
df31 <- data.frame(sales31); df31
names(df31)<-c("NO", "NAME", "PRICE", "QTY"); df31

# Array로 부터 데이터프레임 생성
mat1 <- matrix(c(1:4), nrow=2, byrow=T); mat1
mat2 <- matrix(c(5:8), nrow=2, byrow=T); mat2
ar1 <- array(mat1, dim=c(2,2,2)); ar1
df4 <- data.frame(ar1[,,2])
names(df4)<-c('Col.1', 'Col.2')
df4; class(df4)
class(sales); class(sales$NO); class(sales$NAME); class(sales$PRICE); class(sales$QTY)
name;class(name)
sales4 <- data.frame(NO=no, NAME=name, PRICE=price, QTY=qty, stringsAsFactors=FALSE); sales4
class(sales4); class(sales4$NO); class(sales4$NAME); class(sales4$PRICE); class(sales4$QTY)
sales$NAME[2]; sales[2,]; sales[1:2,]; sales[, c(1,2)]; sales[c(2:4),]
subset(sales, qty==5); subset(sales, price>200); subset(sales, price>=100 & price<500)
subset(sales, tolower(name)=='banana')
subset(sales, toupper(name)=='BANANA')
subset(sales, qty==5, select = NO:NAME)

# rbind()
no1 <- c(1,2); no1
name1 <- c('Apple', 'Peach')
price1 <- c(500, 200)
qty1 <- c(5, 2)
dfrow1 <- data.frame(NO=no1, NAME=name1, PRICE=price1, QTY=qty1); dfrow1
no2 <- c(3,4)
name2 <- c('Banana', 'Grape')
price2 <- c(100, 50)
qty2 <- c(4,7)
dfrow2 <- data.frame(NO=no2, NAME=name2, PRICE=price2, QTY=qty2); dfrow2
dfmerge <- rbind(dfrow1, dfrow2); dfmerge

# cbind()
no3 <- c(1,2,3,4)
name3 <- c('Apple', 'Peach', 'Banana', 'Grape')
dfcol1 <- data.frame(NO=no3, NAME=name3); dfcol1
price3 <- c(500,200,100,50)
qty3 <- c(5,2,4,7)
dfcol2 <- data.frame(PRICE=price3, QTY=qty3); dfcol2
dfmerge2 <- cbind(dfcol1, dfcol2); dfmerge2

# merge()
df5 <- data.frame(name=c('Apple', 'Banana', 'Cherry'), price=c(300,200,100)); df5
df6 <- data.frame(name=c('Apple', 'Cherry', 'Berry'), qty=c(10,20,30)); df6
dfmerge3 <- merge(df5, df6); dfmerge3
dfmerge4 <- merge(df5, df6, all=T); dfmerge4

# 데이터프레임에서 특정 조건에 맞는 데이터로 새로운 형태 만들기
no; name; price; qty
df7 <- data.frame(NO=no, NAME=name, PRICE=price, QTY=qty); df7
df7sub1 <- subset(df7, select = c(NAME, PRICE, QTY)); df7sub1
df7sub2 <- subset(df7, select = -QTY); df7sub2

# 데이터프레임의 내용 확인 및 출력 순서 지정
ncol(df7); nrow(df7); names(df7); rownames(df7); colnames(df7)
df7[c(3,2,1)]
df7[,c(3,2,1)]
