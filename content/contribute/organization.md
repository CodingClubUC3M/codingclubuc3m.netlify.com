+++
title = "Content organization"

date = 2019-01-06
lastmod = 2019-01-06

toc = true
type = "docs"  # Do not modify.

[menu.contribute]
  parent = "Write"
  weight = 1
+++

## Document path

As can be seen from [previous sessions](/post/), the name of the document is the
session date in ISO format. So, if your session is scheduled for May 10, 2018,
you shall create the following file:

```bash
./content/post/2018-05-10.md # or .Rmd
```

If R Markdown is preferred, then after rendering, these two files must be
provided:

```bash
./content/post/2018-05-10.html
./content/post/2018-05-10.Rmd
```

## Resouces path

If images or other resources are needed, these should be placed under the
following directory:

```bash
./static/post/2018-05-10_files/
```

If required, please create it and populate it. And again, please do not forget
to replace the date above with your schedule.

{{% alert note %}}
Note that rendering an R Markdown tutorial called `<date>.Rmd` with any plot will
automatically create the `./static/post/<date>_files/` folder for you, and will
save such plots there.
{{% /alert %}}
