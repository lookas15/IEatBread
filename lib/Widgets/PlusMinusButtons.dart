import 'package:flutter/material.dart';

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
  width: 250,
  margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0), // Tambahkan margin hanya pada bagian bawah
  decoration: BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2), // Warna bayangan dan opasitas
        spreadRadius: 3, // Seberapa jauh bayangan akan menyebar
        blurRadius: 5, // Seberapa kabur bayangan
        offset: Offset(0, 2), // Geser bayangan secara vertikal
      ),
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: deleteQuantity,
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.red, // Warna latar belakang tombol -
            shape: BoxShape.circle, // Bentuk menjadi lingkaran
          ),
          child: const Icon(Icons.remove, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Warna latar belakang box quantity
            borderRadius: BorderRadius.circular(5.0), // Atur border radius sesuai keinginan
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ), // Atur padding sesuai keinginan
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black, // Warna teks pada box quantity
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: addQuantity,
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.red, // Warna latar belakang tombol +
            shape: BoxShape.circle, // Bentuk menjadi lingkaran
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    ],
  ),
);

  }
}
