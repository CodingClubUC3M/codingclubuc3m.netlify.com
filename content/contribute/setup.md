+++
title = "Pre-requisites"

date = 2019-01-06
lastmod = 2019-01-06

toc = true
type = "docs"  # Do not modify.

[menu.contribute]
  parent = "Setup"
  weight = 1
+++

This web is rendered into static content using [Hugo](https://gohugo.io/) from
plain Markdown files, which means that you do not need anything special to
contribute beyond a plain text editor. However, some tools may facilitate the
process.

## Local previsualization

Hugo may be used to render and previsualize the result locally. According to the
theme provider, [at least Hugo v0.49 is needed](https://sourcethemes.com/academic/docs/install/).
However, even if you chose to contribute a `.md` document, the R package
`blogdown` is much more convenient. In an R console, the following lines install
the package along with the current version of Hugo:

```r
install.packages("blogdown")
blogdown::install_hugo()
```

Then, the usage is very simple. From the root of the repository,

```r
blogdown::serve_site()
```

renders the web and launches a local preview. Moreover, each time a file is
modified, the web is updated automatically. Once the job is done, simply run

```r
blogdown::stop_server()
```

Refer to the [official documentation](https://bookdown.org/yihui/blogdown/) for
further details.

## R Markdown rendering

R Markdown documents must be pre-rendered, either into `.md` or directly into
`.html`. Then, both the `.Rmd` + `.md` or `.html` shall be contributed. This can
be done directly from a plain R console using the packages `knitr` and
`rmarkdown`. But again, we recommend using the [RStudio](https://www.rstudio.com/)
IDE, which automates this task.

Note that other packages may be needed to support chunks in other languages
(e.g., `reticulate` for Python, `JuliaCall` for Julia, `Rcpp` for C++...).

## Managing the web repository

This web is [hosted on GitHub](https://github.com/CodingClubUC3M/codingclubuc3m.netlify.com),
so a GitHub account is required to fork the repository, commit the draft and
open a pull request. For further details about GitHub and `git` usage, refer to
the tutorial [*Version control systems for researchers*](/post/2018-09-25/).
