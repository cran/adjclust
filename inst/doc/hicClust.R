## ----loadLib, message = FALSE--------------------------------------------
library("adjclust")
library("HiTC")

## ----loadData------------------------------------------------------------
data("hic_imr90_40_XX", package = "adjclust")

## ----mapHiC, message=FALSE-----------------------------------------------
HiTC::mapC(hic_imr90_40_XX)

## ----hicClust-HTCexp-----------------------------------------------------
fit <- hicClust(hic_imr90_40_XX)

## ----binning, message=FALSE----------------------------------------------
binned <- HiTC::binningC(hic_imr90_40_XX, binsize = 5e5)
HiTC::mapC(binned)
fitB <- hicClust(binned)
fitB

## ----dendro--------------------------------------------------------------
plot(fitB)

## ----objectDesc----------------------------------------------------------
head(cbind(fitB$merge, fitB$gains))

## ----session-------------------------------------------------------------
sessionInfo()

