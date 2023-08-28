import 'package:flutter/material.dart';
import 'theme_changer/model_theme.dart';
import 'package:provider/provider.dart';

import 'machine.dart';
import 'home_page.dart';
import 'info_map.dart';

void main() {
  final Map<String, List<String>> machineCodes = infoMap();
  final List<bool> pdfBoolList = isPdfList();
  runApp(MyApp(machineCodes: machineCodes, pdfBoolList: pdfBoolList));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, required this.machineCodes, required this.pdfBoolList});

  final Map<String, List<String>> machineCodes;
  final List<bool> pdfBoolList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp(
              title: "Project Easy",
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.isDark
                  ? ThemeData(brightness: Brightness.dark)
                  : ThemeData(brightness: Brightness.light),
              home: MyHomePage(
                  machines: List.generate(
                      machineCodes.length,
                      (index) => Machine(
                          machineCodes.keys.elementAt(index),
                          machineCodes[machineCodes.keys.elementAt(index)]!,
                          pdfBoolList[index]))));
        },
      ),
    );
  }
}
