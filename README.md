# Cartia — Carta digital accesible

Cartia es una aplicación móvil desarrollada con **Flutter** cuyo objetivo es facilitar la consulta accesible de cartas digitales de restaurantes y permitir la gestión de pedidos de demostración.

El proyecto surge como alternativa a las cartas digitales tradicionales basadas en documentos PDF o imágenes, que pueden presentar dificultades de lectura, navegación e interacción para personas con distintas necesidades de accesibilidad.

Cartia busca ofrecer una experiencia sencilla, comprensible y adaptable, prestando especial atención a personas con baja visión, dificultades motoras o cognitivas y usuarios de tecnologías de asistencia.

## Funcionalidades

La aplicación permite:

- **Consultar la carta:** explorar los platos organizados en categorías de entrantes, platos principales, postres y bebidas.
- **Ver detalles de los platos:** consultar su nombre, descripción, precio, ingredientes y alérgenos declarados.
- **Buscar platos:** localizar productos mediante su nombre o palabras relacionadas.
- **Filtrar por alérgenos:** excluir determinados alérgenos de la consulta y visualizar los resultados según la información alimentaria disponible.
- **Gestionar un pedido:** añadir platos, consultar el contenido del carrito, modificar cantidades y eliminar productos.
- **Confirmar un pedido de demostración:** revisar el pedido y obtener un resumen con su referencia y el importe total.

**Importante:** La aplicación utiliza una carta ficticia y el sistema de pedidos tiene carácter demostrativo. No se realizan pagos ni se envían pedidos reales a ningún restaurante. La información alimentaria debe confirmarse siempre con el establecimiento.

## Accesibilidad

La accesibilidad es el objetivo principal del proyecto y se tiene en cuenta tanto en el diseño como en la implementación.

Entre las medidas desarrolladas y evaluadas se encuentran:

- Contraste adecuado entre textos, fondos y componentes interactivos.
- Etiquetas textuales para identificar acciones, estados y alérgenos sin depender exclusivamente del color.
- Diseño de controles táctiles con un área mínima objetivo de 48 × 48 píxeles lógicos, prestando especial atención a su separación y facilidad de interacción.
- Navegación sencilla mediante botones y acciones explícitas.
- Adaptación de los textos y componentes al aumento del tamaño de fuente.
- Uso de widgets estándar de Flutter y revisión de la información semántica para tecnologías de asistencia.
- Mensajes de ayuda, advertencia, error y confirmación comprensibles.
- Posibilidad de revisar y modificar el pedido antes de confirmarlo.

Durante el desarrollo se realizan comprobaciones de contraste, simulaciones de visión cromática, pruebas con texto aumentado y evaluaciones iniciales con TalkBack.

## Tecnologías utilizadas

- **Flutter:** desarrollo de la aplicación móvil.
- **Dart:** lenguaje de programación.
- **Material Design:** componentes de interfaz.
- **Android Studio:** ejecución y pruebas en emuladores Android.
- **Penpot:** diseño de wireframes y prototipos interactivos.
- **Git y GitHub:** control de versiones y colaboración.

La aplicación utiliza datos locales y no necesita un servidor para las funcionalidades de demostración.

## Instalación y ejecución

### Requisitos previos

Para ejecutar el proyecto es necesario disponer de:

- Flutter SDK y Dart compatibles con el proyecto.
- Android Studio o un editor compatible con Flutter.
- Un emulador Android configurado o un dispositivo físico.

### Pasos

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/natmarser/cartia.git
   ```

2. Acceder a la carpeta del proyecto:

   ```bash
   cd cartia
   ```

3. Instalar las dependencias:

   ```bash
   flutter pub get
   ```

4. Comprobar los dispositivos disponibles:

   ```bash
   flutter devices
   ```

5. Ejecutar la aplicación:

   ```bash
   flutter run
   ```

## Estructura del proyecto

```text
lib/
├── main.dart
├── data/
│   └── carta.dart
├── models/
│   ├── plato.dart
│   └── item_pedido.dart
├── providers/
│   └── pedido_controller.dart
├── screens/
│   ├── p1_inicio.dart
│   ├── p2_categoria.dart
│   ├── p3_detalle.dart
│   ├── p4_filtros.dart
│   ├── p5_resultados.dart
│   ├── p6_busqueda.dart
│   ├── p7_pedido.dart
│   └── p8_confirmacion.dart
├── theme/
│   └── app_theme.dart
└── widgets/
    └── cartia_widgets.dart
```

- **data:** información de la carta ficticia.
- **models:** modelos de platos y elementos del pedido.
- **providers:** lógica y estado de la gestión del pedido.
- **screens:** pantallas principales de la aplicación.
- **theme:** colores y estilos visuales.
- **widgets:** componentes reutilizables.

Las imágenes utilizadas por la aplicación se encuentran en `assets/images/`.

## Recorridos principales

El proyecto se organiza en tres recorridos críticos:

1. **Consultar un plato:** Inicio → Categoría → Detalle del plato.
2. **Filtrar por alérgenos:** Inicio → Filtros → Resultados → Detalle del plato.
3. **Realizar un pedido:** Inicio → Categoría → Detalle → Mi pedido → Confirmación.

Estos recorridos sirven como referencia para las pruebas de funcionalidad y accesibilidad.

## Contexto académico

Proyecto desarrollado para la asignatura **Accesibilidad**, correspondiente al curso académico **2026–2027**, del Grado en Ingeniería Informática.

**Grupo M**

- Sonia Díaz Macho
- Natalia Martínez del Ser
- Raúl Matilla García
- Alba Rodríguez González

El desarrollo se realiza de forma progresiva, abarcando el análisis de necesidades, la identificación de barreras de accesibilidad, el diseño de prototipos, la implementación en Flutter y la evaluación de la aplicación.