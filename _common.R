rm(list = ls())

# Package names
packages <- c(
  "bookdown", "knitr", "formatR", "tidyverse", "tidymodels",
  "kernlab", "np", "ggformula", "stargazer", "gganimate",
  "LearnBayes", "coda", "rjags", "R2jags", "bayesplot", "carData",
  "car", "ggiraphExtra", "ROCR", "ISLR", "GGally", "leaps", "glmnet",
  "rgl", "factoextra", "pander", "kknn", "klaR", "discrim", "gifski"
)

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

installed_calvinbayes <- "CalvinBayes" %in% rownames(installed.packages())
if (installed_calvinbayes == FALSE) {
  remotes::install_github("rpruim/CalvinBayes")
}

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
  fig.align = "center",
  fig.width = 7,
  fig.asp = 0.618 # 1 / phi
)


## opts_chunk$set(comment=NA)
## def_hook <- knit_hooks$get("output")
## knit_hooks$set(output = function(x, options) {
##   out <- def_hook(x, options)
##   return(paste("\\begin{framed}\\begin{verbatim}", x, "\\end{verbatim}\\end{framed}", collapse = "\n"))
## })


library(tidyverse)
library(ggformula)
