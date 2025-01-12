import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _containerColor = Color.fromRGBO(210, 140, 251, 1);
  int _selectedIndex = 0;

  void _changeColor() {
    setState(() {
      _containerColor = _containerColor == Color.fromRGBO(210, 140, 251, 1)
          ? Colors.blue
          : Color.fromRGBO(210, 140, 251, 1);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color randomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Hello World!'),
        ),
        body: _selectedIndex == 0
            ? Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: _containerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.apple, size: 50, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Container(
                    color: randomColor(),
                    width: 500,
                    height: 500,
                  );
                },
              ),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                onPressed: _changeColor,
                child: const Icon(Icons.add),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Leaderboard"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
        drawer: Drawer(
          child: const Text("hiyaa"),
        ),
      ),
    );
  }
}
