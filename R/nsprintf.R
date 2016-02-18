nsprintf <- function(n, msg1, msg2, ..., domain = NULL) {
  sprintf(ngettext(n, msg1, msg2, domain), n, ...)
}
