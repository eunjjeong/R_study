'First'
'Seconde'

is.character('First'); is.character('Seconde')
class('First'); class('Seconde')

5+6
'5'*'4'
is.numeric('5'); is.numeric('4')
# 강제형변환
as.numeric('5') * as.numeric('4')
class('5')
class(5)

1+NA
1+NULL
cat(1, NA, 2)
cat(1, NULL, 2)
sum(1, 2, NA, na.rm=T); class(NA); class(NULL)
is.na(NA); is.null(NULL)

is.nan('a'); is.nan(9); is.nan(NA); is.nan(NaN)
is.finite(9); is.finite(9/3); is.finite(1/0)
is.infinite(Inf); is.infinite(1/0)
class(NaN); class(9/3); class(1/0)

Sys.Date(); Sys.time(); date()
as.Date('2018-06-12'); class(as.Date('2018-06-12'))
as.Date('12-06-2018', format='%d-%m-%Y')
as.Date('2018년 06월 12일', format='%Y년 %m월 %d일')
as.Date('12062018', format='%d%m%Y')
as.Date('120619', format='%d%m%y')
as.Date(10, origin='2018-06-18')
as.Date(-10, origin='2018-06-18')

'2018-06-18'-'2018-06-10'
class('2018-06-18')
class(as.Date('2018-06-18')); as.Date('2018-06-18')-as.Date('2018-06-10')
as.Date('2018-06-18')-5

as.Date('2018-06-12 20:00:00')-as.Date('2018-06-12 18:30')
as.POSIXct('2018-06-12 20:00:00')-as.POSIXct('2018-06-12 18:30')

