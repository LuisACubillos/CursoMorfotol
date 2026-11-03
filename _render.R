# Regenera todas las presentaciones y el índice del curso.
# Ejecutar con la carpeta del curso como directorio de trabajo:
#   source("_render.R")      (desde RStudio)
#   Rscript _render.R        (desde la terminal; requiere pandoc, incluido en RStudio)
# El orden importa: el módulo 4 crea datos/contornos_3zonas.csv y el 5
# datos/coef_nef_3zonas.csv, que usan los módulos siguientes y el índice.

if (!rmarkdown::pandoc_available()) {
  rs <- c("/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/aarch64",
          "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/x86_64",
          "/Applications/RStudio.app/Contents/MacOS/quarto/bin/tools")
  rs <- rs[dir.exists(rs)]
  if (length(rs)) Sys.setenv(RSTUDIO_PANDOC = rs[1])
}

modulos <- c("01_introduccion.Rmd", "02_imagenes_binarizacion.Rmd", "03_pseudolandmarks.Rmd",
             "04_datos_csv_xlsx.Rmd", "05_fourier_eliptico.Rmd", "06_acp.Rmd", "index.Rmd")
for (m in modulos) {
  message("Renderizando ", m)
  rmarkdown::render(m, envir = new.env(), quiet = TRUE)
}
message("Listo: abra index.html")
