# 📊 Proyecto de análisis de datos aplicado a la economía de World of Warcraft.

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

### 💎 El problema de las gemas

Hay más de 150 combinaciones de gemas posibles, pero yo no iba a ponerme a anotar cada una con un ID único que después me costara buscar. Así que armé una tabla de atributos reduciéndola a 26 ID únicos, ordenados desde las estadísticas más usadas hasta las menos frecuentes.

¿Cómo funciona? Supongamos una gema que tiene poder de ataque e índice de celeridad: busco rápido y veo el 7 (poder de ataque) y el 9 (celeridad), y listo, la anoto sin dar vueltas. Si es una gema pura, por ejemplo solo poder de hechizo, le pongo 6 que sería su ID más un 0 que indica que no lleva segundo atributo, marcando así su pureza.
 
### 📊 Mi lucha con Power BI

Esto me causó demasiados problemas que me trabaron durante días. Lo primero que me pasó fue un problema de objetos fantasmas: al cargar los datos vi que uno de ellos, "muestra de joyero", tenía un número muy inusual que no tenía sentido que estuviera ahí. Al verlo intenté arreglarlo porque si ese fallaba, todos los demás también estarían mal. Después de días lidiando con esto, volví a SQL y aprendí a usar una herramienta que hasta entonces no sabía, que eran las views. Ahí hago todo el cálculo en SQL para pasarlo masticado a Power BI, solucionándome el problema de los registros fantasmas.

Luego tuve problemas para filtrar resultados específicos y evitar que ensuciaran el inventario, como los prismas helados, que se crean y se consumen el mismo día. Para no llenar espacios innecesarios deseaba eliminarlos, así que, al no encontrar otra solución, los filtré con un WHERE desde la propia view para que no le llegara ese ID específico.

Por último, cuando cargué la primera gran actualización de SQL y fui a refrescar Power BI para que tuviera los datos nuevos, colapsó en su totalidad. Analizando los errores durante un buen rato descubrí que una tabla en específico creaba todos los problemas con su relación. ¿La solución? Aislarla temporalmente; se logró cargar todo y volvió una vez que sus tablas hermanas estuvieron sanas.

### 🐍 Automatización con Python

Para mí esto fue un antes y después. Tenía varios problemas que me costaban horrores: desde cargar los datos de la subasta hasta pasarlos a SQL con CSV, o hacer los backups.

#### ⚠️ Los problemas iniciales

Empecemos por lo primero: soy un desconfiado y me aterra perder todo mi esfuerzo, así que hacía los backups de mi SQL a mano. Además, la primera vez que cargué los datos me agoté mentalmente porque tenía que extraer cada tabla del Excel por separado y pasarla a CSV para poder subirla a SQL, haciendo que los datos quedaran desactualizados un buen tiempo solo por el trabajo operativo que había detrás. Y por último, el valor de mercado: antes registraba 6 objetos y estaba 30 minutos frente a la pantalla con el Excel en mano anotando todo.

#### ⚙️ La implementación de scripts

Así que fui a pedirle ayuda a un amigo sobre todo esto y me programó 3 scripts de Python. El de backups y el de CSV son de esos que hacés doble clic y te lo hacen al instante, pero el de la subasta fue una revolución industrial: era incluso ampliable, y llegué a analizar 30 ítems tres veces al día con simplemente dos clics.

Como intercambio, le armé la misma base de datos para la evolución del precio de mercado y le preparé un Power BI. Yo le había pedido que mis registros de subasta pasaran a un Excel separado porque me gusta revisar y analizar que esté todo en orden, aunque él me ofreció subirlos directamente a SQL. Decliné su oferta por preferencia personal, pero sé que esa opción está ahí por si en el futuro necesito manejar registros masivos.
