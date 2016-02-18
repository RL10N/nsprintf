\name{nsprintf}
\alias{nsprintf}
\title{Easy Internationalized Message Pluralization}
\usage{
nsprintf(n, msg1, msg2, ..., domain = NULL)
}
\arguments{
    \item{n}{A numerical value, passed to \code{\link[base]{ngettext}}.}
    \item{msg1}{A character string containing an English-language message when \code{n == 1}, passed to \code{\link[base]{ngettext}}.}
    \item{msg2}{A character string containing an English-language message when \code{n != 1}, passed to \code{\link[base]{ngettext}}.}
    \item{\dots}{Additional arguments passed to \code{\link[base]{sprintf}}.}
    \item{domain}{A character string specifying a gettext domain, passed to \code{\link[base]{ngettext}}.}
}
\description{A single function to facilitate the correct pluralization and internationalization of R messages.}
\value{A character string.}
\author{Thomas J. Leeper}
\examples{
\dontrun{
# simple pluralization
nsprintf(1, "there is one apples", "there are %d apples")
nsprintf(2, "there is one apples", "there are %d apples")

# additional arguments to `sprintf()`
p <- "nsprintf"
nsprintf(1, "there is one function in the %s package", 
            "there is one function in the %s package", p)
}
}
