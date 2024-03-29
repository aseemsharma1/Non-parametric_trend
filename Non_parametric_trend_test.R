#This simple function perform Mann-Kendall trend test and calculates Theil-Sen coefficient for time series data
library(tidyverse)
library(Kendall)
library(zyp)

fun_MK_trn_pval<-function(xx,stn){ ## xx= time series data, stn = location
    mkval<-round(MannKendall(xx)$sl[1],digits=2)
    slp<-round(zyp.trend.vector(xx, x=1:length(xx))[[2]],digits=2)
    trn_df<-data.frame(MKRes=c("trend"=slp,"pavl"=mkval,"stn"=stn))
    write_csv(trn_df,paste0("MK_trn_pval",stn,".csv"))
    return(trn_df)
}

#Example
dt<-as_tibble(data.frame(pr=(c(31.69, 29.77, 31.7, 33.06, 31.31, 32.72, 31.18, 29.9,
    29.17, 31.48, 28.11, 32.61, 31.31, 30.96, 28.4, 30.68, 33.67,
    28.65, 30.62, 30.21, 28.79, 30.92, 30.92, 28.13, 30.51, 27.63,
    34.8, 32.1, 33.86, 32.33, 25.69, 30.6, 32.85, 30.31, 27.71, 30.34,
    29.14, 33.41, 33.51, 29.9, 32.69, 32.34, 35.01, 33.05, 31.15,
    36.36, 29.83, 33.7, 29.81, 32.41, 35.9, 37.45, 30.39, 31.15,
    35.75, 31.14, 30.06, 32.4, 28.44, 36.38, 31.73, 31.27, 28.51,
    26.01, 31.27, 35.57, 30.85, 33.35, 35.82, 31.78, 34.25, 31.43,
    35.97, 33.87, 28.94, 34.62, 31.06, 38.84, 32.25, 35.86, 32.93,
    32.69, 34.39, 33.97, 32.15, 40.16, 36.32))))

dt
dt$yr<-1900:1986
dt

fun_MK_trn_pval(dt$pr,"test")
