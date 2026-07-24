# 📊 Sistema de análisis económico e inventario

Proyecto de análisis de datos desarrollado sobre la economía de un videojuego (World of Warcraft), utilizado para registrar, transformar y visualizar datos económicos y de inventario con el objetivo de apoyar la toma de decisiones.

Integra Excel, PostgreSQL, Python y Power BI mediante un pipeline ETL que permite:

- controlar inventarios
- analizar precios históricos
- monitorear población activa
- calcular existencias automáticamente
- evaluar rentabilidad de profesiones
- apoyar decisiones estratégicas mediante indicadores

## 🛠️ Tecnologías utilizadas
*   **Excel**: Limpieza y preparación de datos.
*   **PostgreSQL**: Consultas para extracción y análisis.
*   **Power BI**: Visualización de datos y reportes ejecutivos.

**Herramientas complementarias**

* Scripts de **Python** para automatización de tareas operativas (desarrollados en colaboración).

---
## 🏗️ Arquitectura del proyecto

El sistema fue diseñado para registrar, transformar y analizar información económica generada durante la actividad diaria de un grupo de jugadores de World of Warcraft. Centraliza datos de inventario, recolección de materiales, población activa y precios de mercado para generar indicadores que facilitan la toma de decisiones, como la gestión del inventario, la rentabilidad de las profesiones y la identificación de los momentos óptimos para comprar, vender o recolectar recursos. El sistema fue evolucionando a medida que aparecían nuevas necesidades operativas, incorporando procesos de automatización, limpieza de datos y visualización para reducir tareas manuales y mejorar la calidad de la información.

## ⚙️ Arquitectura técnica

* **Microsoft Excel:** Diseñado como punto de entrada del sistema para la carga de datos y el modelado inicial de la información. Se estructuraron 23 tablas relacionales separadas en diccionarios de control (D_) para datos estáticos y registros de movimientos (R_) para asegurar la escalabilidad. Se integró con scripts de Python desarrollados en colaboración para automatizar la exportación masiva a CSV y la extracción de datos de la casa de subastas, reduciendo significativamente el trabajo manual.
  
* **PostgreSQL:** Se utilizó como núcleo del sistema para almacenar, transformar y validar la información. La lógica de negocio se implementó mediante vistas (views) que realizan limpieza de registros, corrección de inconsistencias, aplicación de filtros (WHERE, NOT IN) y precálculo de métricas antes de su consumo desde Power BI.
  
* **Power BI:** Se desarrollaron tableros interactivos para el seguimiento del inventario, auditoría automática de existencias (Entradas − Salidas + Fabricados), análisis histórico de precios mediante filtros dinámicos y evaluación estadística del rendimiento de profesiones, incluyendo probabilidades de prospección y tamaño de muestra.
  
* **Pipeline ETL:** Flujo general de los datos
```text
Excel
│
├── Registro manual
├── Organización
└── Exportación
        │
        ▼
PostgreSQL
│
├── Views
├── Transformaciones
├── Limpieza
└── Integridad
        │
        ▼
Power BI
│
├── Dashboards
├── KPIs
└── Análisis
```

## 🛠️ Desafíos Técnicos y Resolución de Problemas

### 💎 Optimización del sistema de identificación de gemas

El juego cuenta con más de 150 combinaciones posibles de gemas. Asignar un identificador único a cada combinación aumentaba innecesariamente la complejidad del registro y dificultaba la carga de información.

Para resolver este problema diseñé un sistema de codificación basado en atributos. En lugar de identificar cada gema completa, cada atributo recibió un identificador único, reduciendo el modelo a solo 26 códigos base. Este enfoque simplificó el registro manual, redujo la cantidad de identificadores necesarios y facilitó la búsqueda y mantenimiento de la información.

Las gemas compuestas se representan combinando los identificadores de sus atributos. Por ejemplo, una gema con Poder de Ataque (7) e Índice de Celeridad (9) se registra como 7 y 9. Las gemas de un único atributo utilizan el identificador seguido de un 0, permitiendo distinguirlas de forma consistente (por ejemplo, 6 y 0 para Poder con Hechizos puro).
 
### 📊 Depuración del modelo de datos

Uno de los mayores desafíos del proyecto apareció cuando empecé a trabajar con Power BI. Al cargar los primeros datos noté que un objeto llamado "Muestra de joyero" tenía un valor completamente fuera de lugar. Al principio pensé que era un error aislado, pero cuanto más revisaba el inventario más claro quedaba que el problema afectaba a todos los cálculos derivados de ese registro.

Durante varios intentos busqué solucionarlo desde Power BI, pero no lograba una solución que realmente corrigiera el origen del problema. Eso me llevó a volver sobre la base de datos y aprender a utilizar views en PostgreSQL. En lugar de hacer las transformaciones dentro de Power BI, empecé a preparar los datos desde SQL, limpiando registros inconsistentes, aplicando filtros y dejando toda la información lista antes de visualizarla. Ese cambio terminó simplificando el modelo y eliminando los registros fantasma.

Otro caso interesante apareció con los Prismas Helados. Son objetos que se crean y consumen el mismo día, por lo que realmente nunca forman parte del inventario disponible. Sin embargo, seguían apareciendo en los reportes y ocupaban espacio con información que no aportaba valor. Después de probar distintas alternativas decidí excluirlos directamente desde las views mediante un WHERE, evitando que llegaran al modelo analítico.

El tercer problema apareció cuando hice la primera actualización grande de la base de datos. Al refrescar Power BI esperaba que simplemente incorporara las tablas nuevas, pero el modelo dejó de cargar por completo. Revisando las relaciones descubrí que una tabla estaba generando un conflicto con el resto del modelo. La solución fue aislarla temporalmente, permitir que el resto de las tablas cargaran correctamente y volver a incorporarla una vez que sus dependencias estuvieron resueltas.

### 🐍 Automatización del flujo de trabajo

Hubo un momento en el que el problema ya no era la base de datos ni Power BI, sino todo el trabajo manual que había alrededor. Cada actualización llevaba demasiado tiempo y, cuanto más crecía el proyecto, más evidente era que necesitaba automatizar varias tareas repetitivas.

#### ⚠️ Los problemas iniciales

El primer problema eran los backups. Siempre tuve bastante cuidado con la información del proyecto y hacía las copias de seguridad de PostgreSQL manualmente. Funcionaba, pero era un proceso repetitivo que dependía de acordarme de hacerlo cada vez.

La carga de datos tampoco ayudaba. La primera vez que migré la información desde Excel a PostgreSQL tuve que exportar cada tabla por separado a CSV antes de importarla. Era un trabajo muy mecánico y hacía que los datos permanecieran desactualizados durante bastante tiempo simplemente por todo el proceso que había que seguir.

El último cuello de botella era el mercado. Al principio registraba apenas seis objetos y tardaba cerca de treinta minutos en anotar manualmente los precios. Con el tiempo quedó claro que ese método no iba a escalar si quería analizar más información.

#### ⚙️ La solución

Para resolver estos problemas trabajé junto a un amigo, que desarrolló tres scripts de Python mientras yo continuaba con la base de datos y los dashboards del proyecto.

El primero automatizó la generación de backups de PostgreSQL. El segundo permitió exportar automáticamente todas las tablas de Excel a CSV, eliminando por completo una de las tareas más repetitivas del proyecto.

El tercero fue el que más impacto tuvo. Automatizó la extracción de los precios de la casa de subastas, permitiéndome pasar de registrar manualmente seis objetos en aproximadamente treinta minutos a analizar alrededor de treinta ítems, tres veces por día, con apenas un par de clics.

Como parte de esa colaboración desarrollé para él la misma base de datos destinada al análisis de precios históricos y un dashboard en Power BI. Aunque el script podía cargar los datos directamente en PostgreSQL, preferí que primero pasaran por un archivo de Excel para poder revisarlos antes de incorporarlos al sistema. Esa decisión priorizó el control de calidad de los datos, aunque el proyecto quedó preparado para automatizar completamente ese paso si fuera necesario en el futuro.

## 📌 Conclusiones

Este proyecto comenzó como una herramienta para organizar información y terminó convirtiéndose en un sistema de análisis de datos con un pipeline ETL, una base de datos relacional y dashboards interactivos.

Durante su desarrollo aprendí a modelar datos, diseñar bases de datos relacionales, implementar procesos de transformación en PostgreSQL, construir visualizaciones en Power BI y mejorar el flujo de trabajo mediante automatización y resolución de problemas reales.
