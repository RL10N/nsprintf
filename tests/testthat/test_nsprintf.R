context("Test nsprintf")

test_that("everything workds", {
    n1 <- nsprintf(1, "there is one apples", "there are %d apples")
    n2 <- nsprintf(2, "there is one apples", "there are %d apples")
    expect_true(identical(n1, "there is one apples"))
    expect_true(identical(n2, "there are 2 apples"))
})
