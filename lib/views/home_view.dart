import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bgMonster.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Expanded(
              child: ListView(),
            ),
            Container(
              height: 100,
              color: Colors.amber,
              child: Row(children: [
                Expanded(
                  child: TextField(),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
