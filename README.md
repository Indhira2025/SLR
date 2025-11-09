# SLR: Simple Linear Regression in R (Manual Implementation)

The **SLR** package provides a lightweight implementation of simple linear regression
using manual formulas — without relying on R's built-in `lm()` function.

##  Installation

You can install the package directly from GitHub using:

```r
# install.packages("devtools")
devtools::install_github("Indhira2025/SLR")
```
## Usage
Load the package:

```r
library(SLR)
```
Use the main function:

```r
x <- 1:10
y <- 2 + 1.5*x + rnorm(10)

model <- my_simplelm(x, y, plot = TRUE)
model
```
##Access Help Pages
```r
# general help for the package
help(package = "SLR")

# help for a specific function
?my_simplelm
```

