nsprintf <- function(n, msg1, msg2, ..., domain = NULL) {
  msg <- mapply(ngettext, n, msg1, msg2, domain = domain)
  sprintf(msg, n, ...)
}
