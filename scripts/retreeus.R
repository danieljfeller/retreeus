library(leaflet)
library(dplyr)

df <- read.csv("schools.csv", as.is=T, header=T)

treeIcon <- makeIcon(
  iconUrl = "tree_icon_2.png",
  iconWidth = 20, iconHeight = 20,
  iconAnchorX = 20, iconAnchorY = 20)
  
X = paste(sep = "<br/>",
          df$School,
          paste0('<strong># Trees: </strong>', df$Trees),
          paste0('<strong># Students: </strong>: ', df$Students))


X = paste(sep = "<br/>",
           df$School,
           paste0('<strong># Trees: </strong>', df$Trees),
           paste0('<strong># Students: </strong>: ', df$Students))

m <- leaflet(data = df) %>%
  setView(lat=44.9725, lng=-70.1230, zoom = 7) %>%
addProviderTiles(providers$Esri.WorldTopoMap) %>%
  addMarkers(~Longitude, ~Lattitude, icon = treeIcon,
             popup = ~df$School)
m  # Print the map

