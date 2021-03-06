\name{Franses1998}
\alias{Franses1998}

\title{Data and Examples from Franses (1998)}

\description{
This manual page collects a list of examples from the book. Some 
solutions might not be exact and the list is certainly not complete.
If you have suggestions for improvement (preferably in the form of code),
please contact the package maintainer.
}

\references{
Franses, P.H. (1998). \emph{Time Series Models for Business and Economic Forecasting}.
Cambridge, UK: Cambridge University Press.
URL \url{http://www.few.eur.nl/few/people/franses/research/book2.htm}.
}

\seealso{\code{\link{ArgentinaCPI}}, \code{\link{ChinaIncome}}, \code{\link{ConsumerGood}},
  \code{\link{DJFranses}}, \code{\link{DutchAdvert}}, \code{\link{DutchSales}},
  \code{\link{GermanUnemployment}}, \code{\link{MotorCycles}}, \code{\link{OlympicTV}},
  \code{\link{PepperPrice}}, \code{\link{UKNonDurables}}, \code{\link{USProdIndex}}}

\examples{
###########################
## Convenience functions ##
###########################

## EACF tables (Franses 1998, p. 99)
ctrafo <- function(x) residuals(lm(x ~ factor(cycle(x))))
ddiff <- function(x) diff(diff(x, frequency(x)), 1)
eacf <- function(y, lag = 12) {
  stopifnot(all(lag > 0))
  if(length(lag) < 2) lag <- 1:lag
  rval <- sapply(
    list(y = y, dy = diff(y), cdy = ctrafo(diff(y)),
         Dy = diff(y, frequency(y)), dDy = ddiff(y)),
    function(x) acf(x, plot = FALSE, lag.max = max(lag))$acf[lag + 1])
  rownames(rval) <- lag
  return(rval)
}

#######################################
## Index of US industrial production ##
#######################################

data("USProdIndex", package = "AER")
plot(USProdIndex, plot.type = "single", col = 1:2)

## Franses (1998), Table 5.1
round(eacf(log(USProdIndex[,1])), digits = 3)

## Franses (1998), Equation 5.6: Unrestricted airline model
## (Franses: ma1 = 0.388 (0.063), ma4 = -0.739 (0.060), ma5 = -0.452 (0.069))
arima(log(USProdIndex[,1]), c(0, 1, 5), c(0, 1, 0), fixed = c(NA, 0, 0, NA, NA))

###########################################
## Consumption of non-durables in the UK ##
###########################################

data("UKNonDurables", package = "AER")
plot(UKNonDurables)

## Franses (1998), Table 5.2
round(eacf(log(UKNonDurables)), digits = 3)

## Franses (1998), Equation 5.51
## (Franses: sma1 = -0.632 (0.069))
arima(log(UKNonDurables), c(0, 1, 0), c(0, 1, 1))

##############################
## Dutch retail sales index ##
##############################

data("DutchSales", package = "AER")
plot(DutchSales)

## Franses (1998), Table 5.3
round(eacf(log(DutchSales), lag = c(1:18, 24, 36)), digits = 3)

###########################################
## TV and radio advertising expenditures ##
###########################################

data("DutchAdvert", package = "AER")
plot(DutchAdvert)

## Franses (1998), Table 5.4
round(eacf(log(DutchAdvert[,"tv"]), lag = c(1:19, 26, 39)), digits = 3)
}

\keyword{datasets}
