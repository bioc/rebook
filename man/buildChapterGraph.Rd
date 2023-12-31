% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildChapterGraph.R
\name{buildChapterGraph}
\alias{buildChapterGraph}
\title{Build the chapter dependency graph}
\usage{
buildChapterGraph(dir, recursive = TRUE, pattern = "\\\\.Rmd$")
}
\arguments{
\item{dir}{String containing the path to the directory containing Rmarkdown reports.
This is searched recursively for all files ending in \code{".Rmd"}.}

\item{recursive, pattern}{Further arguments to pass to \code{\link{list.files}} 
when searching for Rmarkdown reports.}
}
\value{
A directed \link[igraph]{graph} object from the \pkg{igraph} package,
where each node is a chapter and is connected to its dependencies by an edge.
}
\description{
Build the dependency graph between chapter based on their \code{\link{extractCached}} calls to each other.
}
\examples{
dir <- tempfile()
dir.create(dir)

tmp1 <- file.path(dir, "alpha.Rmd")
write(file=tmp1, "```{r, echo=FALSE, results='asis'}
rebook::chapterPreamble()
```

```{r}
rodan <- 1
```")

tmp2 <- file.path(dir, "bravo.Rmd")
write(file=tmp2, "```{r, echo=FALSE, results='asis'}
rebook::chapterPreamble()
```

```{r}
extractCached('alpha.Rmd')
```")

# Building the chapter graph:
g <- buildChapterGraph(dir)
plot(g)
 
}
\author{
Aaron Lun
}
