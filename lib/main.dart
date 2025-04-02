import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InventoryMgmt(),
    );
  }
}

class InventoryMgmt extends StatefulWidget {
  const InventoryMgmt({super.key});

  @override
  State<InventoryMgmt> createState() => _InventoryMgmtState();
}

class _InventoryMgmtState extends State<InventoryMgmt> {
  final List<String> inventoryItems = [
    'Item 1',
    'Item 2',
    'Item 3'
  ];
  final TextEditingController itemController = TextEditingController();

  void addItem(String item) {
    setState(() {
      inventoryItems.add(item);
    });
    itemController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Management'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: itemController,
                    decoration: InputDecoration(
                      labelText: 'Enter item name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (itemController.text.isNotEmpty) {
                      addItem(itemController.text);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: inventoryItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(inventoryItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}