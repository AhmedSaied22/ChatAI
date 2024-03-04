import 'package:chat_ai/constants.dart';
import 'package:chat_ai/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //       'assets/images/bgMonster.png',
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Column(
            children: [
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Eternal Sunshine',
                        style: TextStyle(fontSize: 24, fontFamily: 'Carter One')),
                    Icon(
                      Icons.image_search,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(),
              ),
              Container(
                child: const Row(children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: CustomTextField(
                        hintText: 'Text',
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 32,
                    child: Center(
                      child: Icon(FontAwesomeIcons.solidPaperPlane),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
