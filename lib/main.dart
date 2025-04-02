import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final TextEditingController itemController = TextEditingController();

  void addItem(String item) async {
    await FirebaseFirestore.instance.collection('Items').add({'name': item});
    itemController.clear();
  }

  void updateItem(String id, String newItem) async {
    await FirebaseFirestore.instance.collection('Items').doc(id).update({'name': newItem});
  }

  void deleteItem(String id) async {
    await FirebaseFirestore.instance.collection('Items').doc(id).delete();
  }

  void updateDialog(String id, String currentItem) {
    final TextEditingController updateController = TextEditingController();
    updateController.text = currentItem;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: TextField(
            controller: updateController,
            decoration: InputDecoration(
              labelText: 'Enter New Item',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                updateItem(id, updateController.text);
                Navigator.of(context).pop();
              },
              child: Text('Update'),
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
                      labelText: 'Enter Item name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    addItem(itemController.text);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Items').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final items = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final id = item.id;
                    final name = item['name'];
                    return ListTile(
                      title: Text(name),
                      onTap: () => updateDialog(id, name),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteItem(id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}