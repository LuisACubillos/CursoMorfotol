# largo_a_array(d, np): contornos en formato largo (id, punto, x, y) ->
# arreglo [np, 2, n] con un otolito por capa (función auxiliar del curso, módulo 4).
largo_a_array <- function(d, np = 50) {
  ids <- unique(d$id)
  A <- array(NA_real_, dim = c(np, 2, length(ids)), dimnames = list(NULL, c("x", "y"), ids))
  for (i in ids) {
    di <- d[d$id == i, ]
    A[, , i] <- as.matrix(di[order(di$punto), c("x", "y")])
  }
  A
}
