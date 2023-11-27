import 'package:flutter/material.dart';
import 'package:tradeswift/Screens/VariableScreen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.item}) : super(key: key);

  final Map<String, dynamic> item;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Map<String, dynamic> item;

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  Color _getTextColor(String color) {
    if (color == 'green') {
      return Colors.green;
    } else if (color == 'red') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['name'],
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              item['tag'],
              style: TextStyle(
                color: _getTextColor(item['color']),
              ),
            ),
            const SizedBox(height: 16),
            for (var index = 0; index < item['criteria'].length; index++) ...[
              const SizedBox(height: 10),

              // Check if the criteria text contains a variable starting with "$"
              if (item['criteria'][index]['type'] == 'variable' &&
                  item['criteria'][index]['text'].contains('\$')) ...[
                // Displaying the criteria text
                Text(item['criteria'][index]['text'],
                    style: const TextStyle(fontSize: 15)),

                for (var entry
                    in item['criteria'][index]['variable'].entries) ...[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VariableScreen(variableDetails: entry.value),
                        ),
                      );
                    },
                    child: Text(
                      entry.key,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ] else ...[
                Text(item['criteria'][index]['text'],
                    style: const TextStyle(fontSize: 15)),
              ],

              if (index < item['criteria'].length - 1)
                if (item['criteria'].length > 1 &&
                    index < item['criteria'].length - 1)
                  const Text('and'),
            ],
          ],
        ),
      ),
    );
  }
}
