import 'package:flutter/material.dart';
import 'theme_changer/model_theme.dart';
import 'machine.dart';
import 'detail_screen.dart';
import 'detail_screen_pdf.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.machines});
  final List<Machine> machines;

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  //const MyHomePage({super.key, });
  //final List<Machine> machines;
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Project Easy"),
            actions: [
              IconButton(
                icon: Icon(themeNotifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
              )
            ],
          ),
          body: ListView.builder(
              itemCount: widget.machines.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                        title: Text(
                          widget.machines[index].machineType,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          widget.machines[index].isPdf
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreenPdf(
                                        machine: widget.machines[index]),
                                  ))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        machine: widget.machines[index]),
                                  ));
                        }),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                );
              }),
          bottomNavigationBar: const BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                'Version 1.0.9 Pdfs_Web',
                style: TextStyle(color: Colors.grey),
              )
            ]),
          ),
        );
      },
    );
  }
}
