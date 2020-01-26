get_data_from_web<-function(directory=NULL){
  years=c(2007,2009:2012)
  codes_in_web_files=read.csv(system.file("extdata","codes_in_web_files.csv",package="dataASPEP"),colClasses = "character")
  reformat<-function(y){
    y$id=paste0(y$state,y$type_of_gov,y$county,y$unit_identification_number,y$supp_code,y$sub_code)
    for (x in intersect(unique(codes_in_web_files$variable),names(y))){
      ref<-codes_in_web_files[codes_in_web_files$variable==x,]
      y[x][[1]]<-factor(y[x][[1]],levels=ref$levels,labels=ref$labels)}
    y[if(is.element("itemcode",names(y))){c("id","itemcode","ftemp","fteemp","ftpay","ptemp","ptpay","pthours","fte")}else{names(y)}]
  }
  get_data_from_webs<-function(webfile,format.table){
    tmpf  <-tempfile()
    data.url<-file.path("http://www2.census.gov/govs/apes",webfile)
    xxxx=try(download.file(url=data.url,destfile = tmpf,method="wget",extra="--random-wait --retry-on-http-error=503"))
    while(is.element("try-error",class(xxxx))){
      warning(paste0("Have to try to download ",data.url," again, previous attempt failed"))
      download.file(url=data.url,destfile = tmpf,method="wget",extra="--random-wait --retry-on-http-error=503")
    }
    Sys.sleep(sample(10, 1))
    x=unzip(tmpf,exdir = tempdir())
    y<-read.fwf(x,width=format.table$length,
                header=FALSE,
                colClasses=c("character","numeric","numeric")[format.table$class],fill=TRUE)
    y<-y[format.table$variable!=""]
    names(y)<-format.table$variable[format.table$variable!=""]
    reformat(y)}
  L1<-lapply(c("07cempst.zip","09empst.zip","10empst.zip","11empst.zip","12cempst.zip"),get_data_from_webs,
         format.table=read.csv(system.file("extdata","data_format.csv",package="dataASPEP")))
  L2<-lapply(c("07cempid.zip","09empid.zip","10empid.zip","11empid.zip","12cempid.zip"),get_data_from_webs,
         format.table=read.csv(system.file("extdata","id_format.csv",package="dataASPEP")))
  names(L1)<-paste0("aspep",years)
  names(L2)<-paste0("aspep",years,"_gov")
  listofids<-unique(unlist(lapply(L1,function(x){x$id})))
  attach(L1);attach(L2)
  if(!is.null(directory)){
    cat(paste(paste0("aspep",outer(years,c("","_gov"),paste0)),collapse="\n"),file=file.path(directory,'datalist'))}
  for (x in c(names(L1),names(L2))){
    savetopackage=TRUE
    eval(parse(text=paste0(x,"$id=factor(",x,"$id,levels=listofids);if(savetopackage){save(",x,",file=file.path(directory,'/",x,".rda'))}")))}
  if(!savetopackage){return(c(L1,L2))}}