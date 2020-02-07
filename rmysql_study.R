# RMySQL
install.packages("RMySQL")
library(RMySQL)
con <- dbConnect(MySQL(),
                 user="user_coffee",
                 password="rootroot",
                 dbname="coffee",
                 host="localhost")
show(con)
dbDisconnect(con)

# 데이터 내용 확인
# dbGetQuery()
con <- dbConnect(MySQL(),
                 user="user_coffee",
                 password="rootroot",
                 dbname="coffee",
                 host="localhost")
sql <- "select * from sale"
rs <- dbGetQuery(con, sql)
rs
dbDisconnect(con)

# dbReadTable()
con <- dbConnect(MySQL(),
                 user="user_coffee",
                 password="rootroot",
                 dbname="coffee",
                 host="localhost")
rs <- dbGetQuery(con, sql)
subset(rs, code=="A002")
dbDisconnect(con)

# Database Pool 이용
# Database Pool 생성
devtools::install_github("rstudio/pool")
library(pool)
pool <- dbPool(
  drv = RMySQL::MySQL(),
  dbname = "coffee",
  host="localhost",
  username="user_coffee",
  password="rootroot"
)

# dbGetInfo() Pool에 대한 정보를 제공
poolInfo <- dbGetInfo(pool)
str(poolInfo)
# Database Pool Close
poolClose(pool)

# parameter
pool <- dbPool(
  drv = RMySQL::MySQL(),
  dbname = "coffee",
  host="localhost",
  username="user_coffee",
  password="rootroot",
  minSize = 10,
  maxSize = Inf, # this could have been omitted since it's the default
  idleTimeout = 3600000 # one hour
)

# dbGetInfo() Pool에 대한 정보를 제공
poolInfo <- dbGetInfo(pool)
str(poolInfo)
# example 1
pool <- dbPool(
  drv = RMySQL::MySQL(),
  dbname = "coffee",
  host="localhost",
  username="user_coffee",
  password="rootroot"
)
con <- poolCheckout(pool)
dbGetQuery(con, "select*from sale")
dbGetQuery(con, "select*from sale where code='B001'")
poolReturn(con)

# DBI 트랜잭션 함수를 사용
con <- poolCheckout(pool)
dbBegin(con)
dbGetQuery(con, "select*from sale")
dbGetQuery(con, "select*from sale where code='B001'")
dbCommit(con) # or dbRollback(conn) if somthing went wrong
poolReturn(con)

sale_new <- data.frame(
  code="A003",
  saleCnt=200,
  marginRate=10,
  stringsAsFactors = F)
sale_new
conn <- poolCheckout(pool)
dbBegin(conn)

# 데이터프레임을 테이블로 추가하기
dbWriteTable(conn, "sale", sale_new, append=T, row.names=F)
# 테이블을 데이터프레임으로 불러오기
dbReadTable(conn, "sale")
dbCommit(conn)
poolReturn(conn)

# sqldf() 패키지
install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits
detach("package:RMySQL")
sqldf('select * from Fruits')
sqldf("select * from Fruits where Fruit='Apples'")
sqldf("select * from Fruits limit 3")
sqldf("select * from Fruits order by Year")
sqldf("select sum(Sales) from Fruits")
sqldf('select max(Sales) as MAX, min(Sales) MIN, AVG(Sales) AVG from Fruits')
sqldf('select Fruit, sum(Sales) as Sales_Total from Fruits group by Fruit')
strSql <- "select * from Fruits where sales > (select Sales from Fruits where Expenses=78)"
sqldf(strSql)
strSql <- "select * from Fruits where Sales IN (select Sales from Fruits where Sales>95)"
sqldf(strSql)
sqldf(c("UPDATE Fruits SET Profit=50 WHERE Fruit='Apples' AND Year=2008", "SELECT * FROM Fruits"))
sqldf(c("DELETE FROM Fruits WHERE Fruit='Apples' AND Year=2008", "SELECT * FROM Fruits"))
