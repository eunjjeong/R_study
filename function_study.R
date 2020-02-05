# 함수
f1 <- function() print("function")
f1()

f2 <- function(num){
  print("TEST");
  print(num)
}
f2(100)

f3 <- function(p="R"){
  print(p)
}
f3()
f3(p="PYTHON")

f4 <- function(p1="hello", p2){
  for(i in 1:p2){
    print(p1)
  }
}
f4(p2=1)
f4(p1="hi", p2=4)
f4("abc", 3)

f5 <- function(...){
  print("TEST");
  data <- c(...);
  print(length(data))
}
f5(10, 20, 30, 40, 50)
f5('abc', T, 10, 20)

f5_1 <- function(...){
  print("TEST");
  data <- c(...);
  for(i in data){
    print(i);
  }
  print(length(data))
}
f5_1(10, 20, 30, 40, 50)
f5_1('abc', T, 10, 20)

f6 <- function(...){
  print("수행시작")
  data<-c(...)
  for(item in data){
    print(item);
  }
  return(length(data))
}
f6()
f6(10)
f6(10, 20, 30)
f6(10, 'abc', T, F)

f7 <- function(...){
  data<-c(...)
  sum<-0;
  for(item in data){
    if(is.numeric(item))
      sum <- sum+item
    else
      print(item)
  }
  return(sum)
}
f7(10, 20, 30)
f7(10, 20, "test", 30, 40)

# 기본 함수
vec1 <- c(1,2,3,4,5)
vec2 <- c('a', 'b', 'c', 'd', 'e')
class(vec1); class(vec2)
max(vec1) # 숫자의 최대값
max(vec2) # 문자의 최대값
mean(vec1) # 평균값
mean(vec2) # error
min(vec1) # 숫자의 최소값
min(vec2) # 문자의 최소값
sd(vec1) # 표준편차
sum(vec1) # 합계
var(vec1) # 분산

# aggregate 함수 - 데이터 프레임 상대로 주어진 함수 값 구하기
install.packages("googleVis")
library(googleVis)
Fruits
aggregate(Fruits$Sales, by=list(Fruits$Year), sum) # 년도 별로 Sales 된 수량을 sum 한 결과
aggregate(Fruits$Sales, by=list(Fruits$Fruit), sum) # Fruit 별로 Sales 된 수량을 sum 한 결과
aggregate(Fruits$Sales, by=list(Fruits$Fruit), max)
aggregate(Fruits$Sales, by=list(Fruits$Fruit, Fruits$Year), max)

# data.table 함수
install.packages("data.table")
library(data.table)
data <- data.table(Fruits); data
data[, sum(Sales), by=Year]
data[, sum(Sales), by=Location]
data[, sum(Sales), keyby=Location] # keyby를 쓰면 정렬이 됨
data[Year>2009, sum(Sales), by=Year:Fruit]

# apply(x-배열또는행렬(대상), MARGIN-함수를적용하는방향 1:행 2:열, FUN-적용할 함수)
# 배열또는 행렬에 사용 결과를 벡터, 배열, 리스트로 반환
mat9 <- matrix(1:9, ncol=3); mat9
apply(mat9, 1, "sum") # 행방향 합계
apply(mat9, 2, sum) # 열방향 합계
apply(mat9[,2:3], 2, max) # 2열과 3열의 최대값
apply(mat9, c(1,2), length) # 각 행 열의 길이

f9 <- function(var_matrix, mar, funName){
  m<-apply(var_matrix, mar, funName)
  if(is.matrix(m)){
    for(i in 1:nrow(m)){
      cat(m[,i], "\r\n");
    }
  }else{
    cat(m, "\r\n")
  }
  cat("Vector", is.vector(m), "\r\n");
  cat("Matrix", is.matrix(m), "\r\n");
  cat("List", is.list(m), "\r\n")
  }
f9(mat9, 1, "sum")
f9(mat9, 2, "sum")
f9(mat9[,2:3], 2, "max")
f9(mat9, c(1,2), "length")

# lapply() / sapply()
# lapply 벡터, 리스트 또는 표현식에 함수를 적용하여 그 결과를 리스트로 반환
# sapply lapply와 유사하나 결과를 가능한 심플한 데이터셋으로 반환
list1 <- list(Fruits$Sales); list1
list2 <- list(Fruits$Profit); list2
lapply(c(list1, list2), max)
sapply(c(list1, list2), max)
lapply(Fruits[,c(4,5)], max)
sapply(Fruits[,c(4,5)], max)

# tapply(출력값, 기준컬럼, 적용함수), mapply(함수, 벡터1, 벡터2, ...)
tapply(Sales, Fruit, sum)
attach(Fruits)
# Fruits 데이터 프레임에서 각 컬럼 이름을 변수명 처럼 처리해서 데이터를 쉽게 관리하게 하는 기능
Fruits
tapply(Sales, Fruit, sum)
tapply(Sales, Year, sum)
vec1 <- c(1,2,3,4,5); vec1
vec2 <- c(10,20,30,40,50); vec2
vec3 <- c(100,200,300,400,500); vec3
mapply(sum, vec1, vec2, vec3)

# string
library(stringr)
testString <- c('apple', 'Apple', 'banana', 'pineapple'); testString
str_detect(testString, 'A') # 대문자 A 있는 단어 찾기
str_detect(testString, '^a') # 첫글자가 'a'인 단어 찾기
str_detect(testString, 'e$') # 마지막 글자가 'e'인 단어 찾기
str_detect(testString, '^[aA]') # 첫글자가 'a' 또는 'A' 인 단어 찾기
str_detect(testString, '[aA]') # 단어에'a' 또는 'A' 인 단어 찾기
str_detect(testString, str_to_upper('a'))
str_count(testString, str_to_lower('a')) # 주어진 단어에서 해당 글자 count
str_c("apple", "banana") # 문자열 합쳐서 출력
str_c("Fruits : ", testString)
str_c(testString, " name is ", testString)
str_c(testString, collapse = "-")
str_c("Fruits", testString, sep=":")
str_dup(testString, 3) # 주어진 숫자만큼 반복
str_length(testString)
str_locate(testString, 'a') # 해당 문자열에서 특정 문자가 처음 나오는 위치와 마지막 위치
str_locate_all(testString, 'a')
str_locate_all(testString, c("a", "b"))
# 글자 바꾸기
str_replace('apple', 'p', '*')
str_replace_all('apple', 'p', '_')
# 구분기호로 단어 나누기
splitStr <- str_c('apple', '/', 'orange', '/', 'banana'); splitStr
str_split(splitStr, '/')
str_sub(splitStr, start=1, end=3) # 주어진 문자열에서 지정된 길이 만큼 잘라내는 함수
str_sub(splitStr, start=6, end=9)
str_sub(splitStr, start=-5)
str_trim(' apple banana berry ') # 문자열의 앞과 뒤 공백 제거
