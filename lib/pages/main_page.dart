import 'package:flutter/material.dart';
import '../pages/profile_page.dart';
import '../utils/themes.dart';
import '../components/loading.dart';
import '../components/my_appbar.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; //New
  late bool _isLoading = false;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (_currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Stack(
      children: [
        Scaffold(
          appBar: myAppBar(context,
              title: 'Plane Calculator',
              automaticImplyLeading: false,
              action: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: PlaneColors.red,
                  ),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Future.delayed((const Duration(seconds: 2)), () {
                      setState(() {
                        _isLoading = false;
                      });
                    });
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                ),
              ]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex, //New
            type: BottomNavigationBarType.fixed,
            selectedItemColor: PlaneColors.primary,
            backgroundColor: Colors.white,
            elevation: 20,
            iconSize: 32,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: PlaneColors.grey,
            showSelectedLabels: true,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
          body: body(),
        ),
        LoadingScreen(loading: _isLoading)
      ],
    );
  }
}
