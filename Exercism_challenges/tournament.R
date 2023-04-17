tournament <- function(input) {
    results <- strsplit(input, ";")
    results <- results[sapply(results, length) == 3]
    mat <- do.call(rbind, results)
    mat <- mat[mat[, 3] %in% c("win", "loss", "draw"), ]
    mat[, 3] <- substr(toupper(mat[, 3]), 1, 1)
    df <- as.data.frame.matrix(table(
        c(mat[, 1], mat[, 2]),
        c(mat[, 3], c(W = "L", L = "W", D = "D")[mat[, 3]])
    ))
    df <- with(df, data.frame(
        Team = rownames(df), MP = (W + L + D), W, D, L, P = (3 * W + D)
    ))
    data.frame(df[order(-df$P, df$Team), ], row.names = NULL)
}