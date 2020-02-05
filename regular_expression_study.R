# 정규표현식

# 특정 패턴만 골라내기
# grep(pattern, a) : 벡터 a에서 패턴을 찾아 그 위치를 반환

chars <- c('apple', 'Apple', 'APPLE', 'banana', 'grape'); chars
grep('apple', chars)
grep('banana', chars)
grep('pp', chars)
grep('pp', chars, value=T)
grep('^A', chars, value=T)
grep('e$', chars, value=T)

chars1 <- c('apple1', 'Apple1', 'APPLE', 'banana', 'grape'); chars1
grep('ap', chars1, value=T)
grep('[0-9]', chars1, value=T)
grep('[[:upper:]]', chars1, value=T) # 대문자가 있는 경우

chars <- c('apple', 'Apple', 'APPLE', 'banana', 'grape'); chars 
nchar(chars) # 입력된 배열이나 문자열의 길이
paste("Kim", "Eun", "Jeong") # 문자열 결합
paste("Kim", "Eun", "Jeong", sep= "")
paste("Kim", "Eun", "Jeong", sep= '/')
substr('abc123', 3, nchar('abc123'))
strsplit('2018/06/16', split='/')
regexpr('-', '010-123-1234') # 해당패턴을 만족하는지, 문자열 내부에서의 위치 알려줌
