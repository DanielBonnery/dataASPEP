.onLoad<- function(libname, pkgname) {
  if(!all(is.element(paste0("aspep",outer(c(2007,2009:2012),c(".rda","_gov.rda"),paste0)),
                     list.files(file.path(find.package("dataASPEP"),"data"))))){
    packageStartupMessage(
"
###########################################################
# This is the first time the package dataASPEP is loaded. #
# Or all the data has not been downloaded yet.            #
# It is recommended to execute:                           #
#                                                         #
#       get_data_from_web()                               #
#                                                         #
# After which data is going to be downloaded from the     #
# Census Website.                                         #
# A connection to the web is needed.                      #
# This takes a long time (less than 10 minutes though).   #
###########################################################
")
  }}