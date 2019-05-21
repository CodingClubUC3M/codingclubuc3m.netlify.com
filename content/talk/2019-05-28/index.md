+++
title = "Simple yet elegant Object-Oriented programming in R with S3"
date = 2019-05-14

time_start = 2019-05-28T13:00:00
time_end = 2019-05-28T14:00:00

authors = ["Iñaki Úcar"]

abstract = """The R language is peculiar in many ways, and its approach to object-oriented (OO) programming is just one of them. Indeed, base R supports not one, but three different OO systems: S3, S4 and RC classes. And yet, probably none of them would qualify as a fully-fledged OO system before the astonished gaze of an expert in languages such as Python, C++ or Java. In this tutorial, we will review the S3 system, the simplest yet most elegant of them. The use case of the [quantities framework](https://github.com/r-quantities) (CRAN packages `units`, `errors` and `quantities`) will serve as the basis to study the main concepts behind S3 programming in R: classes, generics, methods and inheritance."""

event = "Tutorial"
event_url = "/post/2019-05-28"
event_form = "https://forms.gle/Pv6a8mLvTgGLkAQ9A"

location = "**Room 7.3.J06**. Campus de Leganés, Av. de la Universidad, 30, 28911 Leganés, Madrid, Spain."
  
selected = false

# Links (optional).
url_pdf = ""
url_slides = ""
url_video = ""
url_code = ""

[image]
  caption = "[**External link**](https://github.com/Enchufa2)"
  focal_point = "Top" 
+++

### Requirements

R packages [`errors`](https://cran.r-project.org/package=errors), [`units`](https://cran.r-project.org/package=units) and [`quantities`](https://cran.r-project.org/package=quantities). On Linux and Mac, the `units` package requires [UDUNITS-2](https://www.unidata.ucar.edu/software/udunits/):

- deb: libudunits2-dev (Debian, Ubuntu, ...)
- rpm: udunits2-devel (Fedora, EPEL, ...)
- brew: udunits (OSX)

### About the speaker

Postdoctoral Fellow at UC3M-Santander Big Data Institute, open-source advocate
and R package author.

He received his MEng in Telecommunications Engineering and MScEng in
Communications from Universidad Pública de Navarra (Spain) in 2011 and 2013
respectively, and his MScEng and PhD in Telematic Engineering from Universidad
Carlos III de Madrid in 2014 and 2018 respectively.

He has developed expertise in statistical software, high-performance computing,
simulation, data wrangling and visualisation, network analysis and Markov
processes. His current research interests are data science and complex systems,
and their applications to social networks, financial markets, cities, mobility
and economy.
