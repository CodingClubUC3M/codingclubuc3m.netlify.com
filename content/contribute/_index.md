+++
title = "Getting started"

date = 2019-01-05
lastmod = 2019-01-06

toc = true
type = "docs"

[menu.contribute]
  parent = "Overview"
  weight = 1
+++

Coding Club UC3M celebrates a series of participative sessions at Universidad
Carlos III de Madrid among coding enthusiasts interested in data analysis,
number crunching and teaching of statistics using a variety of languages and tools.

Each session consists of a ~1-hour [talk](/talk/), and follows a reproducible
tutorial that is [posted](/post/) in this website for the session and for future
reference. This documentation describes the contributing process, which is intended
to be as smooth and painless as possible for both the contributors as well as
the organizers.

## Get in contact

If you wish to contribute a session, the first step is to get contact with the 
organizers to prearrange logistics and have some feedback on the session's topic.
To do so, please get in contact with them at any of the sessions or, 
alternatively, send a [proposal form](https://goo.gl/forms/5OEDWrV6P0rFn7K03).

## Authoring process

This web is [hosted on GitHub](https://github.com/CodingClubUC3M/codingclubuc3m.netlify.com)
and deployed on Netlify using [Hugo](https://gohugo.io/). Therefore, each tutorial
consists of a simple [Markdown](https://en.wikipedia.org/wiki/Markdown) document
plus, if required, images or other resources.

The tutorial can be either a plain Markdown document, with extension `.md`, or a
[R-flavored Markdown](https://rmarkdown.rstudio.com/) document, `.Rmd`. We prefer
the latter because it is reproducible: code chunks (in R, but also in other
languages such as Bash, Python, Julia, SQL or even C++) are executed and their
output appended (including plots) when the document is rendered.

Whichever is your choice, please start by reviewing a few introductory topics
about the authoring process:

- [**Setup**](setup): describes the pre-requisites, how to clone the repository
  and prepare the development environment to contribute a tutorial.
- [**Write**](organization): describes the content organization (where to put
  the Markdown document and other resources such as images), the front matter
  and provides some guidelines about formatting.

Also, you may want to have a look at our running list of
[suggested topics](topics). And even if you are experienced, please do not
forget to read our curated list of [tips and tricks](format#tips-and-tricks).

Once the draft is ready, the contributor shall open a pull request (PR) on
GitHub. Then, a reviewer from the organization shall be assigned, and changes
may be discussed and requested. The main advantage of this method is that Netlify
also deploys PRs, so that the result can be previewed online before publishing.

Your materials, as the rest of contents of the website, will be licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).

## Timeframe and milestones

- **3-4 weeks before the session**, and in order to timely publish an
  [announcement](/talk/), the contributor shall provide by email **the title**,
  **the abstract** and **a photo** with good resolution.
- **2-3 weeks before the session**, the contributor shall open a PR containing
  the draft and the resources needed, so that the peer-review process can start.
- Before the session, the PR shall be finally merged to make the tutorial
  available online for the talk.
