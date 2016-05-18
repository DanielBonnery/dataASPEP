\name{aspepXXXX_gov}
\alias{aspep2007_gov}
\alias{aspep2009_gov}
\alias{aspep2010_gov}
\alias{aspep2011_gov}
\alias{aspep2012_gov}
\docType{data}
\title{aspep}
\description{

}
\usage{data(aspep2007_gov)}
\format{
 These tables contain data from the Annual Survey of Public employment and Payroll.
 The primary key of all those datasets is  "id" and "itemcode".
  \describe{
    \name{aspepXXXX_gov}
\item{ id }{Govenment integrated ID: 
The government unit code is the basic identification system used by the Census Bureau to keep track 
of all governments and their dependent agencies.  The code is a 14 digit, numeric identifier.  The 
format is: 
SS T CCC UUU SUP SB   
where:  
SS = state  
T = type of government    
CCC = county area within the state 
UUU = unit code within the county area 

SUP = supplemental unit code, for de
pendent agencies of the parent unit 

SB = subsidiary code for dependent agencies that require separate data collection / canvassing    
The following parameters and rules apply to the code structure: 

SS is a numeric sequence assigned to the states alphabetically – Alabama is 01, Alaska 02, and 
so forth, until Wyoming at 51.  Note the District of Columbia is assigned code 09 and the U.S. 
Federal Government is assigned code 00. 

T represents type of government, as defined by 
the Census Bureau. Government type codes are 
0 = state governments 
1 = county governments 
2 = municipal governments 
3 = township governments 
4 = special district governments 
5 = school district governments 
6 = Federal Government 

CCC, the county area codes, are assigned alphabetically within each state area, although there 
are some exceptions where county consolidations
 have taken place or new counties have been 
created.                                                                 

The unit code UUU identifies a specific government
 within the state, county, and type of 
government sequence.  They, too, are generally alphabetical within the county area and type of 
government combination, but exceptions exist (especially for special districts).  The unit code 

}
\item{ state }{ State }
\item{ pefcode }{in 2007 and 2012, when type is 1, 2 or 3, this is the total population in the area corresponding to the government identified with id. If type is 5, this is the number of students, if code is 4, this is the itemcode}
    \item{itemcode}{The table below gives the original coding of the item codes:
   Function (Item) Codes
000 = Totals for Government 
001 = Airports 
002 = Space Research & Technology (Federal) 
005 = Correction 
006 = National Defense and International Relations (Federal)  
012 = Elementary and Secondary - Instruction 
112 = Elementary and Secondary - Other Total 
014 = Postal Service (Federal) 
016 = Higher Education - Other 
018 = Higher Education - Instructional 
021 = Other Education (State) 
022 = Social Insurance Administration (State) 
023 = Financial Administration 
024 = Firefighters 
124 = Fire - Other 
025 = Judical & Legal 
029 = Other Government Administration 
032 = Health 
040 = Hospitals 
044 = Streets & Highways 
050 = Housing & Community Development (Local) 
052 = Local Libraries 
059 = Natural Resources 
061 = Parks & Recreation 
062 = Police Protection - Officers 
162 = Police-Other 
079 = Welfare 
080 = Sewerage 
081 = Solid Waste Management 
087 = Water Transport & Terminals 
089 = Other & Unallocable 
090 = Liquor Stores (State) 
091 = Water Supply 
092 = Electric Power 
093 = Gas Supply 
094 = Transit )
}
\item{ ftemp}{Number of full time  employees }
\item{ ftpay }{Full time pay }
\item{ ptemp }{Number of part time employees }
\item{ ptpay }{Pay of part time employees}
\item{ pthours }{Number of part time hours }
\item{ finalWeight }{ finalWeight }
\item{ inSample }{In 2007 table, selection indicator }
    \item{stratum}{Factor variable for substratum
    Levels: "C1": initial certainty (determined by the survey director or customer(Bureau of Economic Analysis for example), this substratum contains all units which the customer want to see on the report),
    "C2" : the second certainty substratum corresponding to all units selected with certainty, as determined by the proc surveyselect sas procedure with the "method=pps" option used by the Census Bureau.
    "CF": corresponds to all units that were added to the sample after the intial sample was drawn, on the demand of the customer.
    "LG": Stratum containing large units, in the sense of the cutoff sampling method (See Cochran 129)
    "SM": Stratum containing small units, in the sense of the cutoff sampling method (See Cochran 129)
    "FU": Cutoff sampling method was applied to type 3 and 4 only. units of type 1, 2 and 5 that are not in one of the previous substrata will be put in "FU" ("FU" for full, no cutoff)}
    \item{bigN}{bigN is the population size of a cell given by the state and type.}
    \item{littleN}{littleN is the sample size of a cell given by the state and type.}
    \item {type}{Type of government, as defined by the Census Bureau. Original government type codes are 
0 = state governments 
1 = county governments 
2 = municipal governments 
3 = township governments 
4 = special district governments 
5 = school district governments 
6 = Federal Government 
    }

}
}
\source{\url{https://www.census.gov/govs/apes/},

\url{http://www.census.gov/govs/apes/historical_data.html}

See also for documentation about id p25:  \url{http://www2.census.gov/govs/pubs/classification/2006_classification_manual.pdf}
}

\keyword{datasets}
  