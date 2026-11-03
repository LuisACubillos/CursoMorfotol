# Análisis de contornos de otolitos con R — curso corto

Curso corto de morfometría geométrica de contornos de otolitos *sagitta*: de la
fotografía al análisis de componentes principales, con R. Texto guía:
Claude, J. (2008). *Morphometrics with R*. Springer.

**Página del curso:** <https://luisacubillos.github.io/CursoMorfotol/> (presentaciones en formato *slidy*).

## Módulos

| Módulo | Archivo | Contenido |
|---|---|---|
| 1 | `01_introduccion.Rmd` | Introducción a la morfometría geométrica de contornos de otolitos |
| 2 | `02_imagenes_binarizacion.Rmd` | Imágenes en R, escala de grises, binarización, extracción del contorno (`Conte`) |
| 3 | `03_pseudolandmarks.Rmd` | Pseudolandmarks a lo largo del contorno, descriptores e índices de forma |
| 4 | `04_datos_csv_xlsx.Rmd` | Preparación de datos de contornos en CSV y XLSX |
| 5 | `05_fourier_eliptico.Rmd` | Transformada elíptica de Fourier y normalización (`efourier`, `NEF`) |
| 6 | `06_acp.Rmd` | Análisis de componentes principales y reconstrucción de formas |

## Estructura

```
CursoMorfotol/
├── index.Rmd / index.html      página principal del curso
├── 0X_*.Rmd / 0X_*.html        presentaciones slidy (autocontenidas)
├── estilo.css                  estilo común de las presentaciones
├── _render.R                   regenera todo en el orden correcto
├── R/                          funciones de Claude (2008) + auxiliares del curso
└── datos/                      imagen, contornos y archivos generados por los módulos
```

## Regenerar las presentaciones

Requiere R (≥ 4.0), RStudio (o pandoc) y los paquetes `pixmap`, `readxl`,
`writexl`, `rmarkdown` y `knitr`.

```r
install.packages(c("pixmap", "readxl", "writexl", "rmarkdown", "knitr"))
source("_render.R")   # con la carpeta del curso como directorio de trabajo
```

## Publicar en GitHub Pages

1. Cree un repositorio nuevo en GitHub (p. ej., `curso-contornos-otolitos`).
2. Suba el contenido de esta carpeta (incluidos los `.html` y el archivo `.nojekyll`):

   ```bash
   cd CursoMorfotol
   git init
   git add .
   git commit -m "Curso corto: análisis de contornos de otolitos con R"
   git branch -M main
   git remote add origin https://github.com/<usuario>/curso-contornos-otolitos.git
   git push -u origin main
   ```

3. En GitHub: *Settings → Pages → Build and deployment → Source: Deploy from a
   branch*, rama `main`, carpeta `/ (root)`.
4. El curso quedará en `https://<usuario>.github.io/curso-contornos-otolitos/`.

Cada vez que modifique un `.Rmd`, ejecute `source("_render.R")` y haga
`git commit` + `git push` de los `.html` actualizados.

## Créditos

- Funciones `Conte`, `regularradius`, `efourier`, `iefourier` y `NEF`:
  Claude (2008), con las correcciones de la fe de erratas v1.8 en `NEF`.
- Datos: contornos de otolitos de merluza de cola (*Macruronus magellanicus*) de
  tres sistemas estuarinos (Chiloé, Aysén, Magallanes) e imagen de un otolito de
  sardina común.
