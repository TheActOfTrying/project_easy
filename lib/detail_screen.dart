import 'package:flutter/material.dart';

import 'machine.dart';

class DetailScreen extends StatefulWidget {
  final Machine machine;

  const DetailScreen({
    Key? key,
    required this.machine,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _searchBoolean = false;
  List<int> _searchIndexList = [];

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        s = s.toLowerCase();
        setState(() {
          _searchIndexList = [];
          for (int i = 0; i < widget.machine.errorCodes.length; i++) {
            if (widget.machine.errorCodes[i].toLowerCase().contains(s)) {
              _searchIndexList.add(i);
            }
          }
        });
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          )),
    );
  }

  Widget _searchListView() {
    return ListView.builder(
        itemCount: _searchIndexList.length, //edit
        itemBuilder: (context, index) {
          index = _searchIndexList[index]; //add
          return Card(
              child: ListTile(title: Text(widget.machine.errorCodes[index])));
        });
  }

  Widget _defaultListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.machine.errorCodes.length,
      itemBuilder: (BuildContext context, int i) {
        return Column(
          children: [
            ListTile(
              title: Text(
                widget.machine.errorCodes[i],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: !_searchBoolean
                ? Text(widget.machine.machineType)
                : _searchTextField(),
            backgroundColor: Colors.purple,
            actions: !_searchBoolean
                ? [
                    IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = true;
                            _searchIndexList = [];
                          });
                        })
                  ]
                : [
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = false;
                        });
                      },
                    )
                  ]),
        body: !_searchBoolean ? _defaultListView() : _searchListView());
  }
}