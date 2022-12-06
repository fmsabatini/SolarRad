#R function 'SolarRad' for the calculation of potential annual direct incident
## radiation and heat load as described in
## McCune B, Keon D: Equations for potential annual direct incident radiation
## and heat load. J Veg Sci 2002, 13(4):603-606.
## written by: Francesco Maria Sabatini. Alma Mater Studiorum, University of Bologna


#This program is free software: you can redistribute it and/or modify it under
#terms of the GNU General Public License http://www.gnu.org/licenses/

#Disclaimer: users of this code are cautioned that, while due care has been
#taken and it is believed accurate, it has not been rigorously tested and its
#use and results are solely the responsibilities of the user.

### Usage: SolarRad(Slope, Aspect, Latitude, Exp)


#Arguments
## Slope and Aspect must be in degrees. Aspect can be NA only if slope=0�
## latitude must be in the form (degrees.decimal) and not in the form (degrees�  minutes' seconds" )
## Exp must be TRUE/FALSE. When FALSE (default), SolarRad returns the logarithm
## of Pontential Solar Radiation
## Solar Radiation is return in MJ cm�2 yr�1


SolarRad <- function(Slope, Aspect, Latitude, Exp=FALSE){
      if(Slope==0) Aspect=999
      folded_aspect <- 180-abs(Aspect-180)
      rlatitude <- Latitude*pi/180                #transform to radians
      rslope    <- Slope*pi/180
      rfolded_aspect <- folded_aspect*pi/180
      SolarRad <- -1.467+1.582*cos(rlatitude)*cos(rslope) - 1.5*cos(rfolded_aspect)*sin(rslope)*sin(rlatitude) -
                  0.262*sin(rlatitude)*sin(rslope) + 0.607*sin(rfolded_aspect)*sin(rslope)
      if(Exp==T) SolarRad <- exp(SolarRad)

      folded_aspectNW_SE <- abs(180-abs(Aspect-225))  #transform to radians centered on the SW/NE
      rfolded_aspectNW_SW <- folded_aspectNW_SE*pi/180
      HeatLoad <- -1.467+1.582*cos(rlatitude)*cos(rslope) - 1.5*cos(folded_aspectNW_SE)*sin(rslope)*sin(rlatitude) -
                  0.262*sin(rlatitude)*sin(rslope) + 0.607*sin(folded_aspectNW_SE)*sin(rslope)
      if(Exp==T) HeatLoad <- exp(HeatLoad)
      return(data.frame(SolarRad, HeatLoad))
      }
      
### Test applications:
#SolarRad(Slope=30, Aspect=0, Latitude=40, Exp=F)
#SolarRad(Slope=30, Aspect=225, Latitude=40, Exp=F)
#SolarRad(Slope=30, Aspect=180, Latitude=40, Exp=F)
#SolarRad(Slope=0, Aspect=0, Latitude=40, Exp=F)
