// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:yudisium_pnl/navigasi.dart';

import 'history.dart';
import 'informasi.dart';
import 'profil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // logo pnl
                Image.asset(
                  'assets/pnl.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 10.0),
                // text
                const Text(
                  'PENDAFTARAN YUDISIUM 2023',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                // gelombang 1
                ElevatedButton(
                  onPressed: () {
                    navToYudisGelSatuPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'Gelombang 1',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10.0),
                // gelombang 2
                ElevatedButton(
                  onPressed: () {
                    navToYudisGelDuaPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD600),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'Gelombang 2',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const HistoryPage(),
          const InformasiPage(),
          const ProfilPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
