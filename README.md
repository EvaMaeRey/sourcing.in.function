
  - [Part I. Work out functionality 🚧
    ✅](#part-i-work-out-functionality--)
      - [Try it out](#try-it-out)
  - [Part II. Packaging and documentation 🚧
    ✅](#part-ii-packaging-and-documentation--)
      - [Phase 1. Minimal working
        package](#phase-1-minimal-working-package)
      - [Phase 2: Listen & iterate 🚧 ✅](#phase-2-listen--iterate--)
      - [Phase 3: Settling and testing 🚧
        ✅](#phase-3-settling-and-testing--)
      - [Phase 4. Promote to wider audience… 🚧
        ✅](#phase-4-promote-to-wider-audience--)
      - [Phase 5: Harden/commit: Submit to CRAN/RUniverse 🚧
        ✅](#phase-5-hardencommit-submit-to-cranruniverse--)
  - [Appendix: Reports, Environment](#appendix-reports-environment)
      - [Description file complete? 🚧 ✅](#description-file-complete--)
      - [Environment 🚧 ✅](#environment--)
      - [`devtools::check()` report](#devtoolscheck-report)
      - [Package directory file tree](#package-directory-file-tree)

# Part I. Work out functionality 🚧 ✅

Here is a function that will do some work…

``` r
write_function_template <- function(){
'say_hello <- function(){
  
  "hello"
  
}'
}

write_new_function_from_template <- function(pattern = "hello", replacement = "hi"){
  
  tmp <- tempfile()
  
  write_function_template() |>
    stringr::str_replace_all(pattern = pattern,
                         replacement = replacement) |>
    writeLines(con = tmp)

  source(tmp)

  }
```

## Try it out

``` r
write_new_function_from_template()

say_hi()
#> [1] "hi"
```

# Part II. Packaging and documentation 🚧 ✅

## Phase 1. Minimal working package

### Bit A. Created package archetecture, running `devtools::create(".")` in interactive session. 🚧 ✅

``` r
devtools::create(".")
```

### Bit B. Managing [dependencies](https://r-pkgs.org/dependencies-in-practice.html) if they exist 🚧 ✅

Dependencies – use of non-base R functions within your function – must
be declared in your package.

This means …

1.  you’ll use the `::` notation, e.g. `package::function()` in your
    functions when you use another package’s functions.  
2.  you’ll document package dependencies to your DESCRIPTION file – this
    can be done automatically with `usethis::use_package`, the example
    is the case where ggplot2 is a dependency:

<!-- end list -->

``` r
usethis::use_package("stringr")
```

### Bit C. Moved functions [R code folder](https://r-pkgs.org/code.html)? 🚧 ✅

Use new {readme2pkg} function to do this from readme…

``` r
readme2pkg::chunk_to_r(chunk_name = "write_new_function_from_template")
```

### Bit D. Run [`devtools::check()`](https://r-pkgs.org/whole-game.html#check) and address errors. 🚧 ✅

``` r
devtools::check(pkg = ".")
```

devtools check will document the functions for you.

### Bit E. [Install](https://r-pkgs.org/whole-game.html#install) and restart your brand new package\!\! 🚧 ✅

``` r
devtools::install(pkg = ".", upgrade = "never")
```

### Bit F. Write traditional README that uses built package (also serves as a test of build). 🚧 ✅

The goal of the {xxxx} package is to …

Install package with:

    remotes::install_github("GithubCoolUser/mypacakge")

Once functions are exported you can remove go to two colons, and when
things are are really finalized, then go without colons (and rearrange
your readme…)

``` r
library(sourcing.in.function)  ##<< change to your package name here
sourcing.in.function:::write_new_function_from_template("hello", "byebye")

say_byebye()
#> [1] "byebye"
```

### Bit G. Add [lifecycle badge](https://r-pkgs.org/lifecycle.html) (experimental) 🚧 ✅

``` r
usethis::use_lifecycle_badge("experimental")
```

### Bit H. Compile README.Rmd 🚧 ✅

### Bit I. Push to github. 🚧 ✅

RStudio: Console/Terminal/RMarkdown/Jobs:

Terminal -\> git add . -\> git commit -m “first commit” -\> git push

## Phase 2: Listen & iterate 🚧 ✅

Try to get feedback from experts on API, implementation, default
decisions, names. Is there already work that solves this problem?

> “Hey Jordan, I know you are an expert in multiplication methods. I was
> wondering if you’d have a look at the motivation and functionality in
> my development {times.two} package found at
> github.com/myusername/times.two”

> “Hey Ella, I know you’ve done great worked on {times.three}. I think
> my new project does something similar in terms API. I was wondering if
> you’d have a look at the implementation. Code can be found in
> github.com/myusername/times.two”

## Phase 3: Settling and testing 🚧 ✅

In this phase you should start settling on function and argument names,
decide which ones will be exported, and make those functions more robust
and usable with examples, tests, messages and warnings.

### Bit A. Added a description and author information in the [DESCRIPTION file](https://r-pkgs.org/description.html) 🚧 ✅

### Bit B. Added [roxygen skeleton](https://r-pkgs.org/man.html)? 🚧 ✅

Use a roxygen skeleton for auto documentation and making sure proposed
functions are *exported*. (in RStudio ’Code -\> insert Roxygen Skeleton)
Generally, early on, I don’t do much (anything) in terms of filling in
the skeleton for documentation, because things may change.

### Bit C. Chosen a [license](https://r-pkgs.org/license.html)? 🚧 ✅

``` r
usethis::use_mit_license()
```

### Bit D. Settle on [examples](https://r-pkgs.org/man.html#sec-man-examples). Put them in the roxygen skeleton and readme. 🚧 ✅

### Bit E. Written formal [tests](https://r-pkgs.org/testing-basics.html) of functions and save to test that folders 🚧 ✅

That would look like this…

``` r
library(testthat)

test_that("calc times 2 works", {
  expect_equal(times_two(4), 8)
  expect_equal(times_two(5), 10)
  
})
```

``` r
readme2pkg::chunk_to_tests_testthat("test_calc_times_two_works")
```

### Bit F. Check again. Addressed notes, warnings and errors. 🚧 ✅

``` r
devtools::check(pkg = ".")
```

## Phase 4. Promote to wider audience… 🚧 ✅

### Bit A. Package website built? 🚧 ✅

### Bit B. Package website deployed? 🚧 ✅

## Phase 5: Harden/commit: Submit to CRAN/RUniverse 🚧 ✅

# Appendix: Reports, Environment

## Description file complete? 🚧 ✅

``` r
readLines("DESCRIPTION")
```

## Environment 🚧 ✅

Here I just want to print the packages and the versions

``` r
all <- sessionInfo() |> print() |> capture.output()
all[11:17]
#> [1] ""                                                                         
#> [2] "attached base packages:"                                                  
#> [3] "[1] stats     graphics  grDevices utils     datasets  methods   base     "
#> [4] ""                                                                         
#> [5] "other attached packages:"                                                 
#> [6] "[1] sourcing.in.function_0.0.0.9000"                                      
#> [7] ""
```

## `devtools::check()` report

``` r
devtools::check(pkg = ".")
```

## Package directory file tree

``` r
fs::dir_tree(recurse = T)
#> .
#> ├── DESCRIPTION
#> ├── NAMESPACE
#> ├── R
#> │   └── write_new_function_from_template.R
#> ├── README.Rmd
#> ├── README.md
#> ├── man
#> └── sourcing.in.function.Rproj
```
