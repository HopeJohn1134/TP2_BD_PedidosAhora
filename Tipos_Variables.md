# Tipos de datos de texto en MySQL

| Tipo de dato | Longitud máxima (bytes) | Longitud aprox. (caracteres, UTF-8 español) | Uso típico |
|---------------|------------------------|---------------------------------------------|-------------|
| **CHAR(n)** | 0 – 255 | 0 – 255 | Textos de longitud fija (códigos, abreviaturas, identificadores cortos). |
| **VARCHAR(n)** | Hasta 65,535* | Hasta ~16,383** | Textos de longitud variable (nombres, correos, direcciones). |
| **TINYTEXT** | 255 | ~255 | Textos muy cortos o breves descripciones. |
| **TEXT** | 65,535 (≈ 64 KB) | ~16,383 | Campos de texto medianos (comentarios, mensajes, contenido corto). |
| **MEDIUMTEXT** | 16,777,215 (≈ 16 MB) | ~4,194,303 | Textos largos (documentos, artículos extensos, contenido HTML). |
| **LONGTEXT** | 4,294,967,295 (≈ 4 GB) | ~1,073,741,823 | Textos extremadamente largos (archivos grandes, contenido multimedia codificado). |

\* El límite real de `VARCHAR` depende del conjunto de caracteres y del tamaño máximo de fila (65,535 bytes en total por fila).

\** En español (UTF-8), los caracteres suelen ocupar 1 byte (ASCII básico) o hasta 2 bytes (acentos, ñ, etc.), por lo tanto, el cálculo es aproximado.

---
**Notas:**
- Todos los tipos `TEXT` almacenan los datos fuera de la tabla principal, con un puntero al valor.  
- Para búsquedas de texto completo (`FULLTEXT`), se recomiendan `CHAR`, `VARCHAR` o `TEXT`.  
- Si se necesita orden o comparación eficiente, `VARCHAR` suele ser mejor opción que `TEXT`.

