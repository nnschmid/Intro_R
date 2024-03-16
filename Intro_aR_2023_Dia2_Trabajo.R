#### Paquete tidyverse #####

# Instalar y cargar tidyverse
install.packages("tidyverse") #Paquete de Paquetes
library(tidyverse)


#Buenas practicas de nombres de variables en R
Produccion de Soja <- 5.5 
ProduccionDeSoja <- 5.5 #El Camello
Produccion_de_Soja <- 5.5 #La Serpiente
#Produccion-de-Soja <- 5.5 # El Lomito Arabe

#NO usar espacios
#No utilizar simbolos latinos (acentos, ñ)

##### ANOVA ##### 
# Subir datos
DPS <- read.csv("Datos/DesempenoProductivo_Soja.csv")
#Los nombres de columnas tienen que seguir las buenas practicas 

#Explorar tabla
#nombre de columnas
#primeros datos de la tabla
#datos unicos

#Ver tabla
view(DPS)


# Realizar el ANOVA
modelo_anova <- aov()

# Resumen del ANOVA
summary()

# Parcelas agrupadas por variedad
boxplot(NGranos_m2 , data = DPS, xlab = , ylab = ,
        main = )

#Para arreglar
boxplot(NGranos_m2 , data = DPS, xlab = , ylab = ,
        main = ,
        las = , #para rotar
        cex.names = )

#Crear GGplot
ggplot(DPS, aes(y = NGranos_m2,
                x = Variedad)) +
  geom_boxplot() +
  #ylim(0,4000)
  
  
#### Introduccion a ggplot ####

# Base de R preferible para graficos simples, para revisar datos
# Base R es mas simple para graficos simples
# ggplot es mas simple para graficos complejos
# en ggplot los datos solamente pueden ser un dataframe
# Añadir elementos al grafico es diferente en ambos

#Prueba de R
set.seed(123)
hist(rnorm(50,2.8,0.8))

#Prueba GGPLOT
#Donde esta ggplot?
rendimiento <- as.data.frame(rnorm(50, 2.8, 0.8))
colnames(rendimiento) <- "Rendimiento" # Nombrar la columna

# Crear el histograma utilizando ggplot2
ggplot(rendimiento, aes(x = Rendimiento)) +
  geom_histogram(binwidth = 1)

#Ahora con los datos que tenemos

ggplot(DPS, aes(x = , 
                y = , 
                color =)) +
  geom_point() +
  
  
ggplot(DPS, aes(x = , 
                y = , 
                color =)) +
  geom_point() +
  xlim(0, 4000) +
  ggtitle("Rendimiento Kg/ha vs. Numero de Granos por m2")

#### Objetos Aesteticos
#ver https://rpubs.com/anlope10/562981

#Significa algo que puedes ver
    #x: Variable para el eje x.
    #y: Variable para el eje y.
    #alpha: Transparencia de los puntos o líneas.
    #color (o colour): Color de los puntos, líneas, barras, etc.
    #fill: Color de relleno de las áreas o barras.
    #shape: Forma de los puntos.
    #size: Tamaño de los puntos o líneas.
    #linetype: Tipo de línea (continua, discontinua, etc.).
    #group: Variable que define grupos para líneas o áreas.
    #weight: Peso de las observaciones en el gráfico.

##### Objetos Geometricos
 #Son las formas que puede tener un grafico 
        #geom_point - Puntos
        #geom_line - Líneas
        #geom_area - Áreas
        #geom_bar - Barras
        #geom_histogram - Histogramas
        #geom_density - Densidad
        #geom_boxplot - Diagrama de caja
        #geom_violin - Violín
        #geom_contour - Contorno
        #geom_hex - Hexágonos
        #geom_density2d - Densidad 2D (línea o punto)
        #geom_segment - Segmentos
        #geom_rect - Rectángulos

#Cada tipo de objeto geometrico acepta un tipo de aestitc
#Se pueden añadir mas geoms usando el simbolo +

#### Graficos de Dispersion ####

ggplot(DPS, aes( NGranos_m2,  Rendimiento_Kgha,
                Variedad)) +
  geom_point() +
  ggtitle("Rendimiento Kg/ha vs. Numero de Granos por m2") +
  xlim(0,4000) 

#Para calcular el 
# Calcular la media de Rendimiento y Nmero de granos
aggregated_data <- aggregate(, data = , FUN = )

#Agregar linea
ggplot(DPS, aes(x = , y = )) +
  geom_point() +
  geom_smooth(data = ,
              aes(x = , y = ),
              method = "lm", se = FALSE) +
  ggtitle("Rendimiento Kg/ha vs. Numero de Granos por m2") +
  xlim(0, 4000)
  

# Crear modelo linear
lm_fit <- lm( ~ , data = )

# Sacar coeficientes
intercept <- coef()[1] #intercepto
slope <- coef()[2] #slope = pendiente

# armar equacion
#Que hace la funcion paste?
equation <- paste("y =", round(, 2), "x +", round(, 2))

# Plot the scatter plot with a regression line fitted to aggregated data
a <- ggplot(DPS, aes(x = , y = )) +
  geom_point() +
  geom_smooth(data = ,
              aes(x = , y = ),
              method = "lm", se = FALSE) + 
  xlim(0, 4000) +
  ggtitle("Rendimiento Kg/ha vs. Numero de Granos por m2") +
  annotate("text", 
           x=1000, 
           y=6000, 
           label=, 
           color=, size=) 

#Que opciones hay para los colores?
a
#### Agregar etiquetas en los puntos por Epoca

a +
  geom_text(aes(label=, col= ), size = 3,
            nudge_x = 100,
            nudge_y = 100)

#Que pasa con la variable a?

#Usar geom repel
install.packages("ggrepel")
library(ggrepel)

a + 
  geom_point() + 
  geom_text_repel(aes(label=, col= ), size = 3)

### Arreglar 

#HAcer epoca una variable categorica
DPS$Epoca <- factor(DPS$Epoca)

#Crear grafico GGPLOT
ggplot(DPS, aes(x = , y = , 
                     colour=  )) +
  geom_point() +
  geom_smooth(data = aggregated_data, aes(x = , y = ),
              method = "lm", se = FALSE, linetype = "solid") 
  xlim(0, 4000) 
  ggtitle("Rendimiento Kg/ha vs. Numero de Granos por m2") +
  annotate("text", 
           x=1000, 
           y=6000, 
           label=, 
           color="blue", size=5) 

a
#### Epoca como variable ####

#Convertir epoca a variable categorica
DPS$Epoca <- factor(DPS$Epoca)
#Que hace la funcion factor?

# Calculate the mean of Rendimiento_Kgha for each value of NGranos_m2
aggregated_data <- aggregate( ~ , data = , FUN = )

# Fit linear regression to aggregated data
lm_fit <- lm( ~ , data = )

# Get coefficients of the regression line
intercept <- coef()[1]
slope <- coef()[2]

# Equation of the regression line
equation <- paste("y =", round(, 2), "x +", round(, 2))

# Plot the scatter plot with a regression line fitted to aggregated data
ggplot(DPS, aes(x = , y = , colour = )) +
  geom_point() +
  xlim(0, 4000) +
  geom_smooth() 

#Crear equaciones para cada epoca
# Ajuste del modelo para la época 1
modelo_epoca1 <- lm()

# Ajuste del modelo para la época 2
modelo_epoca2 <- lm()

# Extracción de las ecuaciones de regresión
ecuacion_epoca1 <- paste("y = ", round(coef()[1], 2), " + ", 
                         round(coef()[2], 2), "x")

ecuacion_epoca2 <- paste("y = ", round(coef()[1], 2), " + ", 
                         round(coef()[2], 2), "x")

#Agregar a grafico
ggplot() +
  geom_point() +
  xlim()) +
  geom_smooth()  +
  annotate()) +
  annotate() +
  ggtitle()

#### Mapeo de mas variables
ggplot(DPS, aes()) +
  geom_point(aes() +
  xlim() 

#convertir a factor
DPS$Repeticion <- factor()

ggplot(DPS, aes()) +
  geom_point() +
  xlim() +
  ggtitle()


#### Otros graficos utlies #### 

#Violin
ggplot(DPS, aes(x = NGranos_m2, y = Variedad)) +
  geom_violin(aes(color = Variedad)) +
  xlim(0, 4000) 
colnames(DPS)

#Hexagon
ggplot(DPS, aes(x = NGranos_m2, y = Peso1000semillas_g)) +
  geom_hex() +
  xlim(0, 4000) +
  ggtitle("Distribución de la densidad de puntos")


##### Introduccion a manipulacion de Datos ####

# Crear un data frame de ejemplo
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Nombre = c("Juan", "María", "Carlos", "Ana", "Pedro"),
  Edad = c(25, 30, 22, 28, 35)
)


# Filtrar personas mayores de 25 años y seleccionar solo las columnas de ID y Nombre
resultado <- data
filter(Edad > 25)
select(ID, Nombre)

# Imprimir el resultado
print()

#### Leer y escribir datos

## La separación decimal en R es . y no ,
#Datos en Millones de Guaranies
Ingreso <- read.csv("Datos/IngresoPromPoblacion_py.csv")


##Revisar Datos
 #Primeros datos
#Ultimos Datos
 #Tamaño 
#Nombre de Columnas
 #Sumario de Datos 

#Departamento con mayor ingreso promedio?

#Cambiar a datos largos
dato_largo <- Ingreso
  gather(key = "year", value = "Cantidad", -Departamento)
  mutate(year = as.integer(year))

#Limpiar Datos
dato_largo$Departamento <- str_trim()  # Recortar espacios en blanco
dato_largo$Departamento <- str_replace()  # Reemplazar ciertos valores
any(is.na())  # Verificar valores faltantes (NAs)
dato_largo[is.na()] <- 0  # Reemplazar NAs con 0s

# Agrupar los datos por departamento y encontrar el departamento con el mayor ingreso promedio
Mayor_Departamento <- dato_largo
  group_by()
  summarize() %>%
  slice() %>%
  ungroup()

#Seleccionar Solo datos de Itapua
dato_largo_itapua <- dato_largo[]
Ingreso_Promedio_itapua <-  

#Seleccionar Solo datos de Itapua
dato_largo_Boqueron <- 
Ingreso_Promedio_Boqueron <- 

#Departamentos con ingresos mayor a 2.5 luego del 2000
resultados <- dato_largo
  filter()
  select()

#Graficar Resultados
#Crear un grafico de GGLPLOT con alguna variable del dato

