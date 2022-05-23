rm(list = ls())


library(knitr)
options(tinytex.verbose = TRUE)

options(knitr.duplicate.label = "allow")
knitr::opts_chunk$set(
  crop = NULL,
  cache = TRUE,
  tidy = TRUE,
  tidy.opts = list(width.cutoff = 50),
  error = TRUE, 
  warning = FALSE, 
  message = FALSE, 
  out.width = "100%",
  fig.align = 'center',
  fig.width = 7,
  fig.asp = 0.618  # 1 / phi
)


## opts_chunk$set(comment=NA)
## def_hook <- knit_hooks$get("output")
## knit_hooks$set(output = function(x, options) {
##   out <- def_hook(x, options)
##   return(paste("\\begin{framed}\\begin{verbatim}", x, "\\end{verbatim}\\end{framed}", collapse = "\n"))
## })


library(tidyverse)
library(ggformula)
library(stargazer)
