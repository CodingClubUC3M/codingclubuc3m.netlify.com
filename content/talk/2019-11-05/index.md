+++
title = "Spatial Data Analysis with INLA"
date = 2019-10-29

time_start = 2019-11-05T13:00:00
time_end = 2019-11-05T14:00:00

authors = ["Virgilio Gómez-Rubio"]

abstract = """This session will show how to fit mixed-effects models to spatial lattice data using the integrated nested Laplace approximation with the R-INLA package. This will cover some standard models such as the conditionally autoregressive (CAR) specification. The examples will be illustrated using the New York leukemia dataset and a few hints on how to produce maps to display the results will be given as well."""

event = "Tutorial"
event_url = ""
event_form = "https://forms.gle/7WvNzxxcwq2tJ8a69"

location = "**Room 7.3.J06**. Campus de Leganés, Av. de la Universidad, 30, 28911 Leganés, Madrid, Spain."
  
selected = false

# Links (optional).
url_pdf = ""
url_slides = ""
url_video = ""
url_code = ""

[image]
  caption = "[**External link**](https://github.com/becarioprecario)"
  focal_point = "Center" 
+++

### Requirements

The following CRAN packages are required:

```r
pkgs <- c("sp", "spdep", "maptools", "rgdal", "gstat", "DClusterm", "spData")
pkgs <- c(pkgs, "viridis", "RColorBrewer")
pkgs <- c(pkgs, "tmap")

install.packages(pkgs)
```

INLA is also required, but it is not available on CRAN:

```r
install.packages("INLA", repos = "https://inla.r-inla-download.org/R/stable")
```

### About the speaker

Virgilio Gómez-Rubio is an associate professor in the Department of Mathematics, Universidad de Castilla-La Mancha (Albacete, Spain). He has developed several packages on spatial and Bayesian statistics that are available on CRAN, as well as co-authored books on spatial data analysis and INLA.
