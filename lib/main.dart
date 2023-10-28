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
  String newItem = "";
  TextEditingController itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
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
                  newItem = itemController.text;
                  item.add(newItem);
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
                        InkWell(
                          onTap: () {
                            item[index] = itemController.text;
                            setState(() {});
                          },
                          child: Text(
                            "${item[index]}",
                            style: TextStyle(fontSize: 25),
                          ),
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
    );
  }
}
