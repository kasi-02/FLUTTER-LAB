// 1.b) Write a simple Dart program to understand the language basics.

// importing dart standart libraries
import 'dart:math';

void main() {
  // variables
  int a = 10;
  double b = 20.2;
  num c = 10; // num can be either int or double
  c = 20.2; // now it is double
  var d = 'a'; // type determined based on the given value during initialization
  // d = 10; // ERROR: since d is a string and it can not be given integer.
  // use dynamic instead
  bool e = true;
  dynamic f = 'a';
  f = 10; // valid.

  if (a > 10)
    print("a is greater than 10");
  else
    print("a is less than or equal to 10");

  switch (a) {
    case 10:
      print("ten");
    case 20:
      print("twenty");
  }

  int i;
  i = 0;
  while (i <= 5) {
    print("hello");
    i++;
  }

  for (int j = 0; j < 5; j++) print("World");

  // function call.
  int k = fibonacci(5);
  print("5th fibonacci term $k"); // string interpolation

  // testing import
  var degrees = 30;
  var radians = degrees * (pi / 180);
  var sinOf30degrees = sin(radians);
  print('sin(30) value is $sinOf30degrees');

  // Object
  Point X = Point(10, 20);
  Point Y = Point(20, 30);
  print('Difference between point X and Y is  ${X.difference(Y)}');

  // Exeption handling
  try {
    dontCallMe();
  } on Exception catch (e) {
    print('Caught the exception - $e');
  }

  // Enums
  Color col = Color.RED;
  switch (col) {
    case Color.RED:
      print('Red');
    case Color.GREEN:
      print('Green');
    case Color.BLUE:
      print('Blue');
  }
}

// functions
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

class Point {
  int x;
  int y;

  // constructor
  Point(this.x, this.y);

  // method
  double difference(Point other) {
    return sqrt(pow((x - other.x), 2) + pow((y - other.y), 2));
  }
}

void dontCallMe() {
  throw Exception('Why did you call me? throwing exception...');
}

enum Color { RED, GREEN, BLUE }
