class Book {
  String _name;
  int _year;

  static int age = 5;

// Khoi tao
  Book(this._name, this._year);

  String get getName {
    return _name;
  }

  set setName(String newName) {
    _name = newName;
  }

  int get getYear {
    return _year;
  }

  set setYear(int newYear) {
    _year = newYear;
  }

  void showHello() {
    print('Xin chao cac ban $_name');
  }
}

// class BookFunny extends Book {
//   String type;
//   BookFunny(String name, int year, {this.type = 'Sach vui ve'})
//       : super(name, year);
// }
