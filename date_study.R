# 날짜
Sys.Date()
date()
Sys.time()
class(Sys.Date())

as.Date("2020-12-31")
as.Date("12/31/2020")
as.Date("12/31/2020", format="%m/%d/%Y")

today <- Sys.Date()
today
format(today, format="%Y/%m/%d %A")
d <- today
weekdays(d)
d+7
d + 1:7
weekdays(d+1:7)

# from: 시작날짜 to: 종료날짜 by: 증가분
start <- as.Date("2021-01-01")
end <- as.Date("2021-01-31")
seq(from=start, to=end, by=1)
seq(from=start, by=1, length.out=7)
seq(from=start, by="7 days", length.out=9)
seq(from=start, by="week", length.out=9)
seq(from=start, by="month", length.out=12)
seq(from=start, by="3 month", length.out=4)
seq(from=start, by="year", length.out=10)

seq(from=as.Date("2020-01-30"), by="month", length.out=6)
start <- as.Date("2020-01-01")
qrt <- seq(from=start, by="3 month", length.out=4)
qrt
months(qrt)
quarters(qrt)

# 날짜 + 시간 정보 저장
# as.POSIXct()- 숫자 벡터, as.POSIXlt()-리스트
pct <- as.POSIXct("2020/03/15, 15:03:04", format="%Y/%m/%d, %H:%M:%S"); pct
class(pct); as.integer(pct)
plt <- as.POSIXlt("2020/03/15, 15:03:04", format="%Y/%m/%d, %H:%M:%S"); plt; class(plt)
unclass(plt)
plt$mday; plt$mon; plt$year; plt$wday; plt$hour
# year + 1900
dposix <- as.Date("2020-12-31"); dposix
as.POSIXlt(dposix)$wday
as.POSIXlt(dposix)$yday
as.POSIXlt(dposix)$year + 1900
as.POSIXlt(dposix)$mon + 1

# strptime() - 텍스트로 주어진 날짜와 시간을 POSIXlt 객체로 변환
class(c("2020-12-31", format="%Y-%m-%d"))
strptime("2020-12-31", format="%Y-%m-%d")
class(strptime("2020-12-31", format="%Y-%m-%d"))
strptime("2020-12-31", format="%Y-%m-%d")$year + 1900
dates <- c("05/05/81", "06/06/92", "08/15/03", "10/03/14", "12/25/25")
times <- c("22:05:19", "20:29:46", "05:03:30", "17:11:05", "15:36:25")
dt <- paste(dates, times)
dt; class(dt)
strptime(dt, "%m/%d/%y %H:%M:%S"); class(strptime(dt, "%m/%d/%y %H:%M:%S"))

moon <- as.POSIXct("1969/07/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S", tz="UTC"); moon
format(moon, "The time of the Apollo moon landing was %Y-%m-%d, at %H:%M:%S.")
format(moon, "인류 최초의 달 착륙은 %Y년 %m월 %d일, %H시 %M분 %S초에 이루어졌다.")

# ISOdate()
y <- 2020; m <- 12; d <- 31
ISOdate(y, m, d)
class(ISOdate(y, m, d))
# 시간 정보가 필요 없을 경우
as.Date(ISOdate(y, m, d)); class(as.Date(ISOdate(y, m, d))) 
years <- c(2020:2023)
months <- seq(from=1, to=10, by=3)
days <- c(12,19,25,17)
ISOdate(years, months, days); class(ISOdate(years, months, days))
as.Date(ISOdate(years, months, days))

# Julian date (1970년 1월 1일 이후 경과된 일수로 저장)
jdate <- as.Date("2020-12-31")
as.integer(jdate)
julian(jdate)
as.integer(as.Date("1970-01-01"))
as.integer(as.Date("1969-12-31"))
as.integer(as.Date("1970-01-02"))
as.integer(as.Date("1970-01-03"))

moon <- as.POSIXct("1969/07/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S", tz="UTC")
moon
moon + 2*60*60 # + 2시간 
# 일주일 후와 일주일 전
moon + 7*24*60*60
moon - 7*24*60*60
# Date 객체는 일단위 계산
as.Date(moon)+7
# 1988년 서울올림픽 개최일로부터 2018년 평창 동계올림픽 개최일까지의 기간 일수
start <- as.Date("1988-09-17")
end <- as.Date("2018-02-09")
days <- end - start; days

# difftime()-기간 간격 계산
today <- Sys.Date(); today; class(today)
Dooly <- as.Date("1983-04-22"); Dooly; class(Dooly)
difftime(today, Dooly, units="weeks")
moon <- as.POSIXct("1969/07/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S", tz="UTC")
moon; class(moon)
Sys.time(); moon;
Sys.time() > moon
Sys.Date(); as.Date(moon)
Sys.Date() > as.Date(moon)
period <- seq(as.POSIXct("1950-01-01", tz="UTC"), by="10 years", length.out=5)
period; class(period)
period > moon