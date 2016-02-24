#' Easy Internationalized Message Pluralization
#' 
#' A single function to facilitate the correct pluralization and 
#' internationalization of R messages.
#' @param n A numerical value, passed to \code{\link[base]{ngettext}}.
#' @param msg1 A character string containing an English-language message when 
#' \code{n == 1}, passed to \code{\link[base]{ngettext}}.
#' @param msg2 A character string containing an English-language message when 
#' \code{n != 1}, passed to \code{\link[base]{ngettext}}.
#' @param ... Additional arguments passed to \code{\link[base]{sprintf}}.
#' @param domain A character string specifying a gettext domain, passed to 
#' \code{\link[base]{ngettext}}.
#' @return A character vector.
#' @author Thomas J. Leeper
#' @seealso \code{\link[base]{ngettext}, \code{\link[base]{sprintf}}
#' @examples 
#' # simple pluralization
#' nsprintf(0:3, "there is one apple", "there are %d apples")
#' 
#' # additional arguments to `sprintf()`
#' # count the number of objects in each environment on the search path
#' envs <- search()
#' n <- vapply(envs, function(env) length(ls(env)), integer(1))
#' nsprintf(n, "there is %d variable in %s", 
#'             "there are %d variables in %s", envs)
#'             
#' # nested nsprintf: 
#' n_objects <- 6
#' k_chosen <- seq(0, n_objects)
#' n_combinations <- choose(n_objects, k_chosen)
#' nsprintf(
#'   n_combinations, 
#'   "there is %d combination of %s chosen from a set of size %d", 
#'   "there are %d combinations of %s chosen from a set of size %d",
#'   nsprintf(k_chosen, "%d object", "%d objects"),  
#'   n_objects
#' )
#' @export
nsprintf <- function(n, msg1, msg2, ..., domain = NULL) {
  if(is.null(domain))
  {
    domain <- vector("list", length(n))
  }
  msg <- mapply(ngettext, n, msg1, msg2, domain = domain)
  sprintf(msg, n, ...)
}
