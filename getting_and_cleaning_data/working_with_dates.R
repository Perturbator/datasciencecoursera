# Starting simple
d1 = date()
d1
class(d1)
d2 = Sys.Date()
d2
class(d2)

# Formatting dates
(format(d2, "%a %b %d"))

# Creating dates
x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z = as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1]-z[2])

# Converting to Julian
weekdays(d2)
months(d2)
julian(d2)

library(lubridate); ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

















