date <- now(); date

year(date)
month(date, label=T)
month(date, label=F)

day(date)
wday(date, label=T)
wday(date, label=F)

date - days(2)
date + years(1)
date + months(1)
date + hours(1)
date + minutes(1)
date + seconds(1)

date <- hm('22:30'); date
date <- hms('22:30:15'); date
