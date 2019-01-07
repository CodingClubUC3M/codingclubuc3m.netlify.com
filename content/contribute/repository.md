+++
title = "Repository"

date = 2019-01-06
lastmod = 2019-01-06

toc = true
type = "docs"  # Do not modify.

[menu.contribute]
  parent = "Setup"
  weight = 2
+++

## Fork and clone

[This is the repository](https://github.com/CodingClubUC3M/codingclubuc3m.netlify.com).
The first step is to get a fork in your own GitHub account. Then, get a local clone:

```bash
git clone git@github.com:<your-user>/codingclubuc3m.netlify.com.git
cd codingclubuc3m.netlify.com
```

The working directory will have the following structure:

```
.
├── content
|   ├── contribute
|   ├── home
|   ├── post  <-- Here goes your tutorial
|   └── talk
├── static
|   ├── img
|   └── post  <-- Here goes any additional resources
└── themes
```

{{% alert warning %}}
Do not commit any file not related to your draft. Particularly, the first time
`blogdown::serve_site()` is executed, the existing `.Rmd`s will be rendered again
and some files under `/static/post` will appear as changed. Please execute also
`git checkout .` too for this first time.
{{% /alert %}}

## Commit and push changes

Once you are ready, commit the changes into your local clone. To avoid committing
any non-intended file, please add files selectively:

```bash
git add content/post/<your-tutorial>
git add static/post/<your-directory> # if required
git commit -m "new post"
git push # to GitHub
```

Of course, you can commit and push further changes if required.

## Pull request and review process

Navigate to your fork on GitHub and open a pull request (PR) to submit the
changes to our repository. During the peer-review process, if further changes
are required, you can commit and push them as in the previous step, and they
are added to the PR automatically.
