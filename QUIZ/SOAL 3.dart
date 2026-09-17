void main() {
  List<String> menu = [
    'Nasi Goreng',
    'Mie Ayam',
    'Ayam Geprek',
    'Soto Ayam',
    'Es Teh'
  ];

  print('=== DAFTAR MENU KANTINKAMPUS ===');

  for (int i = 0; i < menu.length; i++) {
    print('${i + 1}. ${menu[i]}');
  }
}
