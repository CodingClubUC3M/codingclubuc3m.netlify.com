+++
title = "An introduction to web scraping: locating Spanish schools"
date = 2020-02-03

time_start = 2020-02-11T13:00:00
time_end = 2020-02-11T14:00:00

authors = ["Jorge Cimentada"]

abstract = """Whenever a new paper is released using some type of scraped data, most of my peers in the social science community get baffled at how researchers can do this. In fact, many scientists can't even think of research questions that can be addressed with this type of data simply because they don't know it's even possible. As the old saying goes, when you have a hammer, every problem looks like a nail. In this tutorial I'll be guiding you through the basics of web scraping using R and the `xml2` package. I'll begin with a simple example using fake data and elaborate further by trying to scrape the location of a sample of schools in Spain. We will discuss the pros and cons of web scraping and discuss how to scrape data ethically. I assume zero knowledge on the topic, so feel free to come if you're completely new to the topic."""

event = "Tutorial"
event_url = ""
event_form = "https://forms.gle/ni83EDkwpTb83yu48"

location = "**Room 18.0.A06**. Campus de Getafe, Calle Madrid, 126, 28903 Getafe, Madrid, Spain."
  
selected = false

# Links (optional).
url_pdf = ""
url_slides = ""
url_video = ""
url_code = ""

[image]
  caption = "[**External link**](https://github.com/cimentadaj)"
  focal_point = "Center" 
+++

### Requirements

We'll be needing these packages: `xml2`, `httr`, `tidyverse`, `sf`, `rnaturalearth`, `scrapex`. All of those can install from cran, except `scrapex`, which can be installed with
`remotes::install_github("cimentadaj/scrapex")`.

### About the speaker

Jorge Cimentada has a PhD in Sociology from Pompeu Fabra University and is currently a Research Scientist at the Laboratory of Digital and Computational Demography at the Max Planck Institute for Demographic Research. His research is mainly focused on the study of educational inequality, inequality in spatial mobility and computational social science. He has worked on data science projects both in the private sector and in academic research and is interested developing strategies for combining machine learning techniques with classical statistics for the social sciences. You can check out his blog at [cimentadaj.github.io](https://cimentadaj.github.io/about) or contact him through Twitter at [@cimentadaj](https://twitter.com/cimentadaj).
