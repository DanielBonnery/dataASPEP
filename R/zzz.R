.onLoad<- function(libname, pkgname) {
  if(!all(is.element(paste0("aspep",outer(c(2007,2009:2012),c("","_gov"),paste0)),
                     data(package="dataASPEP")$results[, "Item"]))){
    packageStartupMessage("This is the first time you load dataASPEP.
                          Data is going to be downloaded from the Census Website.
                          You need a connection to the web.")
    
    dataASPEP::get_data_from_web
  }}