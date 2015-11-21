Developing Data Products: Shiny App Pitch
========================================================
author: schweitzerb
date: 11/21/2015

Introduction
========================================================

The shiny app I developed allows novice users who are not familar with programming to interactively explore the **mtcars** data set.

Future iterations of the app can expand this functionality to other datasets and help teach the power of exploratory data analysis.


App Features
========================================================

The app uses a ggplot scatterplot to allow the user to interactively explore the data set.
The options included in the app to explore the data are:
- Freely choose the x and y variables
- Plot z-scores instead of raw data for numeric data
- Group data by any of the categorical variables in the data set
- Add a regression line (or multiple lines if a group has been selected)

Additionally, on hover functionality allows the user to see the detailed data for each point in the plot, as well as the model of the car that the data was collected from.

Example Plot
========================================================

The plot below is an example of a plot that can be created with the app. Illustrated here are the cars' miles per gallon (**mpg**) and horse power (**hp**). The color indicates the number of gears (**gear**) for each data point.

![plot of chunk unnamed-chunk-1](shinyAppPitch-figure/unnamed-chunk-1-1.png) 



Thank You
========================================================

Thank you for supporting the **1974 Motor Trend Road Tests Data Explorer** shiny app.
