import 'package:flutter/material.dart';

import 'machine.dart';
import 'detail_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.machines});
  final List<Machine> machines;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Project Easy"), backgroundColor: Colors.purple),
      body: ListView.builder(
          itemCount: machines.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                    title: Text(
                      machines[index].machineType,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(machine: machines[index]),
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
            'Version 1.0.4',
            style: TextStyle(color: Colors.grey),
          )
        ]),
      ),
    );
  }
}