// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

import '../utils/themes.dart';
import '../components/my_appbar.dart';

class MyData {
  final String name;
  final String nim;
  final String ttl;
  final String hobi;
  final String foto;

  MyData({
    required this.name,
    required this.nim,
    required this.ttl,
    required this.hobi,
    required this.foto,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  MyData athaya = MyData(
    name: 'Athaya Rizqia Fitriani',
    nim: '12420071',
    ttl: 'Tangerang, 19 Februari 2004',
    hobi: 'Suka menggambar, melukis, mendengarkan musik',
    foto: 'assets/img/athaya.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'My Profile'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundImage:
                    AssetImage(athaya.foto), // Menampilkan gambar developer.
              ),
              const SizedBox(height: 20),
              Text(
                '${athaya.name}', // Menampilkan nama developer.
                style: PlaneFonts(context).semiBoldQuicksand(size: 15),
              ),
              const SizedBox(height: 5),
              Text(
                '${athaya.nim}', // Menampilkan NIM developer.
                style: PlaneFonts(context).semiBoldQuicksand(size: 15),
              ),
              const SizedBox(height: 5),
              Text(
                '${athaya.ttl}', // Menampilkan ttl developer.
                style: PlaneFonts(context).semiBoldQuicksand(size: 15),
              ),
              const SizedBox(height: 5),
              Text(
                '${athaya.hobi}', // Menampilkan hobi developer.
                style: PlaneFonts(context).semiBoldQuicksand(size: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
