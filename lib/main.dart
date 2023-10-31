import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List item = [];
  TextEditingController itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Column(
              children: [
                TextField(
                  controller: itemController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter Name",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    item.add(itemController.text);
                    itemController.clear();
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "${item[index]}",
                            style: TextStyle(fontSize: 25),
                          ),
                          Spacer(),
                          InkWell(
                            child: Icon(Icons.close),
                            onTap: () {
                              item.removeAt(index);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
