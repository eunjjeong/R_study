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
