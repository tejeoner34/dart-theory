import 'dart:math' as math;

void main() {
  // Hay varias formas de declarar variables
  var name = 'variable with var';
  final name1 = 'variable with final. It states that the value won´t change';
  const name2 = 'variable with const. It states that the value won´t change in compiling time';
  String name3 = 'With String keyword to indicate its type';

  
  // Maps (objects)
  // a los mapas le podemos indicar tanto el tipo de dato de la clave como del valor
  Map<String, dynamic> person = {
    'name': 'Peter',
    'age': 23,
    'married': false
  };
  
  //Lists (arrays)
  // Podemos indicarle el tipo de datos estricto o no poner nada y que sea dynamic
  List<double> myList = [1, 2, 3];
  List dynamicList = [1, false, 'peter'];
  
  //Booleans
  
  bool isOpen = false;
  
  //Funciones
  
  void greet() {
    print('Hello');
  }
  
  // funciones con argumentos opcionales
  
  void myGreeting(String name, [String greeting = 'hi']) {
    print('$greeting $name');
  }
  
  // Parametros como objeto
  
  void myGreeting2({
    required String name,
    required String message
  }) {
    print('$name, $message');
  }
    
  //Creacion de instancia de clase
  
  final spiderman = Hero('Spiderman', 'spider power');
  final pikachu = Pokemon(name: 'Pikachu', type: 'Electric');
}

//Clases en Dart
  
class Hero {
  String name;
  String power;

  Hero(this.name, this.power);
}

// class in dart with constructor arguments as object

class Pokemon {
  String name;
  String type;
  
  Pokemon({
    required this.name,
    required this.type
  });
  
  Pokemon.fromJson( Map<String, String> json):
    this.name = json['name'] ?? '',
    this.type = json['type'] ?? '';
}

// en las clases podemos tener diferentes constructors para
// diferentes estructuras. Lo vemos en el ejemplo anterior


// Setters y getters en clases

class Square {
  double side;
  
  double get area {
    return this.side * this.side;
  }
  
  // los setters nos permiten realizar logica extra cuando cambia un valor
  set area (double value) {
    this.side = math.sqrt(value);
  }
  
  Square(this.side);
}


// Clases abstractas: Son clases que se usan como base/interfaz de otras clases
// las cuales implementaran esta clase abstracta. Da una serie de propiedades y 
// métodos base


abstract class Shape {
  double? height;
  double? width;
  
  double area();
}

class Rectangle implements Shape {
  
  double height;
  double width;
  
  Rectangle({
    required this.height,
    required this.width
  })
  
  double area() => 3.14 * height * width;
}


//Mixins: nos permiten crear clases con métodos que podrán usar otras clases
// Un ejemplo es a la hora de crear classes de animales, podremos crear
// una superclass Animal que tendrá unas subclases Mammal, Bird, Fish.
// La cosa viene a la hora de crear por ejemplo una clase Bat que es un Mammal
// pero que puede andar y volar. Podemos usar mixins que provean de estas funcionalidades

abstract class Animal {}
class Mammal extends Animal {}
class Bird extends Animal {}
class Fish extends Animal {}

// Creamos los mixins
class Walker {
  void walk() => print('walking');
}
class Swimmer {
  void swim() => print('Swimming');
}
class Flyer {
  void fly() => print('flying');
}

class Bat extends Animal with Flyer, Walker {}