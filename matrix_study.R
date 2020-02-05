# Matrix
vec <- c(1,2,3,4); vec
mat1 <- matrix(vec); mat1; class(mat1); is.matrix(mat1)
colnames(mat1) <- c("col1"); mat1 # 컬럼명 지정
rownames(mat1) <- c("row1", "row2", "row3", "row4"); mat1 # 행명 지정
# 2행 2열, 행우선 행명, 컬럼명 지정
mat1 <- matrix(mat1, nrow=2, ncol=2, byrow=TRUE, dimnames=list(c("row1","row2"), c("col1","col2"))); mat1
vec; class(vec)
mat2 <- matrix(vec, ncol=2); mat2; class(mat2); is.matrix(mat2)
mat3 <- matrix(vec, nrow=1); mat3
mat4 <- matrix(vec, nrow=2); mat4
mat5 <- matrix(vec, ncol=2, byrow=TRUE); mat5 # 행 우선
mat6 <- matrix(c(1,2,3,11,12,13), nrow=2, ncol=3, byrow=TRUE, dimnames=list(c("row1","row2"), c("c.1","c.2","c.3"))); mat6
mat6 <- rbind(mat6, c(14,15,16)); mat6 # 행 추가
mat6 <- rbind(mat6, "row3"=c(14,15,16)); mat6 # 행 추가 및 추가된 행이름 지정
mat6[1,]
mat6[,1]
mat6[2,2]
mat7 <- matrix(c(1,2,3,11,12,13), nrow=2, ncol=3, byrow=TRUE, dimnames=list(c("row1","row2"), c("c.1","c.2","c.3"))); mat7
mat7 <- cbind(mat7, "c.4"=c(4,14)); mat7 # 컬럼 추가 및 추가된 컬럼명 지정
y<-matrix(1:20, nrow=5, ncol=4)
y
cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=T, dimnames=list(rnames, cnames))
mymatrix
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=F, dimnames=list(rnames, cnames))
mymatrix
mymatrix <- rbind(mymatrix, "R3"=c(70, 88)); mymatrix
mymatrix <- cbind(mymatrix, "C3"=c(25, 69, 89)); mymatrix
rm(mymatrix)

x<-matrix(1:10, nrow=2); x
x[2,]
x[,2]
x[1,4]
x[1,c(4,5)]
mymatrix; class(mymatrix); dim(mymatrix); nrow(mymatrix); ncol(mymatrix)
colnames(mymatrix); rownames(mymatrix)
rowSums(mymatrix); colSums(mymatrix)
rowMeans(mymatrix); colMeans(mymatrix)

mat8 <- rbind(c(1,2,3), c(11,12,13)); mat8 # rbind로 행열 생성
dim(mat8); nrow(mat8); ncol(mat8)
colnames(mat8) <- c("col1","col2","col3"); mat8
rownames(mat8) <- c("row1","row2"); mat8
colnames(mat8); rownames(mat8);
mat8
rowSums(mat8); colSums(mat8)

## deparse.level
dd <- 10
rbind(1:4, c=2, "a++"=10, dd, deparse.level=0) # middle 2 rownames
rbind(1:4, c=2, "a++"=10, dd, deparse.level=1) # 3 rownames (default)
rbind(1:4, c=2, "a++"=10, dd, deparse.level=2) # 4 rownames

mat1 <- matrix(c(1:4), nrow=2, byrow=T, dimnames=list(c("r1","r2"), c("c1","c2"))); mat1
dim(mat1)
mat2 <- matrix(c(1,1,2,2), ncol=2, nrow=2, byrow=T, dimnames=list(c("r1","r2"),c("c1","c2"))); mat2
matAdd <- mat1 + mat2; matAdd # 행렬 합
matMul <- mat1 * mat2; matMul # 각 행렬의 Element의 곱
matProd <- mat1 %*% mat2; matProd # 행렬 곱
matDiv <- mat2/mat1; matDiv # 각 행렬의 Element의 나눗셈
solve(mat1) # 역행렬
mat1; t(mat1) # 행렬 변환