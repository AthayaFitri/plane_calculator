import 'package:flutter/material.dart';

import '../utils/themes.dart';
import '../components/touchable_opacity.dart';
import 'calculator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Daftar Content.
  final List<Map<String, dynamic>> contents = [
    {
      'name': 'Trapesium',
      'image': 'assets/img/trapesium.png',
      'shapeType': ShapeType.trapesium,
    },
    {
      'name': 'Segitiga',
      'image': 'assets/img/segitiga.png',
      'shapeType': ShapeType.segitiga,
    },
    {
      'name': 'Lingkaran',
      'image': 'assets/img/lingkaran.png',
      'shapeType': ShapeType.lingkaran,
    },
    {
      'name': 'Persegi',
      'image': 'assets/img/persegi.png',
      'shapeType': ShapeType.persegi,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: <Widget>[
          Column(
            children: contents
                .map(
                  (data) => TouchableOpacity(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CalculatorPage(
                          shapeType: data['shapeType'],
                        ),
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: PlaneColors.shadow.withOpacity(0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 1),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(data['image']),
                            width: 150,
                          ),
                          Text(data['name'],
                              style:
                                  PlaneFonts(context).boldQuicksand(size: 18)),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
