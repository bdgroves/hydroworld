library(rnoaa)
library(tidyverse)
library(lubridate)
library(measurements) # used to convert from mm to in
library(ggimage)
library(sp)

fipscodes <- fipscodes
shp <- tornadoes()
plot(shp)

key<-"SJhcDqlQgtGysdCGCqxFcTzXpLMKuqSG"

stations <- ncdc_stations(datasetid='GHCND', 
                          locationid='FIPS:53053',
                          token = key)
stations$data  

pierce_stations<-c("US1WAPR0002","US1WAPR0003","US1WAPR0006","US1WAPR0020",
                    "US1WAPR0027","US1WAPR0028","US1WAPR0031","US1WAPR0033",                         "US1WAPR0034","US1WAPR0042","US1WAPR0045","US1WAPR0054",
                    "US1WAPR0057")

pierce_snow<-meteo_pull_monitors(monitors=pierce_stations,var = "SNOW")

pierce_stations<-pierce_snow%>%
  dplyr::mutate(month = lubridate::month(date), snow = conv_unit(snow,"mm","inch"))%>%
  dplyr::filter(!snow == is.na(snow),month == 02)

ggplot(data = pierce_stations,aes(x=date,y=snow,color = id))+
  geom_line()

library(ggimage)

p<-ggplot(data = pierce_stations,aes(x=date,y=snow,color = id))+
  geom_line()

img_snow <- "c/data/snow.jpeg"
img<-"http://funny-photo.s3.amazonaws.com/preview/snow_effect/falling_snow_effect.jpeg"

ggbackground(p,img)