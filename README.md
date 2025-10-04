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
* [x] Incluir al menos un **CHECK** y 5 **índices adicionales**.
* [x] Insertar **30 registros por tabla** (mínimo).
* [x] Crear al menos **10 consultas SQL** (con joins, agregaciones, subconsultas, etc.).
* [x] Definir **1 vista** útil para el escenario.

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

# ✅ TODO - Trabajo Práctico 2 de Base de Datos

Checklist en formato GitHub para marcar avances del proyecto.

---

## 👥 Organización

* [ ] Definir integrantes (máx. 5)
* [ ] Asignar roles (modelado, SQL, documentación)

---

## 📝 Diseño conceptual

* [ ] Elegir escenario asignado
* [ ] Identificar entidades y relaciones
* [ ] Resolver entidades débiles y atributos multivaluados
* [ ] Construir DER (`docs/diagrama_ER.png`)
* [ ] Validar con docente

---

## 🗂️ Diseño lógico

* [ ] Transformar DER en Modelo Relacional
* [ ] Normalizar hasta FN adecuada
* [ ] Documentar decisiones (`docs/modelo_relacional.pdf`)

---

## 🛠️ Implementación

* [ ] Crear BD en MySQL
* [ ] Definir tablas (`sql/creacion_tablas.sql`)
* [ ] Incluir al menos un `CHECK`
* [ ] Agregar 5 índices adicionales

---

## 📥 Carga de datos

* [ ] Preparar datos de prueba coherentes
* [ ] Insertar ≥30 registros por tabla (`sql/carga_datos.sql`)
* [ ] Justificar excepciones

---

## 🔎 Consultas y vistas

* [ ] Definir 10 consultas (`sql/consultas.sql`):

  * [ ] JOINs
  * [ ] Agregaciones
  * [ ] Subconsultas
  * [ ] Condiciones lógicas
* [ ] Crear al menos 1 vista
* [ ] Documentar su utilidad

---

## 📂 Documentación y entrega

* [ ] Redactar supuestos y consideraciones (`docs/consideraciones.pdf`)
* [ ] Preparar exposición (≤12 min)
* [ ] Subir todo a Aula Virtual

---

## 📅 Deadline

* **Entrega final y exposición:** `11/10/2025`

¿Quieres que en el **TODO.md** agregue también etiquetas estilo *GitHub Projects* (ej. `@backlog`, `@in-progress`, `@done`) para facilitar el tracking dentro del repositorio?
