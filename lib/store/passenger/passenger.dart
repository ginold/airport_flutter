class Passenger {
  String name;
  String surname;
  DateTime birthDate;
  String email;
  String phoneNumber;
  String get getName => name;

  void setName(String name) => this.name = name;

  String get getSurname => surname;

  void setSurname(String surname) => this.surname = surname;

  String get getEmail => email;

  void setEmail(String email) => this.email = email;

  String get getPhoneNumber => phoneNumber;

  void setPhoneNumber(String phoneNumber) => this.phoneNumber = phoneNumber;
  Passenger(
      this.name, this.surname, this.birthDate, this.email, this.phoneNumber);
}
