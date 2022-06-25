import"package:flutter/material.dart";

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seettings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.black,
      body: const Text(
        '你妈妈',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}