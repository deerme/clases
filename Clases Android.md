# Introducción a Java
## Características de Java
Java está basado en C, orientado a objetos, no existen punteros, macros, registros ni definición de tipos. Es un lenguaje interpretado. Casi todo en Java van a ser objetos. Cumple con las características de:

- Encapsulamiento: la información es ocultada
- Polimorfismo: un objeto es considerado de la clase a la que pertence y de la que desciende
- Herencia: se definen nuevas clases a partir de una
- Enlace dinámico: los objetos pueden venir de cualquier sitio

Sin embargo, no tiene herencia múltiple ni sobrecarga de operadores (que muchos lenguajes orientados a objetos tienen)

### Tipos de datos

nombre  | bitsize | tipo     | rango
--------|---------|----------|---------
byte    | 8 bits  | entero   | -128 a 127
short   | 16 bits | entero   | -32.768 a 32.767
int     | 32 bits | entero   | -2,147'483,648 a 2,147'483,647
long    | 64 bits | entero   | -9'223,372 *10^12 a 9'223.372 * 10^12
float   | 32 bits | real     | -3.4 * 10^38 a 3.4 * 10^38
char    | 16 bits | caracter | Unicode 0 a Unicode 2^16 -1
boolean |         | boolean  | true o false

Primero uno crea el código fuente (.java) y luego se compila para crear bytecodes (.class). Estos se distribuyen y se ejecutan con un intérprete o máquina virtual (.jar). No obstante, también se pueden compilar los bytecodes (.exe).

El código es confidencial ya que se distribuyen los .class pero es muy difícil que se descubra el código fuente y se revelen los algoritmos.
Como se ejecuta dentro de una máquina virtual, las operaciones están sandboxed. Se realiza un chequeo del código tanto en el tiempo de compilación como en el de ejecución.

## Creación de clases en Java

**Objeto**: entidad que dispone de propiedades (atributos) y comportamientos (métodos). <br>
**Clase**: define un tipo de objeto concreto.

Una clase en Java está compuesta por:

- **Atributos** (aka campos/propiedades): almacenan algún tipo de información del objeto y definen su estado.
- **Constructores**: inicializan un objeto (pueden haber varios constructores).
- **Métodos**: modifican o consultan el estado de un objeto (equivalentes a funciones o procedimientos en otros lenguajes).

En Java, además de objetos, podemos usar variables simples y arrays (que no pueden ser consideradas objetos).

Para crear una clase, se tiene que usar un fichero que **se debe llamar igual que la clase** y con extensión .java (siempre un fichero por clase). Java solo nos va a permitir almacenar **una clase en cada fichero**.

`package org.upv.cursoandroid.unidad0;`

Luego definimos los paquetes que queremos usar:

`import android.app.Activity;` <br>
`import android.content.BroadcastReceiver;` <br>
`import ...`

Para **declarar una clase** se sigue el siguiente esquema:

```
class <Clase> {
    // declaración de atributos
    [visibilidad] [modificadores] <tipo> <atributo> [= valor];
    ...
    
    // declaración de constructor
    public <Clase> (<argumentos>) {
        <instrucciones>;
    }
    
    // declaración de métodos
    [visibilidad] [modificadores] <tipo> <método> (<argumentos>) {
        <instrucciones>;
    }

    ...
}
```

- `[visibilidad]` puede ser `public`, `protected` o `private`. Cuando es pública, puede ser accedida y tener visibilidad fuera de la clase. Cuando es privada, se impide que desde fuera de la clase se pueda acceder a los valores.
- `[modificadores]` puede ser `final`, `static` y `abstract`.

El `<tipo>` en la declaración de métodos sirve para determinar qué va a devolver. *Por convención, los métodos comienzan con minúscula.*

Una clase comienza por la palabra reservada **class** seguida de su nombre. 

*Por conveción se empieza con mayúsucula y cuando hay varias palabras se usan mayúsculas para las iniciales (no se usan espacios ni subrayas).*

Por ejemplo, crearemos una clase que nos va a permitir **almacenar objetos** del tipo número complejo:

```
class Complejo {

    // declaración de atributos
    private double real, imaginario;
    
    // declaración de constructor
    public Complejo (double real, double imaginario) {
        this.real = real;
        this.imaginario = imaginario;
    }
    
    // declaración de métodos
    
    /** Transcribir número complejo a string
     * @return string con la parte entera e imaginaria
     */
     
    public String toString() {
        return real + "+" + imaginario + "i";
    }
    
    /** Suma al complejo de este objeto con otro complejo
     * @param v: el otro número complejo que sumamos
     */
     
    public void suma(Complejo v) {
        real = real + v.real;
        imaginario = imaginario + v.imaginario;
    }
}
```

Los atributos se declaran de manera privada para que se impida que fuera de la clase se puedan acceder a estos dos valores.

Una clase necesita almacenar información que define al objeto en cuestión. Esto se hace en los **atributos**. En este ejemplo almacenamos la parte real e imaginaria del número.

Luego se suele declarar el **constructor**. Este es un **método que se llama igual que la clase** y sirve para inicializar el objeto. Tiene una visibilidad `public` y una serie de parámetros separados por comas (en nuestro ejemplo, dos argumentos: real e imaginario, que son tipo `double`). El código de este método se limita a copiar estos valores en los atributos del objeto. Pero tenemos un problema:

Los **parámetros del método (constructor)** (`real`, `imaginario`) se llaman igual que los **atributos de la clase**. Para referirnos a los atributos, podemos usar la palabra reservada `this`. Entonces, se usa `this.real` para hablar del atributo y luego `= real` para copiarlo al parámetro del constructor.

Para terminar, declaramos los **métodos**. Estos suelen comenzar indicando su visibilidad y luego el tipo de datos que devuelven. El primer método devuelve un `String` y el segundo un `void` (lo mismo que nada). Luego sigue el nombre del método y los parámetros. Dentro del primer método se usa la palabra reservada `return` para indicar el valor que devuelve el método.

*Primero se crean las clases y con ellas se pueden crear objetos y utilizarlos.*

## Creación y utilización de objetos

Para probar la clase Complejo, es decir, crear varios objetos de esta clase, creamos la clase Principal. **Esta clase debe ser almacenada en un fichero distinto**, en el fichero principal.class

```
class Principal {
    public static void main(String[] main){
        Complejo z, w;
        z = new Complejo(-1.5, 3.0);
        w = new Complejo(-1.2, 2.4);
        z.suma(w);
        System.out.println("Complejo:"+z.toString());
    }
}
```

Esta clase solo tiene un método: `main`. Este ya tiene una determinada estructura. **Siempre que Java encuentre una clase main la va a ejecutar por primer lugar al iniciar la ejecución del programa.** El método tiene un array de strings que se llama también `main`. Esto sirve para que en el caso de ejecutar el programa desde una línea de comandos se pueda indicar una serie de argumentos que parametizarán la ejecución del programa.

Primero se declaran dos objetos (z y w) de la clase Complejo: `Complejo z, w;`

Luego se inicializan los objetos llamando al constructor Complejo, indicando la parte real y la parte imaginaria. Se antecede con la palabra `new` **para indicar que se quiere crear un nuevo objeto**: `z = new Complejo(-1.5, 3.0);`

Una vez ya creados los objetos se puede indicar que queremos sumarlos: `z.suma(w);` Recordemos que nuestro método de suma acumula la suma en el número complejo z.

Luego podemos imprimir a consola utilizando `System.out.println("Complejo:"+z.toString());` y eso nos devolverá el valor concreto que en este momento tiene `z` convertido a string de acuerdo a nuestro método toString y la cadena `Complejo:`.

## El encapsulamiento y la visibilidad en Java
El software tiende a cambiar con mucha facilidad cuando se encuentran mejores formas de resolver problemas así que resulta imprescindible que estos cambios afecten lo menos posible a otras partes del código.

- **Interface**: cómo este programa puede ser utilizado, cómo se va a acceder al software. Los elementos de una clase que son visibles fuera de esta (visibilidad `public`).
- **Implementación**: el código utilizado para resolver distintos algoritmos. Se crean determinados atributos y se escribe el código de los diferentes métodos.
- **Encapsulamiento**: ocultar la implementación y los atributos de un objeto de manera que sólo se puede cambiar su estado mediante ciertas operaciones definidas en el interface del objeto (procurar que el interface sea lo más independiente posible de la implementación).

Para indicar la visibilidad de un elemento, tanto atributos como métodos, podemos anteceder una de las siguientes palabras reservadas:

- `public`: accesibles desde cualquier clase.
- `private`: solo accesibles por la clase actual.
- `protected`: solo accesibles por la clase actual, sus descendientes y clases de nuestro paquete.
- `<empty>`: solo accesibles por clases de nuestro paquete.

### Acceso a los atributos de la clase
Los atributos de una clase están muy relacionados con su implementación, por lo que conviene marcarlos como `private` e impedir su acceso desde fuera. De esta forma podemos cambiar la representación interna del objeto sin alterar su interface. Para hacer esto utilizamos el método **getter** (consultar el valor de un atributo) y **setter** (modificar el valor de un atributo). Ambos tienen visibilidad `public` para que puedan ser invocados desde fuera de la clase.

Entonces, si nuestra clase Complejo tiene como atributos:
```
class Complejo {
    private double real, imaginario;
    ...
```
Nuestro getter y setter para el atributo `real` sería:
```
public double getReal(){
    return real;
}
```
```
public void setReal(double real){
    this.real = real;
}
```

Al trabajar de esta manera se puede:

- Cambiar la representación interna de la clase sin alterar el interface
- Verificar que los valores sean correctos, por ejemplo:
```
public void setReal(double real){
    if (real>100000){lanzamos una excepción}
    else this.real = real;
}
```
- Modificar otros aspectos del objeto o lanzar eventos:
```
public void setReal(double real){
    contadorModificaciones++;
    lanzamos el evento: onComplejoChange
    this.real = real;
}
```

## Herencia
Digamos que tenemos la clase `GeoPunto` que toma como atributos `longitud` y `latitud` y queremos agregar `altitud`. Podríamos cambiar la clase `GeoPunto` y reescribirla pero esto usualmente no es sencillo. Es más fácil y práctico crear una nueva clase que herede de `GeoPunto` y que añada el nuevo atributo.

La herencia nos permite resolver el problema de la reutilización del código de manera sencilla y eficiente. Consiste en crear la nueva clase a partir de otra que llamaremos padre y esta podrá crear nuevos atributos y métodos para completar su comportamiento.

La clase hija puede volver a definir los métodos de la clase padre. En tal caso es recomendable indicarlo con `@Override`. Si un método ha sido sobrescrito podemos acceder al de la clase padre con el prefijo `super.<método>` y para llamar al constructor del padre, `super.(<parámetros>)`.

El constructor de la clase hija suele comenzar llamando al constructor de la clase padre, por lo que la primera línea del código usualmente es `super.<método>;`.

## Sobrecarga
Java permite varias versiones de un mismo método, siempre que se cambien los parámetros. Esta forma de trabajar permite mucha flexibilidad y se le conoce como sobrecarga.

En el ejemplo de Complejos, se puede hacer un método que tome dos argumentos:
```
public void suma(double re, double im){
    real = real + re
    imaginario = imaginario + im;
}
```

O se puede hacer uno que tome un solo argumento:
```
public void suma(double re){
    real = real + re;
}
```

## La clase Object
La palabra `extends` se usa para trabajar con herencias y decir cuál clase hereda de cuál. Pero aunque no se tenga que decir explícitamente, todo objeto hereda de la clase `Object`. Esta clase es la raíz del árbol genealógico de herencias en Java. Dispone de una serie de métodos que por tanto van a estar disponibles para todos los objetos que creemos. Estos son: `toString()`, `getClass()` y `equals(Object o)`.

Las cadenas, Strings, son objetos en Java. Por lo tanto para comparar cadenas se utiliza `equals(Object o)` y no `==`.

Un objeto de la clase hija **también lo es de la clase padre y de todos sus antecesores.** Es decir, un objeto de la clase `ComplejoAmpliado` será de la clase `Complejo` y de la clase `Object`. Todo objeto en Java será necesariamente de la clase `Object`.

## Polimorfismo
Consiste en declarar un objeto de una clase, pero instanciarlo como un descendiente de dicha clase. Es decir:

`<Padre> <objeto> = new <Hija>(<param>);`

Tenemos un objeto declarado de una clase Padre, pero a la hora de instanciarlo ponemos `new` y utilizamos un constructor de una clase Hija que desciende de la clase Padre.

Esto nos permite crear nuestras propias versiones de cada objeto. Por ejemplo, si queremos hacer un botón en Android necesitaremos indicar un objeto de la clase `Drawable`. Esta clase representa algo que se puede dibujar y tiene muchos descendientes:

- `BitmapDrawable`: BMP, PNG, JPG
- `ShapeDrawable`: vectores
- `GradientDrawable`: dibujos de degradado
- `AnimationDrawable`: animaciones frame by frame
 
La clase `Drawable` no permite declarar un objeto directamente de esta clase (es una clase abstracta). Un `Drawable` es algo dibujable pero que no se sabe cómo. Un objeto real se debe declarar con uno de los descendientes o incluso crear una nueva clase que descienda de alguna otra. Por ejemplo, `AnimacionLucesNavidad` puede descender de `AnimationDrawable`, y así también descender de `Drawable`.

En nuestro caso de números complejos, podríamos crear:

`Complejo numero = new ComplejoAmpliado(3.4, 1.1);`.

Un objeto de clase `Complejo` pero instanciado como el descendiente `ComplejoAmpliado`. Lo contrario no es posible.

### Conversión de tipos
Imaginemos que hemos declarado un objeto de una clase pero lo hemos construido utilizando un constructor de una clase descendiente:

`Complejo c = new ComplejoAmpliado(12.4);`

Podremos usar cualquier método de la clase `Complejo` o cualquiera de sus ancestros como `c.toString()`, `c.getClass()`, pero no `c.esReal()` porque este método no está definido para la clase `Complejo`. No obstante, sabemos que sí está definido para la clase `ComplejoAmpliado` por lo que sí se le puede llamar pero se necesita realizar un cambio de tipo, o *typecast*:

`((<Clase>) <objeto>)`

A partir de ese momento, `<objeto>` será considerado de la clase `<Clase>.` Por ejemplo:

`((ComplejoAmpliado) c)`

Así, `((ComplejoAmpliado) c).esReal()` ahora podrá ser invocado.

### Comprobación de instancias
Podemos averiguar si un objeto es de una determinada clase cuando se usa la expresión:

`<objeto> instanceof <Clase>`

Por ejemplo:
```
Complejo c = new ComplejoAmpliado(12.4);

if (c instanceof Object){...} //siempre true
if (c instanceof Complejo){...} //true
if (c instanceof ComplejoAmpliado){...} //true
...
```

## Tipos enumerados
Es un tipo de dato que solo puede tomar como valores los definidos en una lista. Se utiliza la siguiente estructura:

`[visibilidad] [modificadores] enum Nombre {VALOR1, VALOR2, ...}`

Donde `[visibilidad]` = `public`, `protected`, `private` y `[modificadores]` = `static`.

Por convenio, el nombre del tipo comienza con mayúscula y los valores van todos en mayúsuculas. Los tipos enumerados aparecen recién en la versión 5 de Java.

Por ejemplo, si quisiéramos almacenar el día de la semana podríamos crear un nuevo enum llamado `Dia`:

```
public enum Dia {LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO, DOMINGO}

Dia dia;
dia = Dia.JUEVES;
```

Una vez creado (primera línea), se puede declarar la variable `dia` de la clase `Dia` y para asignarle un valor utilizamos el nombre del enum, `Dia`, `.` y el nombre de uno de los valores que hemos definido.

La declaración de un enumerado sigue las mismas restricciones que una clase. Se puede declar un enum dentro o fuera de una clase pero nunca dentro de un método y se puede declarar de forma pública en un fichero separado con el mismo nombre que el enum.

Realmente cuando se crea un enum, **se crea una clase implícitamente, descendiente de Enum**. De esta forma se heredan todos los métodos de esta clase:

- `String name()`: devuelve el valor de la constante correspondiente.
- `int ordinal()`: devuelve la posición del numerado dentro de la lista de valores.
- `int compareTo(Enum e)`: compara las posiciones de un objeto con relación a otro (resta los índices).
- `Enum valueOf(String s)`: devuelve a qué enum corresponde a partir del nombre.
- `enumConstant[] values()`: devuelve un array con las constantes del enum.

```
public enum Dia {LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO, DOMINGO}

Dia dia = Dia.JUEVES;
dia.name() -> "JUEVES"
dia.ordinal() -> 3
dia.compareTo(Dia.MARTES) -> 3-1 -> 2
dia.valueOf("JUEVES") -> Dia.JUEVES

for (Dia d: Dia.values()) {
    System.out.print(d+ ", ");
} -> "LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO, DOMINGO"
```

Además, cada variable y constante del enum son realmente objetos de la clase.

Se pueden asociar atributos y métodos a un enum. Por ejemplo, podríamos crear un enum para las versiones de Android y a cada elemento se le asigna en forma de `int` el nivel del API correspondiente. Para esto se inicializa el enum con los valores y un paréntesis y el valor dentro. Luego se declara el atributo, se hace un constructor que jale el valor y se crea el getter.

```
public enum VersionAndroid {
    CUPCAKE(3), DONUT(4), ECLAIR(5), FROYO(8), GINGERBREAD(9), HONEYCOMB(11), ICE_CREAM(14), JELLY_BEAN(16), KITKAT(19), LOLLIPOP(21), MARSHMALLOW(25);
    
    private int nivelAPI;
    
    private VersionAndroid(int nivelAPI){
        this.nivelAPI = nivelAPI;
    }
    
    int getNivelAPI(){
        return nivelAPI;
    }
}
```

## Colecciones
El API de Java nos proporciona el framework de las colecciones que permite usar **diferentes estructuras de datos para almacenar y recuperar objetos de cualquier clase**. Las colecciones no forman parte del lenguaje pero son clases definidas en el paquete `java.util`. Se usa la siguiente estructura:

`Coleccion<Clase> nombre = new Coleccion<Clase>();`

`Coleccion` es una clase de este framework que queramos utilizar según la estructura de almacenamiento que nos interese y `Clase` representa el tipo de datos a almacenar. Si quisiéramos crear una lista ordenada de cadenas, escribiríamos:

`ArrayList<String> listaNombres = new ArrayList<String>();`

También se pueden trabajar con clases genéricas usando `<y>`. A este mecanismo se le conoce como genericidad.

Existen tres tipos de colecciones que tienen una interfaz común pero distintas implementaciones. Algunas implementaciones son más rápidas para algunas operaciones:

- **Conjunto**: los elementos no tienen orden y no se permiten duplicados. Se define el interface como `Set<E>` y se pueden usar las implementaciones `HashSet<E>` para tablas hash, `LinkedHashSet<E>` para tablas hash con listas enlazadas y `TreeSet<E>` para árboles.
- **Listas**: cada elemento tiene un índice, estructura secuencial. Se usa el interface `List<E>` y se pueden usar las implementaciones `ArrayList<E>` para acceso rápido, `LinkedList<E>` para inserciones y borrados rápidos y `Stack<E>` para apilar.
- **Diccionarios/Matrices de asociación**: cada elemento tiene asociada una clave que se usa para recuperarlo. Se usa el interface `Map<K,V>` y las implementaciones `HashMap<K,V>` para tablas hash, `TreeMap<K,V>` para árboles y `LinkedHashMap<K,V>` para tablas hash con listas enlazadas.

Los interfaces `List<E>` y `Set<E>` heredan de `Collection<E>`. Los siguientes métodos son comunes a los interfaces `List<E>` y `Set<E>`:

- `boolean add(E e)`: añade un nuevo elemento al final de la lista.
- `boolean remove(E e)`: elimina la primera ocurrencia del elemento indicado.
- `boolean contains(E e)`: comprueba si el elemento especificado está en la colección.
- `void clear()`: elimina todos los elementos de la colección.
- `int size()`: devuelve el número de elementos en la colección.
- `boolean isEmpty(Collection<?> c)`: comprueba si la colección está vacía.

Los siguientes métodos sirven para trabajar con dos colecciones:

- `boolean addAll(Collection<?> c)`: añade todos los elementos de la colección c.
- `boolean removeAll(Collection<?> c)`: elimina todos los elementos de c.
- `boolean containsAll(Collection<?> c)`: comprueba si coinciden las colecciones.
- `boolean retainAll(Collection<?> c)`: elimina todos los elementos a no ser que estén en c (intersección).

## Conjuntos
Estructuras de datos sin orden y que no permiten duplicados. Usan la interface `Set<E>` que no añade nuevos métodos a la interface `Collection<E>`. La implementación más eficiente es `HashSet<E>`, pero si queremos que los elementos queden ordenados podemos usar `TreeSet<E>`.

El siguiente ejemplo muestra cómo crear un conjunto de Strings y luego recorrerlo para mostrarlo en consola. Inicializamos un objeto `HashSet` si queremos que los elementos no estén ordenados (orden natural, eficiente):
```
Set<String> conjunto = new HashSet();
```
También podemos inicializarlo como `TreeSet` si queremos que se ordenen alfabéticamente. No es tan eficiente:
```
Set<String> conjunto = new TreeSet(); // orden alfabético
```
Luego hacemos las operaciones que querramos; sea añadir o quitar elementos e imprimirlos todos con un for:
```
conjunto.add("manzana");
conjunto.add("pera");
conjunto.add("fresa");
conjunto.add("naranja");
conjunto.remove("pera");

for(String s:conjunto){
    System.out.println(s);
}
```

## Listas
Una lista es una estructura secuencial donde cada elemento tiene un índice. También recibe el nombre de array o vector unidimensional. El primer elemento siempre ocupa la posición 0. Utilizan la interfaz `List<E>` y las implementaciones `ArrayList<E>` para acceder a posiciones de manera muy rápida o `LinkedList<E>` para hacer inserciones y borrados rápidos.

La clase `List<E>` hereda los métodos de `Collection<E>` y añade los siguientes:

- `boolean add(int indice, E e)`: inserta un nuevo elemento en una posición. Los elementos se arriman.
- `E get(int indice)`: devuelve el elemento de la posición especificada.
- `int indexOf(E e)`: devuelve la primera posición en la que se encuentra un elemento. Si no lo encuentra, devuelve -1.
- `int lastIndexOf(E e)`: devuelve la última posición del elemento especificado. Si no lo encuentra, devuelve -1.
- `E remove(int indice)`: elimina el elemento de la posición indicada.
- `E set(int indice, E e)`: pone un nuevo elemento en la posición indicada y devuelve el elemento que se encontraba en dicha posición anteriormente.

Crearemos una lista de complejos y luego la recorremos:
```
List<Complejo> lista = new ArrayList<Complejo>();

lista.add(new Complejo(1.0, 5.0));
lista.add(new Complejo(2.0, 4.2));
lista.add(1, new Complejo(3.0, 0.0));

lista.remove(0); 

for(Complejo c: lista){
    System.out.println(c);
}
```
En las primeras dos llamadas al método `add` no se indica en qué posición insertar el elemento (se inserta al final). En la tercera se indica la posición 1 (segunda posición).

## Diccionarios
Los diccionarios o matrices asociativas son estructuras de datos donde cada elemento tiene asociado una clave para recuperarlo (en lugar del índice de una lista). Para definirlos se usa la interface `Map<K,V>`. La clave (o llave) se establece en la `K` y los valores en la `V`. La idea es que cada elemento se almacena como un par `(K,V)`.

Podríamos, por ejemplo, hacer un diccionario de vehículos. Creamos la clase `Vehiculo` y utilizamos como clave su matrícula en un `String`. De esta forma, a partir de la matr[icula podremos encontrar al vehículo asociado rápidamente.

Podemos usar las siguientes implementaciones de este interfaz: `HashMap<K,V>`, `TreeMap<K,V>` y `LinkedHashMap<K,V>`. `Map<K,V>`, el padre, no hereda la interface de `Collection<E>` a diferencia de otras colecciones. Estos son los métodos disponibles para la interface `Map<K,V>`:

- `V put(K key, V value)`: añade un nuevo par clave-valor al diccionario.
- `V get(Object key)`: da el valor asociado a una clave o null si no lo encuentra.
- `V remove(Object key)`: elimina el par clave-valor que corresponde a la clave.
- `boolean containsKey(Object key)`: comprueba si existe la clave especificada.
- `boolean containsValue(Object value)`: comprueba si está el valor especificado.
- `Set keySet()`: devuelve un conjunto con todas las claves contenidas en el diccionario.
- `Collection values()`> devuelve una colección solo con valores.
- `boolean isEmpty():` comprueba si la colección está vacía.
- `int size()`: devuelve el número de elementos que contiene la colección.
- `void clear()`: elimina todos los elementos de la colección.

Por ejemplo, para el caso de los vehículos, podríamos crear un `HashMap` que almacene las matrículas como strings:

```
Map diccionario = new HashMap();

diccionario.put("V 1245", new Vehiculo());
diccionario.put("A 2455", new Vehiculo());
diccionario.get("V 1245");
```

La clase `Collections` nos da las herramientas para ordenar y buscar en las colecciones. Los interfaces `Iterator` y `ListIterator` facilitan los recorridos.

# Introducción a Android
## Características de Android
Es una plataforma de desarrollo libre **basada en Linux**. Además es **adaptable a cualquier tipo de hardware**, no solo teléfonos y tablets. Funciona en relojes, cámaras, electrodomésticos, televisores, automóviles y una gran variedad de sistemas empotrados que lo usan como sistema opertaivo. Esto tiene ventajas pero también supone un **esfuerzo adicional al programador**. Las aplicaciones han de funcionar correctamente en dispositivos con gran variedad de tipos de entrada, pantallas, memorias, etc. Esto **contrasta directamente con la estrategia de Apple**. En iOS se tiene que desarrollar una aplicación para iPhone, otra para iPad y otra para Apple Watch.

Las aplicaciones finales son **desarrolladas en Java lo que nos asegura que podrán ser ejecutadas en cualquier tipo de CPU** gracias al concepto de máquina virtual. La arquitectura está basada en componentes inspirados en el funcionamiento del Internet: por ejemplo, el diseño de la interfaz se realiza en XML lo que permite que una misma aplicación se ejecute en un móvil de pantalla reducida o en un televisor. **Maneja un nivel de seguridad aceptable pero que requiere de la responsabilidad del usuario**. Los programas se encuentran aislados unos de otros gracias al concepto de ejecución dentro de una caja (cosa que hereda de Linux). Cada aplicación además dispone de una serie de permisos que limitan su rango de actuación. Android está también **optimizado para dispositivos con baja potencia y poca memoria** (gracias a la máquina virtual Dalvik). Finalmente maneja una **alta calidad de gráficos y sonidos**, usando gráficos vectoriales suavizados, animaciones inspiradas en Flash, gráficos 3D basados en OpenGL e **incorpora muchos codecs para audio y video**, incluyendo H.264 y AAC (cosa que Apple no hace todavía).

En conclusión, nos ofrece una forma sencilla y novedosa de implementar potentes aplicaciones para diferentes tipos de dispositivo. Es rápido y compatible, pero requiere de mayores esfuerzos de programación.

## Arquitectura de Android
La arquitectura de Android está formada por 4 capas. Todas las capas están basadas en software libre.

### Primera capa: el núcleo Linux
Está formado por el sistema operativo Linux 2.6. Proporciona los servicios de seguridad, manejo de memoria, multiproceso, pila de protocolos y soporte de drivers para dispositivos. Actúa como capa de abstracción entre el hardware y el resto de la pila. Por lo tanto, es la única que es dependiente del hardware.

### Segunda capa: runtime de Android
Está basado en el concepto de máquina virtual que se usa en Java. Debido a que no fue posible utilizar una máquina virtual Java estándar, para uso de gran variedad de dispositivos, Google tomó la decisión de crear una nueva máquina virtual llamada Dalvik. Esta máquina ejecuta los ficheros Dalvik (.dex), formato optimizado para ahorrar memoria. Se basa en registros, aislando cada proceso Linux como una propia instancia de la máquina virtual. Delega al kernel de Linux algunas funciones como threading y el manejo de memoria a bajo nivel. A partir de Android 5.0 se reemplaza Dalvik por Art que consigue reducir el tiempo de ejecución del código Java hasta en 33%. También incluye las librerías nucléicas con la mayoría de librerías disponibles en Java.

### Tercera capa: librerías nativas
Incluye un conjunto de librerías en C y C++ usadas en varios componentes de Android. Están compiladas en código nativo del procesador. Muchas son de código abierto. Incluye: System C (una extensión de la librería BSD de C), Media Framework (que soporta codecs de mucha variedad), Surface Manager (que maneja las representaciones gráficas), WebKit (que soporta el navegador nativo de Android para conexiones en HTML, mismo que usa Chrome y Safari), SGL (motor de gráficos 2D), Librerías 3D (OpenGL y aceleración de hardware, así como proyecciones en 3D si es disponible), FreeType (fuentes en bitmap con rendereizado vectorial), SQLite (ligero motor de base de datos relacional disponible para todas las aplicaciones) y SSL (servicios de Secure Socket Layer para conexiones seguras).

### Cuarta capa: entorno de aplicación
Proporciona una plataforma de desarrollo libre para aplicaciones con muchos distintos tipos de dispositivos. La capa fue diseñada para simplificar la reutilización de componentes. Las aplicaciones publican sus capacidades y otras hacen uso de ellas. Los servicios más importantes que incluye son: Views (conjunto de vistas, parte visual de los componentes), Resource Manager (acceso a recursos que no son código), Activity Manager (maneja el ciclo de vida de las aplicaciones y proporciona un sistema de navegación entre ellas), Notification Manager (permite mostrar aleratas personalizadas), Content Providers (mecanismo para acceder a datos de otras aplicaciones).

### Quinta capa: aplicaciones
Este nivel está formado por el conjunto de aplicaciones instaladas en una máquina Android. Todas las aplicaciones han de correr en la máquina virtual Dalvik. Normalmente las aplicaciones Android están escritas en Java. Para hacer esto, podemos utilizar el Android SDK (Software Development Kit). También se puede utilizar C o C++ de la mano con el Android NDK (Native Development Kit).

## Componentes de una aplicación
### Vistas (Views)
Son elementos que componen la interface de usuario. Por ejemplo, **un botón on una entrada de texto**. Todas las vistas son objetos que descienden de View y por lo tanto pueden ser definidas en Java pero lo usual es definirlas usando XML y dejar que el sistema cree los objetos necesarios a partir de ese fichero.

### Layout
Es un **conjunto de vistas agrupadas de una determinada forma**. Se dispone de distintos tipos de layouts para organizar las vistas de forma lineal, en grid, o indicando la posición relativa o absoluta. Estos también son objetos descendientes de la clase View así que se pueden definir en código o usando XML.

### Actividad (Activity)
Las aplicaciones están compuestas por una serie de **pantallas**. En Android, se les conoce como actividades. Su función principal es la creación del interface del usuario. Una aplicación suele requerir de varias actividades para crear el interface. Las diferentes actividades serán independientes de si y cada una desciende de Activity.

### Servicio (Service)
Es un proceso que **se ejecuta en el back-end sin la necesidad de interacción con el usuario**. Es similar a un demonio en Unix o a un servicio en Windows. En Android hay servicios locales (ejecutados en el mismo proceso) y remotos (ejecutados en procesos separados).

### Intención (Intent)
Una intención representa la **voluntad de realizar alguna acción**, como realizar una llamada de teléfono, visualizar una página web, etc. Se utiliza cada vez que se quiere lanzar una actividad, un servicio, enviar un anuncio de tipo broadcast o comunicarse con un servicio. Los componentes lanzados pueden ser internos o externos a la aplicación. También se usan para el intercambio de información entre estos componentes.

### Fragment
Los fragments sirven para ayudar a los diseñadores a crear actividades compatibles con todo tipo de pantallas. **Un fragment está formado por la unión de varias vistas** para crear un bloque funcional de la interface del usuario. Una vez creados los fragments se pueden combinar uno o varios dentro de una actividad, de acuerdo al tamaño de pantalla disponible.

### Receptor de anuncios (Broadcast Receiver)
Un receptor de anuncios **recibe y reacciona ante anuncios de tipo broadcast**. Estos pueden ser originados por el sistema o por las aplicaciones. Típicamente están los de batería baja, llamada entrante, etc. Las aplicaciones también pueden crear y lanzar nuevos tipos de broadcasts. Los receptores de anuncios no disponen de interface de usuario aunque pueden iniciar una actividad si es necesario.

### Proveedores de contenido (Content Provider)
Muchas veces las aplicaciones necesitan compartir información entre si. Android define este **mecanismo estándar para que se pueda compartir datos sin comprometer la seguridad del sistema de ficheros**. Así se pueden acceder a datos de otras aplicaciones, como por ejemplo la lista de contactos.
