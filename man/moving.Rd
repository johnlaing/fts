\name{moving}
\alias{moving.functions}
\alias{moving.mean}
\alias{moving.sum}
\alias{moving.product}
\alias{moving.max}
\alias{moving.min}
\alias{moving.sd}
\alias{moving.rank}

\alias{moving.cor}
\alias{moving.cov}

\title{Moving Functions}
\description{
  apply summary functions on a moving/rolling basis
}
\usage{
moving.mean(x, periods)
moving.sum(x, periods)
moving.max(x, periods)
moving.min(x, periods)
moving.sd(x, periods)
moving.rank(x, periods)

moving.cor(x, y, periods)
moving.cov(x, y, periods)
}

\arguments{
  \item{x}{ An Fts object }
  \item{y}{ An Fts object }
  \item{periods}{ integer: number of periods in window }
}


\details{
  apply a function that takes a vector and returns a scalar on a rolling
  basis to an fts object

  asking for a window larger than the number of rows of the fts
  object will result in an fts of all NA w/ the same number of rows as the
  input

  for functions that take two fts objects the date intersection is
  taken before the window function is applied
}
\value{
  an fts object
}
\author{ Whit Armstrong }
\examples{
x <- fts()
y <- fts()

x.mean <- moving.mean(x,20)
x.sum <- moving.sum(x,20)
x.prod <- moving.product(x,20)
x.max <- moving.max(x,20)
x.min <- moving.min(x,20)
x.sd <- moving.sd(x,20)
x.rank <- moving.rank(x,20)

## take only odd rows
## to illustrate that teh correlation and covariance
## will only be calculated for the intersection of the dates
y <- y[(1:nrow(y))\%\%2 == 1]

xy.cor <- moving.cor(x, y, 20)
xy.cov <- moving.cov(x, y, 20)
}
\keyword{ts}
