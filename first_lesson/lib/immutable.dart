class Person {
  final String name;
  final int age;
  const Person(this.name, this.age);
}
void main() {
  const Person person = Person('John', 25);
  final Person per=const Person("nazife", 22);
  print(person.name); // Output: John
// Attempting to modify an immutable object results in a compile-time error
  //person.name = 'Jane'; // Error: Setter not found: 'name'.
}