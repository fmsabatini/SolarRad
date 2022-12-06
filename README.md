# SolarRad
Function to calculate the topographic solar radiation of a site as Mj* Cm^-2 * yr^-1

R function 'SolarRad' for the calculation of potential annual direct incident radiation and heat load as described in 
[McCune B, Keon D: Equations for potential annual direct incident radiation and heat load. J Veg Sci 2002, 13(4):603-606.](https://onlinelibrary.wiley.com/doi/10.1111/j.1654-1103.2002.tb02087.x)

 written by: Francesco Maria Sabatini. Alma Mater Studiorum, University of Bologna


This program is free software: you can redistribute it and/or modify it under terms of the GNU General Public License http://www.gnu.org/licenses/

Usage: SolarRad(Slope, Aspect, Latitude, Exp)  
Arguments  
Slope and Aspect must be in degrees. Aspect can be NA only if slope=0  
latitude must be in the form (degrees.decimal) and not in the form (degrees  minutes' seconds" )  
Exp must be TRUE/FALSE. When FALSE (default), SolarRad returns the logarithm of Pontential Solar Radiation  
