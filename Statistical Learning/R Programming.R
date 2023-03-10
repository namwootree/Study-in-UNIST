getwd()
setwd('/Users/namwoo/Desktop/UNIST/lecture/1-1/Statistical Learning')

a <- c(2, 5, 10)
plot(a)

help.start()
help(lm)

name <- 'John'
age <- 25

# This is a comment

?'lm'

Fruit <- factor(c('apple',
                  'banana'))

Nu <- c(15.3, 99)
class(Nu)
Co <- c(9+3i, 10-6i)
class(Co)
Ch <- c('school', '99')
class(Ch)
Lo <- c(TRUE, FALSE)
class(Lo)

a <- NA
identical(a, b)
is.na(a)
b <- NaN
c <- NULL
is.null(c)
d <- Inf

9+2
9-2
9*2
9/2
9^2
9%%2
9%/%2

4 < 3
3 <= 3
2 > 3
3 >= 3
3 == 3
3 != 3

x <- 1:10

sqrt(5)
exp(1)
log(2)
log10(2)
sin(pi/2)
abs(-32)
floor(-8.2)
ceiling(3.4)

1256%%17
floor(log10(859) * 4)
credit <- c('100', '200', '300')
class(credit)
credit <- c(100, 200, 300)
class(credit)
credit <- factor(c(100, 200, 300))
class(credit)

x <- factor(c(1, 2, 3, 4, 5))
is.vector(x)
is.matrix(x)
as.vector(x)
length(x)
sort(x)

df <- data.frame(programming=c('Python', 'R', 'STATA'),
                 Credit=c(100, 150, 200),
                 Duration=c(10, 20, 30))

df

summary(df)
df$programming

plot(1, 3)
plot(c(1, 8), c(3, 10))
plot(c(1, 2, 3, 4),
     c(3, 7, 9, 10),
     type='p')
plot(c(1, 2, 3, 4),
     c(3, 7, 9, 10),
     type='l')

plot(1:10,
     col='blue', # color
     pch=23, # point character
     cex=2, # point size
     main='Point Plot',
     sub='Statistical Learning',
     xlab='Index for Value',
     ylab='Value')

pie(c(10, 20, 30, 40), init.angle=90)
pie(c(10, 20, 30, 40),
    label=c('A', "B", "C", 'D'),
    main='Title')

barplot(c(2, 4, 6, 8),
        names.arg=c("A", 'B', "C", 'D'))
barplot()