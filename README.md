# Data: Annual Survey of Public Employment & Payroll

`dataASPEP` is an R package that contains data from the Annual Survey of Public Employment & Payroll.
The data was pulled from the [Census website](http://www.census.gov/govs/apes/).



## Installation
To install  the package, execute:

```r
devtools::install_github("dataASPEP")
dataASPEP::get_data_from_web()
```



##Documentation
To see the documentation, execute:

```r
?aspep2007
?aspep2007_gov
```

##How was the data pulled ?
To pull the data yourself, execute:

```r
demo(get_data_from_web,package = "dataASPEP")
```

##How to use the data ?
To see an example of data use, execute:


```r
demo(map,package = "dataASPEP")
```
