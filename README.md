# BackSafe Rosarito
API REST para la Gestión y Geolocalización de Reportes de Desaparición

## 📌 Descripción del Proyecto
BackSafe Rosarito es un proyecto backend desarrollado con Express.js que permite registrar, administrar y consultar reportes de desaparición de personas en el municipio de Playas de Rosarito, Baja California.  
El sistema centraliza la información, almacena ubicación geográfica y fotografías, y genera datos estadísticos por zona para su análisis posterior.

Este proyecto forma parte de una actividad académica para la materia relacionada con Arquitectura y Calidad de Proyectos de Software en CESUN Universidad.

---

## 🎯 Objetivo
Construir una base técnica sólida de backend que permita:
- Registrar reportes de desaparición con datos estructurados.
- Proteger rutas mediante autenticación JWT.
- Gestionar usuarios y roles.
- Almacenar evidencia fotográfica.
- Generar endpoints preparados para mapas y análisis por zona.
- Documentar la API con Swagger.

---

## 🧱 Arquitectura
El backend utiliza una arquitectura por capas basada en el enfoque **Controller–Service–Repository (CSR)**:

- **Controllers**: Manejan las peticiones HTTP y respuestas.
- **Services**: Contienen la lógica de negocio (preparado para escalabilidad).
- **Repositories**: Acceso a datos mediante Sequelize.
- **Models**: Definición de entidades y tablas.
- **Middlewares**: Seguridad, validaciones, JWT, uploads y rate limiting.
- **Routes**: Definición de endpoints REST.

---

## 📁 Estructura del Proyecto
