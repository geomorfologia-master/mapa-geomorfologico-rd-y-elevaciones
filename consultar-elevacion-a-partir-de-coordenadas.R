############################# CAMINO 1 ##############################
################## Consultar elevación de un punto ##################

# Paquetes
library(elevatr)

# Definir CRS fuente
crs <- 26719 #NAD27

# Coordenadas
x <- 290946; y <- 2088549 # PON AQUÍ TUS COORDENADAS

# Crear data.frame
df <- data.frame(x = x, y = x)

# Obtener elevación de AWS
df_elevacion_aws <- get_elev_point(df, prj = crs, src = "aws", z=12)

# La columna elevation de d_sf_elevacion_aws contendrá la elevación en según el SRTM
print(df_elevacion_aws)

############################# CAMINO 2 ##############################
#### Consultar elevación de varios puntos a partir de un archivo ####

# Paquetes
library(elevatr)
library(sf)

# Definir CRS fuente
crs1 <- 26719 #NAD27
crs2 <- 26919 #NAD83
crs3 <- 32619 #WGS84

# Coordenadas de ejemplo.
# Sube tu archivo con el mismo nombre y formato (CSV) que el del ejemplo.
# Debe tener al menos las columnas nombradas 'X' e 'Y' para coordenadas UTM.
# Genera tu CSV a partir del archivo EXCEL (.xlsx) o el archivo LibreOffice Calc (.ods).
# Localiza tu CSV en un lugar donde el script lo encuente, en este caso está en "datos/".
# Es probable que necesites definir el directorio de trabajo son setwd()
d <- read.csv('datos/coordenadas-ejemplo.csv')

# Dos puntos de ejemplo, pero tu archivo puede tener más
d_sf <- st_as_sf(
  d,
  coords = c('X', 'Y'),
  crs = crs1 #<---Aquí tienes que definir cuál CRS
)
d_sf_elevacion_aws <- get_elev_point(
  locations = d_sf,
  prj = crs1, #<---Aquí tienes que definir cuál CRS
  src = "aws",
  z = 12
)
# La columna elevation de d_sf_elevacion_aws contendrá la elevación en según el SRTM
d_sf_elevacion_aws
