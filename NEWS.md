# Version 0.5.6 [2018-02-08]

* changed dependencies to bioconductor packages 'HiTC' and 'snpStats' into 
Suggest and conditionnaly used them

# Version 0.5.5 [2018-01-30]

* simplified code (replaced many C functions by a unique R function using 
Matrix)
* adjClust now properly handles similarities with diagonal entries different 
from 1
* removed arguments that were not used (blMin and verbose)
* simplified Hi-C example

# Version 0.5.4 [2018-01-12]

* More tests for modify and modifySparse 
* BUG FIX in condnCheck

# Version 0.5.3 [2017-12-04]

* 'height' is now defined as the value of the linkage criterion (as is done in
'hclust'), rather than the total inertia of the clustering (as is done in
'rioja').
* Added several representations for the dendrogram corresponding to different
choices for the height.
* Improved documentation and vignettes.
* Removed non-standard fields in the output of 'adjclust' (#13).
* Added tests for: equivalence with 'hclust',  comparing sum of heights and 
   pseudo inertia, plots, non-increasing heights, cutree (#14).
* Fixed #13 (man).
* Fixed #15 (Cutree with decreasing merges).
* Fixed #3 (Non-positive 'gains').
* Using BiocStyle::html_document2 as a temporary fix for vignette 
  compilation errors.

# Version 0.5.2 [2017-10-17]

* Added citation to Alia Dehman's PhD thesis to DESCRIPTION.

# Version 0.5.1 [2017-10-16]

* More informative 'Description' of the method in DESCRIPTION
* Updates to test scripts to pass R CMD check on all windows platforms
* Moved README-*.png files to man/figures

# Version 0.5.0 [2017-10-13]

* Bump version number for CRAN submission

# Version 0.4.2 [2017-10-05]

* Added 'chac' S3 class and corresponding 'plot' and 'summary' methods
* Documentation cleanups
* Removed objects "R2.100" and "Dprime.100" (can be obtained from the 
  imported 'snpStats' package)
* In 'snpClust': argument 'stat' is now passed to the 'snpStats::ld' function 
  through '...'
* Some code cleanups
* Improved handling of default value for 'h' in 'adjclust' for 'dist' objects
* Renamed 'prevfit' into the more explicit 'res_adjclust_0.3.0'
* Dropped 'simmatrix' toy data set (now generated on the fly in tests)

# Version 0.4.1 [2017-09-15]

* Cleanups in Hi-C and LD vignettes and corresponding tests
* Dropped outdated BALD test script
* Added test script for NA values in LD
* Renamed Hi-C data sets and updated corresponding documentation
* Added package website generated by pkgdown

# Version 0.4.0 [2017-08-29]

* Implemented interface to handle standard and sparse matrices in adjClust
* Implemented interface to handle either kernel or dissimilarities
* Implemented wrapper for SNP and Hi-C data
* Documented the package and created vignettes for the different use cases
* Added scripts to increase package coverage and test the equivalence with 
  rioja for the small dimensional case
* Cleaned up code to improve efficiency and removed unnecessary scripts and functions

# Version 0.3.0 [2017-02-13]

* Removed 'adjClustBand': main entry points are now 'HeapHop' and 'adjClustBand_heap'.
* Updated test scripts and LD vignette accordingly.
* Added Travis CI and Appveyor support.

# Version 0.2.*

## Version 0.2.3 [2017-02-02]

* Updated LD vignette
* In adjClustBand, renamed flavor "Koskas" to "PseudoMatrix"

## Version 0.2.2 [2016-12-01]

* Added dummy R/adjclust.R so that document() adds 'importFrom Rcpp evalCpp' to NAMESPACE
* "Fixed" warning at check due to .hpp file in src (this warning should not exist IMHO)

## Version 0.2.1 [2016-11-09]

* Added minimal documentation
* Replaced "std::cout" by "Rcpp::Rcout", and so on for "exit()" and "cerr".

## Version 0.2.0 [2016-06-24]

* Incorporated Michel's implementation (R function 'HeapHop')
* 'adjClustBand' is now a wrapper to call either Alia's or Michel's
  implementation

# Version 0.1.0 [2016-06-24]

* Created from BALD
* Added a test to check that we are reproducing the results of BALD::cWard