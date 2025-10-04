# 📦 Trabajo Práctico 2 – Diseño de Base de Datos (2025)

Repositorio correspondiente al **Trabajo Práctico 2** de la materia **Base de Datos**, cuyo objetivo es diseñar e implementar una base de datos relacional en **MySQL**, a partir de un escenario asignado.

---

## 🚀 Objetivos

* Modelar un sistema a nivel conceptual (DER) y lógico (Modelo Relacional).
* Implementar la base de datos físicamente en **MySQL**.
* Definir consultas SQL avanzadas con agregación, subconsultas y joins.
* Justificar decisiones de diseño y normalización.

---

## 📚 Escenarios disponibles

1. **Plataforma Logística**
2. **Empresa de Movilidad Urbana**

El escenario específico será definido en clase.

---

## 🛠️ Requisitos técnicos

* **MySQL** 8.0 o superior
* Cliente SQL compatible (Workbench, CLI, DBeaver, etc.)
* Git para control de versiones

---

## ⚙️ Estructura del repositorio

```
/TP2_BD
├── README.md                 # Este documento
├── TODO.md                   # Checklist de tareas
├── docs/
│   ├── diagrama_ER.png       # Diagrama Entidad-Relación
│   ├── modelo_relacional.pdf # Modelo Relacional
│   └── consideraciones.pdf   # Supuestos y decisiones
├── sql/
│   ├── creacion_tablas.sql   # Script de creación de tablas
│   ├── carga_datos.sql       # Script de carga inicial
│   └── consultas.sql         # Consultas definidas
```

---

## 📝 Consignas principales

* [x] Construir el **DER** con notación clara.
* [x] Transformarlo en un **Modelo Relacional** normalizado.
* [x] Implementar la BD en **MySQL**.
* [ ] Incluir al menos un **CHECK** y 5 **índices adicionales**.
* [ ] Insertar **30 registros por tabla** (mínimo).
* [ ] Crear al menos **10 consultas SQL** (con joins, agregaciones, subconsultas, etc.).
* [ ] Definir **1 vista** útil para el escenario.

---

## ▶️ Ejecución

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/usuario/TP2_BD.git
   cd TP2_BD/sql
   ```
2. Crear la base de datos en MySQL:

   ```sql
   SOURCE creacion_tablas.sql;
   ```
3. Cargar datos:

   ```sql
   SOURCE carga_datos.sql;
   ```
4. Probar consultas:

   ```sql
   SOURCE consultas.sql;
   ```

---

## 📅 Entrega

* **Exposición grupal**: máx. 12 minutos
* **Fecha límite:** sábado **11/10/2025**
* Modalidad: entrega en **Aula Virtual**

---

## 👥 Autores

Completar con nombres y legajos de los integrantes.

