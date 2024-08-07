#' Two Categorical Variables
#'
#' This function allows you to summarize a categorical variable by a second grouping variable for tables.
#' @param x Grouping variable
#' @param y Variable to summarize per group
#' @param u Include row for missing values? Defaults to TRUE
#' @param ulab Label for missing values, defaults to "Missing"
#' @param r Values, either 1 or 2 default - columns sum to 100%
#' @param nam Label of variable summarized. Defaults to ""
#' @keywords table1
#' @export
#' @examples
#' cat2()

cat2 <- function (x, y, u = TRUE, ulab = "Missing", r = 2, nam = "")
{
  if (u == T) {
    cbind(rbind(matrix("", ncol = ncol(table(y, x)), dimnames = list(paste0(nam, ", N (%)"))),
                matrix(sprintf("%1.0f (%1.1f)", table(y, x), 100 *
                                 prop.table(table(y, x), r)), nrow = nrow(table(y,
                                                                                x)), ncol = ncol(table(y, x)), dimnames = list(paste(
                                                                                  rownames(table(y, x)), sep = ""), colnames(table(y,
                                                                                                                                   x)))), matrix(table(x) - table(is.na(y), x)[1,
                                                                                                                                   ], nrow = 1, dimnames = list("Missing"))))
  }
  else if (u == F) {
    cbind(rbind(matrix("", ncol = ncol(table(y, x)), dimnames = list(paste0(nam, ", N (%)"))),
                matrix(sprintf("%1.0f (%1.1f)", table(y, x), 100 *
                                 prop.table(table(y, x), r)), nrow = nrow(table(y,
                                                                                x)), ncol = ncol(table(y, x)), dimnames = list(paste(
                                                                                  rownames(table(y, x)), sep = ""), colnames(table(y,
                                                                                                                                   x))))))
  }
}

