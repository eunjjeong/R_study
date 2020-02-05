# Array
# array(vector, dimensions, dimnames)
array(1:4, c(2,2))
array(1:4, c(2,4)) # 1,2,3,4 값을 2행 4열로 맞춤
array(1:12, dim=c(2,2,2))
rname <- c('row1', 'row2')
cname <- c('col1', 'col2')
pname <- c('page1', 'page2')
array(1:12, dim=c(2,2,2), dimnames=list(rname, cname, pname))
pname <- c(pname, 'page3')
array(1:12, dim=c(2,2,3), dimnames=list(rname, cname, pname))

# matrix add
mat1 <- matrix(c(1:4), nrow=2, byrow=T); mat1
mat2 <- matrix(c(5,6,7,8), nrow=2, byrow=T); mat2
ar1 <- array(mat1, dim=c(2,2,2)); ar1; class(ar1)
ar1[,,2] <- mat2; ar1
mat3 <- matrix(c(1:4), nrow=2, byrow=F); mat3
mat4 <- matrix(c(5:8), nrow=2, byrow=F); mat4
pname <- c('page1', 'page2'); pname
z <- array(mat3, dim=c(2,2,2), dimnames=list(rname, cname, pname)); z 
z[,,2] <- mat4; z
z[1,,] # 각 1행 요소
z[,1,] # 각 1열 요소
z[,,2] # 2면 요소


