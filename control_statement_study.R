# if statement
var1 <- 1
var2 <- 2

if (var1 > var2){
  cat("var1 큼")
} else {
  cat("var2 큼")
}

cat(ifelse(var1>var2, "var1 큼", "var2 큼"))

# switch statement
# switch(EXPR=수치데이터, 식1, 식2, 식3, ...)
# switch(EXPR=문자열데이터, 비교값1=식1, 비교값2=식2, 비교값3=, 비교값4=식3, ..., 식4)
switch(EXPR=var1, "월", "화", "수", "목", "금", "토", "일")
varStr <- '화'
switch(EXPR=varStr, "월"=1, "화"=2)

# while loop
no <- 0
while(no <5){
  print(no);
  no<-no+1;
}

x <- 1
while(x<5){
  x<-x+1;
  if(x==4){
    break;
  }
  print(x);
}

x <- 1
while(x<5){
  x<-x+1;
  if(x==4){
    next;
  }
  print(x);
}

# for loop
for(i in 1:5){
  print(i)
}

sum <- 0
for(i in 1:10){
  sum <- sum+i;
}
sum

# 반복문 내에서 화면에 결과 출력시 출력함수 print() or cat() 사용

