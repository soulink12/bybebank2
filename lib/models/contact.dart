class Contact{
  final String name;
  final int accountNumber;

  Contact(this.name, this.accountNumber);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> contact = {
      "name": name,
      "accountNumber": accountNumber,
    };
    return contact;
  }

  @override
  String toString() {
    return 'name: $name, accountNumber: $accountNumber';
  }
}

