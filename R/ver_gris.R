# ver_gris(G): muestra una matriz de grises [0, 1] como imagen.
# Usa rasterImage() (más rápido y sin el patrón de grilla de plot.pixmap) y
# el mismo sistema de coordenadas que Conte(): x = columna, y = nº filas - fila.
# (función auxiliar del curso; no es parte de Claude 2008)
ver_gris <- function(G, main = "", ejes = FALSE, ...) {
  G <- pmin(pmax(G, 0), 1)
  plot(NA, xlim = c(0, ncol(G)), ylim = c(0, nrow(G)), asp = 1, axes = ejes,
       xlab = "", ylab = "", main = main, xaxs = "i", yaxs = "i", ...)
  rasterImage(as.raster(G), 0, 0, ncol(G), nrow(G), interpolate = FALSE)
}
