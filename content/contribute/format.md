+++
title = "Formatting"

date = 2019-01-06
lastmod = 2019-01-06

toc = true
type = "docs"  # Do not modify.

[menu.contribute]
  parent = "Write"
  weight = 2
+++

## Front matter

The front matter at the top of the Markdown document has the following format
and fields (the same for plain and R-flavoured Markdown):

```
---
title: "Useful one-function R packages, big data solutions, and a message from Yoda"
authors: ["Eduardo García-Portugués"]
date: 2018-05-10
categories: ["R"]
tags: ["R", "big data", "visualization", "benchmark"]
---
```

The selected categories should be the main high-level languages or technologies
used in the tutorial (see [the current list of categories](/categories/)). The
selected tags should be the categories plus any fundamental concept covered in
the tutorial (see [the current list of tags](/tags/)).

Additionally, if you are editing in R Markdown, the following code chunk should
be placed right after the front matter:

````markdown
```{r, setup, include = FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
````

Finally, the first paragraph or your document, after the front matter, must be
the abstract, **without any leading title**. [Example](/post/2018-05-10/):

```markdown
As the title reads, in this heterogeneous session we will see three topics of
different interest. The first is a collection of three simple and useful
one-function R packages that I use regularly in my coding workflow. The second
collects some approaches to handling and performing linear regression with big
data. The third brings in the freaky component: it presents tools to display
graphical information in plain ASCII, from bivariate contours to messages from Yoda!
```

## Writing guidelines

In Markdown, you can write rich text, you can include code, images... and of
course, math! For general guidelines, please refer to the theme's documentation:
[*Writing content with Markdown, $\LaTeX$, and Shortcodes*](https://sourcethemes.com/academic/docs/writing-markdown-latex/).
In the following, there are some comments about the style.

### Sub-headings

Top-level headings (`<h1>`) shall not be used, because this is the format in which
the title of the post is rendered. Only sub-headings shall be used, and using more
than three levels is not advisable. Also please add space before and after any
sub-heading:

```markdown
## Sub-heading 2

Some text...

### Sub-heading 3

Some text...

#### Sub-heading 4

Some text...

```

### Lists

Dashes are preferred over asterisks for unordered lists, because asterisks are
also used for emphasize words and may cause issues. To properly render lists,
please remove any empty lines between list elements:

```markdown
1. one element
  - one thing
  - another thing
2. second element
```

### Images

If you use the general Markdown shortcode to include images (`![alt](path)`),
the path must be relative to `/static/`:

```markdown
![<alt text here>](/post/<date>_files/<image-name>)
```

## Tips and tricks

- **Indent your code**. This is very basic advice and should not be necessary,
  but still, please **indent your code properly**.

- It is advisable to **provide a list of required packages** at the beginning,
  right after the abstract ("this tutorial requires the following packages..."),
  along with the command(s) required to install them (set the option `eval=FALSE`
  for that chunk to avoid its execution during rendering).

- For reproducibility reasons, **set a seed** at the top of your document. In
  this way, each time it is rendered it gives the same results and same plots.

- **Keep the rendering time low**. If any chunk takes a lot of time, prevent its
  execution by setting the option `eval=FALSE` in that particular chunk. If the
  result is important (e.g., a plot) execute it once and save the result as a
  static resource.

- If your tutorial requires any non-trivial piece of software (e.g., Tensorflow,
  Stan...), it is better to provide a `.md`, or to set `eval=FALSE` as a global
  option in the setup chunk, at the top of your `.Rmd`.
