class Hero {
  String? nama;
  String? job;
  int _darah;
  int? energi;

  int get darah => _darah;

  set darah(int n) {
    if (n >= 0 && n <= 100) {
      _darah = 0;
    }
  }
}

void main() {
  Hero ling = Hero();
  ling.nama = "ling";
  ling.job = "Swift blade";
  ling.darah = 350;
  ling.energi = 200;

  ling.darah = 100000;
  print(ling.darah);
}
