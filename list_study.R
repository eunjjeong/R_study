# List
g <- "My First List"
h <- c(25,26,18,39)
j <- matrix(1:10, nrow=5); j
k <- c("one", "two", "three")
mylist <- list(title=g, ages=h, j, k)
mylist
list1 <- list(a=1:3, b="a string", c=pi, d=list(-1, -5)); list1
class(list1); is.list(list1); summary(list1)
list1$a[2]; list1[1:2]
a <- list(
  a=1:3,
  b="a string",
  c=pi,
  d=list(-1,-5)
)
a
list2 <- list(name='Kim Eun Jeong',
              address='Daegu',
              tel='010-0000-0000',
              pay=500)
list2

# list 추가하기
list2$hobby <- 'bowling'; list2

# 하나의 key에 두 개 이상의 값을 추가
list2$name <- c("Kim Eun Jeong", "KEJ"); list2
list2$name[1]
list2$name[2]
list2$name

# list 삭제하기
list2$hobby <- NULL; list2
l1 <- list(a="a", b=2, c=pi); l1
class(l1)
v1 <- unlist(l1) # a character vector
v1; class(v1); summary(v1)
l1

# save(96page)
save(list=ls(), file="all.rda")
rm(list=ls()); ls()
load("all.rda"); ls()
