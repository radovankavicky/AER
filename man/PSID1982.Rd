\name{PSID1982}
\alias{PSID1982}

\title{PSID Earnings Data 1982}

\description{
Cross-section data originating from the Panel Study on Income Dynamics, 1982.  
}

\usage{data("PSID1982")}

\format{
A data frame containing 595 observations on 12 variables.
\describe{
  \item{experience}{Years of full-time work experience.}
  \item{weeks}{Weeks worked.}
  \item{occupation}{factor. Is the individual a white-collar (\code{"white"}) or blue-collar (\code{"blue"}) worker?}
  \item{industry}{factor. Does the individual work in a manufacturing industry?}
  \item{south}{factor. Does the individual reside in the South?}
  \item{smsa}{factor. Does the individual reside in a SMSA (standard metropolitan statistical area)?}
  \item{married}{factor. Is the individual married?}
  \item{gender}{factor indicating gender.}
  \item{union}{factor. Is the individual's wage set by a union contract?}
  \item{education}{Years of education.}
  \item{ethnicity}{factor indicating ethnicity.
    Is the individual African-American (\code{"afam"}) or not (\code{"other"})?}
  \item{wage}{Wage.}
}
}

\details{
\code{PSID1982} is the cross-section for the year 1982 taken from a larger panel data set
\code{\link{PSID7682}} for the years 1976--1982, originating from Cornwell and Rupert (1988).
Baltagi (2002) just uses the 1982 cross-section; hence \code{PSID1982} is available as a
standalone data set because it was included in \pkg{AER} prior to the availability of the
full \code{PSID7682} panel version.
}

\source{
The data is from Baltagi (2002).
}

\references{
Baltagi, B.H. (2002). \emph{Econometrics}, 3rd ed. Berlin, Springer. 

Cornwell, C., and Rupert, P. (1988). Efficient Estimation with Panel Data: 
An Empirical Comparison of Instrumental Variables Estimators. 
\emph{Journal of Applied Econometrics}, \bold{3}, 149--155.
}

\seealso{\code{\link{PSID7682}}, \code{\link{Baltagi2002}}}

\examples{
data("PSID1982")
plot(density(PSID1982$wage, bw = "SJ"))

## Baltagi (2002), Table 4.1
earn_lm <- lm(log(wage) ~ . + I(experience^2), data = PSID1982)
summary(earn_lm)

## Baltagi (2002), Table 13.1
union_lpm <- lm(I(as.numeric(union) - 1) ~ . - wage, data = PSID1982)
union_probit <- glm(union ~ . - wage, data = PSID1982, family = binomial(link = "probit"))
union_logit <- glm(union ~ . - wage, data = PSID1982, family = binomial)
## probit OK, logit and LPM rather different.
}

\keyword{datasets}
