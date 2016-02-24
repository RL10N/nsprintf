context("Test nsprintf")

test_that("simple pluralisation works", {
    expected <- c(
      "there are 0 apples", "there is one apple",
      "there are 2 apples", "there are 3 apples"
    )
    actual <- nsprintf(0:3, "there is one apple", "there are %d apples")
    n2 <- nsprintf(2, "there is one apples", "there are %d apples")
    expect_identical(actual, expected)
})

test_that("sprintf substitution works", {
    expected <- c(
      "Juggling 1 ball is easy", "Juggling 3 balls a good trick",
      "Juggling 6 balls almost impossible"
    )
    actual <- nsprintf(
      c(1, 3, 6), 
      "Juggling %d ball is %s", 
      "Juggling %d balls %s", 
      c("easy", "a good trick", "almost impossible")
    )
    expect_identical(actual, expected)
})
