# Paquetes
library(elevatr)
library(sf)

# Definir CRS NAD27
crs1 <- 26719
crs2 <- 26919

# Coordenadas
d <- read.csv('coordenadas-yerlin-lenin.csv')

# Yerlyn
d_yerlyn <- d[d$Nombre=='Yerlyn', ]
d_yerlyn_sf <- st_as_sf(d_yerlyn, coords = c('X', 'Y'), crs = crs1)
d_yerlyn_sf_elev <- get_elev_point(d_yerlyn_sf, prj = crs1, src = "aws", z = 12)

# Lenin
d_lenin <- d[d$Nombre=='Lenin', ]
d_lenin_sf <- st_as_sf(d_lenin, coords = c('X', 'Y'), crs = crs2)
d_lenin_sf_elev <- get_elev_point(d_lenin_sf, prj = crs2, src = "aws", z = 12)




