# TEXT, DATE
x <- "We have a dream"
nchar(x)
length(x)
class(x); summary(x)
y <- c("We", "have", "a", "dream"); y
nchar(y)
length(y)
class(y); summary(y)
nchar(y[4])
letters
sort(letters, decreasing=T)
fox.says <- "It is only with the HEART that one can see Rightly"
tolower(fox.says)
toupper(fox.says)

fox.said <- "what is essential is invisible to the eye"
fox.said
strsplit(x=fox.said, split=" ")
strsplit(x=fox.said, split="")
fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
is.list(fox.said.words)
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
p1 <- "You come at four in the afternoon, then at three I shall begin to be happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "what makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]]
strsplit(littleprince, " ")[[3]][5]

# unique()
fox.said <- "WHAT IS ESSENTIAL is invisible to the Eye"
fox.said
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
unique(fox.said.words)
unique(toupper(fox.said.words))

# 텍스트 결합
# paste()
paste("Everybody", "wants", "to", "fly")
concateStr <- c("Everybody", "wants", "to", "fly")
paste(concateStr)
paste(fox.said.words)

paste("Everybody", "wants", "to", "fly", sep="-")
paste("Everybody", "wants", "to", "fly", sep="")
pi
sqrt(pi)
paste(pi, sqrt(pi))
paste("25 degrees Celsius is", 25*1.8+32, "degrees Fahrenheit")
# 인수로 벡터를 받을 수 있음
heroes <- c("Batman", "Captain America", "Hulk")
colors <- c("Black", "Blue", "Green")
paste(heroes, colors)

paste("Type", 1:5)
paste(heroes, "wants", "to", "fly")
paste(c("Everybody", "wants", "to", "fly"))
paste(c("Everybody", "wants", "to", "fly"), collapse = " ")
paste(heroes, "wants", "to", "fly", collapse = ", and ")
paste(heroes, "wants", "to", "fly", sep="-", collapse = "; ")
paste(month.abb, 1:12, sep="_", collapse="-")

# outer()
outer(c(1,2,3), c(3,2,1))
asian.contries <- c("Korea", "China", "Japan")
info <- c("GDP", "Population", "Area")
outer(asian.contries, info, FUN=paste, sep="-")
out <- outer(asian.contries, info, FUN=paste, sep="-")
as.vector(out)
out
outer(asian.contries, asian.contries, paste, sep="-")
x <- outer(asian.contries, asian.contries, paste, sep="-")
x[!lower.tri(x)]
x[lower.tri(x)]

# sprintf()
customer <- "jobs"
buysize <- 10
deliveryday <- 3
paste("Hello ",
      customer,
      ", your order of ",
      buysize,
      " product(s) will be delivered within ",
      deliveryday,
      " day(s).",
      sep = "")
sprintf("Hello %s, your order of %s product(s) will be delivered within %s days",
        customer,
        buysize,
        deliveryday)

customers <- c("jobs", "Gates", "Bezos")
buysizes <- c(10, 7, 2)
deliverydays <- c(3, 2, 7.5)
sprintf("Hello %s, your order of %s product(s) will be delibered within %s days",
        customers,
        buysizes,
        deliverydays)
sprintf("Hello %s, your order of %s product(s) will be delibered within %.1f days",
        customers,
        buysizes,
        deliverydays)

# substr() - 텍스트추출
substr("Data Analytics", start = 1, stop = 4)
substr("Data Analytics", 6, 14)
class <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(class, 1, 4)
class(class); summary(class)
countries <- c("Korea, KR", "United States, US", "China, CN")

# nchar을 사용하면 각각 원소의 문자열길이를 vector로 표현하여 결과값을 리턴
substr(countries, nchar(countries)-1, nchar(countries))
nchar(countries)-1; nchar(countries)
length(countries); class(countries); summary(countries)

# grep()
islands
landmasses <- names(islands)
landmasses
grep(pattern="New", x=landmasses)
index <- grep(pattern="New", x=landmasses)
landmasses[index]
grep("New", landmasses, value=T)
landmasses[grep(" ", landmasses)]
grep(" ", landmasses, value=T)

# sub() - 일치하는 처음 문자열만 새로운 문자열로 치환
# gsub() - 모든 문자열을 새로운 문자열로 치환
txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement = "Business", x=txt)
gsub(pattern="Data", replacement = "Business", x=txt)
x <- c("product.csv", "customer.csv", "supplier.csv")
gsub(".csv", "", x)

words <- c("at", "bat", "cat", "chaenomeles",
           "chase", "chasse", "cheap", "check",
           "cheese", "chick", "hat")
grep("che", words, value=T)
grep("at", words, value=T)
# [문자리스트] : 대괄호 안에 포함된 각 문자와 하나라도 일치하는 문자열 검색
grep("[ch]", words, value=T)
grep("[at]", words, value=T)
grep("ch|at", words, value=T)
grep("ch(e|i)ck", words, value=T)

# 반복지정자
grep("chas?e", words, value=T) # ?앞의 문자가 0 또는 1회
grep("chas*e", words, value=T) # *앞의 문자가 0이상 반복
grep("chas.e", words, value=T) # . : 임의의 한 문자
grep("chas+e", words, value=T) # +앞의 문자가 1회
grep("ch(a*|e*)se", words, value=T)
grep("cha[s]{2}e", words, value=T) # {n} : n번 반복
grep("cha[s]{1,2}e", words, value=T) # {n,m} : n~m번 반복
grep("cha[s]{1,}e", words, value=T) # n번 반복 이상

grep("^c", words, value=T) # ^ : 시작
grep("t$", words, value=T) # $ : 끝
grep("^[hc]?at", words, value=T) # at 앞에 아무 문자도 없거나 h또는 c로 시작하는 문자열

# 미리 정의된 정규표현식
words2 <- c("12 Dec", "OK", "http://", "<TITLE>Time?</Title>", "12345", "Hi there")
grep("[[:alnum:]]", words2, value=T) # 영숫자
grep("[[:alpha:]]", words2, value=T) # 영문자
grep("[[:digit:]]", words2, value=T) # 숫자
grep("[[:punct:]]", words2, value=T) # 구두점 문자
grep("[[:space:]]", words2, value=T) # 공백 문자
grep("\\w", words2, value=T) # 영숫자
grep("\\d", words2, value=T) # 숫자
grep("\\s", words2, value=T) # 공백 문자
