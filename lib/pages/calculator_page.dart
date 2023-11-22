// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/my_appbar.dart';

enum ShapeType {
  trapesium,
  segitiga,
  lingkaran,
  persegi,
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({
    Key? key,
    required this.shapeType,
  }) : super(key: key);

  final ShapeType shapeType;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late String title;
  late String imageAsset;
  late String imageRumusA;
  late String imageRumusP;
  String hint = "Enter value";

  TextEditingController panjang_a = TextEditingController();
  TextEditingController panjang_b = TextEditingController();
  TextEditingController panjang_c = TextEditingController();
  TextEditingController panjang_d = TextEditingController();
  TextEditingController panjang_r = TextEditingController();
  TextEditingController tinggi = TextEditingController();

  double resultArea = 0.0;
  double resultPerimeter = 0.0;

  @override
  void initState() {
    super.initState();
    // Inisialisasi data berdasarkan bentuk yang dipilih
    switch (widget.shapeType) {
      case ShapeType.trapesium:
        title = 'Trapesium';
        imageAsset = 'assets/img/t_gambar.png';
        imageRumusA = 'assets/img/t_rumus_A.png';
        imageRumusP = 'assets/img/t_rumus_P.png';
        break;
      case ShapeType.segitiga:
        title = 'Segitiga';
        imageAsset = 'assets/img/s_gambar.png';
        imageRumusA = 'assets/img/s_rumus_A.png';
        imageRumusP = 'assets/img/s_rumus_P.png';
        break;
      case ShapeType.lingkaran:
        title = 'Lingkaran';
        imageAsset = 'assets/img/l_gambar.png';
        imageRumusA = 'assets/img/l_rumus_A.png';
        imageRumusP = 'assets/img/l_rumus_P.png';
        break;
      case ShapeType.persegi:
        title = 'Persegi';
        imageAsset = 'assets/img/p_gambar.png';
        imageRumusA = 'assets/img/p_rumus_A.png';
        imageRumusP = 'assets/img/p_rumus_P.png';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context,
          title: 'Hitung Luas dan Keliling $title', leading: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  imageRumusA,
                  width: 150,
                ),
                const SizedBox(width: 20),
                Image.asset(
                  imageRumusP,
                  width: 150,
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (widget.shapeType == ShapeType.trapesium)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildTextField('a =  ', panjang_a),
                      const SizedBox(width: 20),
                      _buildTextField('b =  ', panjang_b),
                      const SizedBox(width: 20),
                      _buildTextField('h =  ', tinggi),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      _buildTextField('c =  ', panjang_c),
                      const SizedBox(width: 20),
                      _buildTextField('d =  ', panjang_d),
                    ],
                  ),
                ],
              ),
            if (widget.shapeType == ShapeType.segitiga)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildTextField('a =  ', panjang_a),
                      const SizedBox(width: 20),
                      _buildTextField('b =  ', panjang_b),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      _buildTextField('c =  ', panjang_c),
                      const SizedBox(width: 20),
                      _buildTextField('h =  ', tinggi),
                    ],
                  ),
                ],
              ),
            if (widget.shapeType == ShapeType.lingkaran)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildTextField('r =  ', panjang_r),
                    ],
                  ),
                ],
              ),
            if (widget.shapeType == ShapeType.persegi)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildTextField('a =  ', panjang_a),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Memanggil fungsi untuk menghitung dan menampilkan hasil
                calculateShape();
              },
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 20),
            Text('Luas: $resultArea'),
            Text('Keliling: $resultPerimeter'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        SizedBox(
          width: 120,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[600]!,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void calculateShape() {
    double a = double.tryParse(panjang_a.text) ?? 0.0;
    double b = double.tryParse(panjang_b.text) ?? 0.0;
    double c = double.tryParse(panjang_c.text) ?? 0.0;
    double d = double.tryParse(panjang_d.text) ?? 0.0;
    double r = double.tryParse(panjang_r.text) ?? 0.0;
    double t = double.tryParse(tinggi.text) ?? 0.0;
    double area, perimeter;

    // Memanggil fungsi perhitungan sesuai dengan bentuk
    switch (widget.shapeType) {
      case ShapeType.trapesium:
        area = calculateTrapeziumArea(a, b, t);
        perimeter = calculateTrapeziumPerimeter(a, b, c, d);
        break;
      case ShapeType.segitiga:
        area = calculateTriangleArea(b, t);
        perimeter = calculateTrianglePerimeter(a, b, c);
        break;
      case ShapeType.lingkaran:
        area = calculateCircleArea(r);
        perimeter = calculateCirclePerimeter(r);
        break;
      case ShapeType.persegi:
        area = calculateSquareArea(a);
        perimeter = calculateSquarePerimeter(a);
        break;
      default:
        area = 0.0;
        perimeter = 0.0;
        break;
    }
    setState(() {
      resultArea = area;
      resultPerimeter = perimeter;
    });
  }

  double calculateTrapeziumArea(double a, double b, double h) {
    return 0.5 * (a + b) * h;
  }

  double calculateTrapeziumPerimeter(double a, double b, double c, double d) {
    return a + b + c + d;
  }

  double calculateTriangleArea(double b, double h) {
    return 0.5 * b * h;
  }

  double calculateTrianglePerimeter(double a, double b, double c) {
    return a + b + c;
  }

  double calculateCircleArea(double r) {
    return pi * r * r;
  }

  double calculateCirclePerimeter(double r) {
    return 2 * pi * resultArea;
  }

  double calculateSquareArea(double a) {
    return a * a;
  }

  double calculateSquarePerimeter(double a) {
    return 4 * a;
  }
}
