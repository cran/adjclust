
# adjclust: Adjacency-constrained clustering

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/adjclust)](https://cran.r-project.org/package=adjclust)
[![R build
status](https://github.com/pneuvial/adjclust/workflows/R-CMD-check/badge.svg)](https://github.com/pneuvial/adjclust/actions)
[![Coverage
Status](https://img.shields.io/codecov/c/github/pneuvial/adjclust/develop.svg)](https://app.codecov.io/github/pneuvial/adjclust/branch/develop)

`adjclust` is a package that provides methods to perform
adjacency-constrained hierarchical agglomerative clustering.
Adjacency-constrained hierarchical agglomerative clustering is
hierarchical agglomerative clustering (HAC) in which each observation is
associated to a position, and the clustering is constrained so as only
adjacent clusters are merged. It is useful in bioinformatics
(e.g. Genome Wide Association Studies or Hi-C data analysis).

`adjclust` provides three user level functions: `adjClust`, `snpClust`
and `hicClust`, which are briefly explained below.

## Installation

You can install adjclust from github with:

``` r
# install.packages("devtools")
devtools::install_github("pneuvial/adjclust")
```

## `adjClust`

`adjClust` performs adjacency-constrained HAC for standard and sparse,
similarity and dissimilarity matrices and `dist` objects.
`Matrix::dgCMatrix` and `Matrix::dsCMatrix` are the supported sparse
matrix classes. Let’s look at a basic example

``` r
library("adjclust")

sim <- matrix(c(1.0, 0.5, 0.2, 0.1,
                0.5, 1.0, 0.1, 0.2,
                0.2, 0.1, 1.0, 0.6,
                0.1, 0.2 ,0.6 ,1.0), nrow=4)
h <- 3
fit <- adjClust(sim, "similarity", h)
plot(fit)
```

![](man/figures/README-adjClust-1.png)<!-- -->

The result is of class `chac`. It can be plotted as a dendrogram (as
shown above). Successive merge and heights of clustering can be obtained
by `fit$merge` and `fit$height` respectively.

## `snpClust`

`snpClust` performs adjacency-constrained HAC for specific application
of Genome Wide Association Studies (GWAS). A minimal example is given
below. See [GWAS Vignette](vignettes/snpClust.Rmd) for details.

``` r
library("snpStats")
#> Loading required package: survival
#> Loading required package: Matrix
data("ld.example", package = "snpStats")
geno <- ceph.1mb[, -316]  ## drop one SNP leading to one missing LD value
h <- 100
ld.ceph <- ld(geno, stats = "R.squared", depth = h)
image(ld.ceph, lwd = 0)
```

![](man/figures/README-snpClust-1.png)<!-- -->

``` r

fit <- snpClust(geno, stats = "R.squared", h = h)
#> Warning in run.snpClust(x, h = h, stats = stats): Forcing the LD similarity to
#> be smaller than or equal to 1
#> Note: 133 merges with non increasing heights.
plot(fit)
#> Warning: 
#> Detected reversals in dendrogram: mode = 'corrected', 'within-disp' or 'total-disp' might be more relevant.
```

![](man/figures/README-snpClust-2.png)<!-- -->

``` r
sel_clust <- select(fit, "bs")
plotSim(as.matrix(ld.ceph), clustering = sel_clust, dendro = fit)
#> Warning: 
#> Detected reversals in dendrogram: mode = 'corrected', 'within-disp' or 'total-disp' might be more relevant.
#> Warning: Removed 602 rows containing missing values (`geom_text()`).
```

![](man/figures/README-snpClust-3.png)<!-- -->

## `hicClust`

`hicClust` performs adjacency-constrained HAC for specific application
of Hi-C data analysis. A minimal example is given below. See [Hi-C
Vignette](vignettes/hicClust.Rmd) for details.

``` r
library("HiTC")
```

``` r
load(system.file("extdata", "hic_imr90_40_XX.rda", package = "adjclust"))
binned <- binningC(hic_imr90_40_XX, binsize = 5e5)
#> Bin size 'xgi' =500488 [1x500488]
#> Bin size 'ygi' =500488 [1x500488]
mapC(binned)
#> minrange= 104  - maxrange= 36776.8
```

![](man/figures/README-hicClust-1.png)<!-- -->

``` r

fitB <- hicClust(binned)
#> Note: 5 merges with non increasing heights.
plot(fitB)
#> Warning: 
#> Detected reversals in dendrogram: mode = 'corrected', 'within-disp' or 'total-disp' might be more relevant.
```

![](man/figures/README-hicClust-2.png)<!-- -->

``` r
plotSim(intdata(binned), dendro = fitB) # default: log scale for colors
#> Warning: 
#> Detected reversals in dendrogram: mode = 'corrected', 'within-disp' or 'total-disp' might be more relevant.
#> Warning: Removed 41 rows containing missing values (`geom_text()`).
```

![](man/figures/README-hicClust-3.png)<!-- -->

## Credits

Version 0.4.0 of this package was completed by Shubham Chaturvedi as a
part of the [Google Summer of Code
2017](https://summerofcode.withgoogle.com/projects/#4961904920363008)
program.
