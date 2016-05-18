get_data_from_web<-function(){
rm(list=ls())
idformat<-read.csv(system.file("extdata","id_format.csv",package="dataASPEP"))
dataformat<-read.csv(system.file("extdata","data_format.csv",package="dataASPEP"))
itemcodeoriginalcoding<-data.frame(variable="itemcode",
                                   levels=
                                     c("000","001","002","005","006","012","112","014","016","018","021","022","023","024","124","025","029","032","040","044","050","052","059","061","062","162","079","080","081","087","089","090","091","092","093","094"),
                                   labels=c("Totals for Government ",	"Airports ",	"Space Research & Technology (Federal) ",	"Correction ",	"National Defense and International Relations (Federal) ",	"Elementary and Secondary - Instruction ",	"Elementary and Secondary - Other Total ",	"Postal Service (Federal) ",	"Higher Education - Other ",	"Higher Education - Instructional ",	"Other Education (State) ",	"Social Insurance Administration (State) ",	"Financial Administration ",	"Firefighters ",	"Fire - Other ",	"Judical & Legal ",	"Other Government Administration ",	"Health ",	"Hospitals ",	"Streets & Highways ",	"Housing & Community Development (Local) ",	"Local Libraries ",	"Natural Resources ",	"Parks & Recreation ",	"Police Protection - Officers ",	"Police-Other ",	"Welfare ",	"Sewerage ",	"Solid Waste Management ",	"Water Transport & Terminals ",	"Other & Unallocable ",	"Liquor Stores (State) ",	"Water Supply ",	"Electric Power ",	"Gas Supply ",	"Transit "))
stateoriginalcoding<-data.frame(variable="state",levels=sprintf("%02d", 1:51),
                                labels=c(state.name[1:8],"District of Columbia",state.name[9:50]))
typeoriginalcoding<-data.frame(variable="type",levels=as.character(0:6),
                               labels=c("State government","County government","Municipal government","Township government","Special district government","School district government","Federal Government"))



get_data_from_web<-function(webfile,format.table){
  tmpf  <-tempfile()
  download.file(file.path("http://www2.census.gov/govs/apes/",webfile),tmpf)
  x=unzip(tmpf,exdir = tempdir())
  y<-read.fwf(x,width=format.table$length,
              header=FALSE,
              colClasses=c("character","numeric","numeric")[format.table$class],fill=TRUE)
  y<-y[format.table$variable!=""]
  names(y)<-format.table$variable[format.table$variable!=""]
y}
reformat<-function(y){
  y$id=paste0(y$state,y$type_of_gov,y$county,y$unit_identification_number,y$supp_code,y$sub_code)
  y$itemcode<-factor(y$itemcode,levels=itemcodeoriginalcoding$levels,labels=itemcodeoriginalcoding$labels)
y[c("id","itemcode","ftemp","fteemp","ftpay","ptemp","ptpay","pthours","fte")]}
reformat_gov<-function(y){
  y$id=paste0(y$state,y$type_of_gov,y$county,y$unit_identification_number,y$supp_code,y$sub_code)
  y$state      <-factor(y$state,levels=stateoriginalcoding$levels,labels=stateoriginalcoding$labels)
  y$type_of_gov<-factor(y$type_of_gov,levels=typeoriginalcoding$levels,labels=typeoriginalcoding$labels)
  y}


aspep2007    <-reformat(get_data_from_web("07cempst.zip",dataformat))
aspep2007_gov<-reformat_gov(get_data_from_web("07cempid.zip",idformat))
aspep2009    <-reformat(get_data_from_web("09empst.zip",dataformat))
aspep2009_gov<-reformat_gov(get_data_from_web("09empid.zip",idformat))
aspep2010    <-reformat(get_data_from_web("10empst.zip",dataformat))
aspep2010_gov<-reformat_gov(get_data_from_web("10empid.zip",idformat))
aspep2011    <-reformat(get_data_from_web("11empst.zip",dataformat))
aspep2011_gov<-reformat_gov(get_data_from_web("11empid.zip",idformat))
aspep2012    <-reformat(get_data_from_web("12cempst.zip",dataformat))
aspep2012_gov<-reformat_gov(get_data_from_web("12cempid.zip",idformat))


listofids<-unique(unlist(lapply(grep("_gov",ls(),value = TRUE)[-6],function(x){get(x)$id})))

z=find.package("dataASPEP")
for (x in (grep("aspep",ls(),value = TRUE))){
  eval(parse(text=paste0(x,"$id=factor(",x,"$id,levels=listofids);save(",x,",file=file.path(z,'data/",x,".rda')")))}
}