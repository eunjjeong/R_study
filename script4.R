var1 <- 'aaa'; var1; class(var1); summary(var1)
var2 <- 111; var2; class(var2); summary(var2)
var3 <- Sys.Date(); var3; class(var3); summary(var3)
var4 <- c('a', "b", "c"); var4; class(var4); summary(var4)

comp <- c(1, "2"); comp; class(comp); summary(comp)
num1 <- 1; num2 <- 2; num3 <- num1+num2; num1; num2; num3; class(num3)

seq1 <- 1:5; seq1; class(seq1); summary(seq1)
objects()
garbage <- 'trash'; garbage; class(garbage)
rm(garbage); garbage

vec1 <- c(1,2,3,4,5); vec1; class(vec1); is.vector(vec1); is.character(vec1)
vec2 <- c(1,2,3,4,"5"); vec2; class(vec2); is.vector(vec2)
vec3 <- seq(1:5); vec3; class(vec3); is.vector(vec3)
vec4 <- rep(1:4, 2); vec4; class(vec4); is.vector(vec4)
vec5 <- c(3,4,5) + 1; vec5; class(vec5); is.vector(vec5)
vec6 <- 10:15; vec6; is.vector(vec6)
vec7 <- LETTERS[1:4]; vec7; class(vec7); is.vector(vec7)
vec8 <- letters[1:4]; vec8; class(vec8); is.vector(vec8)
vec9 <- month.name; vec9; class(vec9); is.vector(vec9)
vec10 <- month.abb; vec10; class(vec10); is.vector(vec10)

vec1; vec1[3] # 인덱스가 1부터 시작함

vec1 <- c(1:3); vec1
vec2 <- c(3:5); vec2
vec3 <- vec1 - vec2; vec3
setdiff(vec1, vec2)
setdiff(vec2, vec1)
intersect(vec1, vec2) # 교집합

fruits <- c(10,20,30); fruits
# Vector의 각 컬럼 이름 지정
names(fruits) <- c('apple', 'banana', 'peach'); fruits
length(fruits)
NROW(fruits)

vec4 <- c(1,3,4,5,6); vec4
3 %in% vec4
3 %in% c(1,3,4,5,6)
vec5 <- c('a','b','c'); vec5
'b' %in% vec5
vec5 <- c('ab', 'cd', 'ef'); vec5
'f' %in% vec5

# 문자벡터
diabetes <- c("Type1", "Type2", "Type1", "Type1"); str(diabetes); class(diabetes)
diabetes <- factor(diabetes); str(diabetes); class(diabetes)
status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status)
str(status)
levels(status)

# 서열화된 요인순서 적용
status <- factor(status, ordered = TRUE, levels = c("Poor", "Improved", "Excellent"))
str(status)
levels(status)
sex <- c(1,2,1,1,2)
sex <- factor(sex, levels = c(1,2), labels = c("Male", "Female"))
str(sex); levels(sex)