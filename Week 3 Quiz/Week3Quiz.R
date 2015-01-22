
## Q1 and 2
library(datasets)
data(iris)

?iris

## Q1
x <- split(iris, iris$Species)
mean(iris[iris$Species == "virginica",]$Sepal.Length)

## or

x <- split(iris$Sepal.Length, iris$Species)
x
lapply(x, mean)


## Q2
colMeans(iris)
apply(iris, 1, mean)
apply(iris[, 1:4], 2, mean)


## Q3 and 4
library(datasets)
data(mtcars)

?mtcars

## Q3
sapply(split(mtcars$mpg, mtcars$cyl), mean)
x <- split(mtcars$mpg, mtcars$cyl)
x

tapply(mtcars$cyl, mtcars$mpg, mean)

lapply(mtcars, mean)


## Q4

## x <- split(mtcars$hp, mtcars$cyl)
## sapply(x, mean)

mean(mtcars[mtcars$cyl == "8", ]$hp) - mean(mtcars[mtcars$cyl == "4",]$hp)


## Q5

debug(ls)
ls

