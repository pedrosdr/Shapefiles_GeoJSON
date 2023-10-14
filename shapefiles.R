setwd('C:/Users/Lenovo/Documents/projects/shape_files')
library(leaflet)
library(sf)

# br_muns = sf::st_read('BR_Municipios_2022/BR_Municipios_2022.shp')
# br_muns = st_transform(br_muns, crs = st_crs("+proj=longlat +datum=WGS84"))
# st_write(br_muns, dsn = 'br_muns.json', driver = "GeoJSON")

br_muns = sf::st_read('br_muns.json', driv)
ms_muns = br_muns[which(br_muns$SIGLA_UF == 'MS'),]

map = leaflet(ms_muns) %>%
  # addTiles() %>% 
  # addProviderTiles(providers$CartoDB.VoyagerNoLabels) %>%
  addPolygons(
    label = 1:nrow(ms_muns),
    weight = 1,
    labelOptions = labelOptions(noHide = TRUE, textOnly = TRUE)
  )

map

# for(i in 1:length(unique(br_muns$SIGLA_UF))) {
#   ufs = unique(br_muns$SIGLA_UF)
#   muns = br_muns[which(br_muns$SIGLA_UF == ufs[i]),]
#   uf = tolower(ufs[i])
#   filename = paste0('GeoJSON_municipios/', uf, '_muns.json')
#   sf::st_write(muns, filename, driver = 'GeoJSON')
#   print(i)
# }

am_muns = sf::st_read('geojson_municipios/am_muns.json')

map = leaflet(am_muns) %>%
  # addTiles() %>% 
  # addProviderTiles(providers$CartoDB.VoyagerNoLabels) %>%
  addPolygons(
    label = 1:nrow(am_muns),
    weight = 1,
    labelOptions = labelOptions(noHide = TRUE, textOnly = TRUE)
  )

map
