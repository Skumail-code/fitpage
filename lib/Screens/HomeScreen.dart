import 'package:flutter/material.dart';
import 'package:tradeswift/Providers/data.dart';
import 'package:tradeswift/Screens/DetailsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> stockList = [];
  final Data _data = Data();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<Map<String, dynamic>> stocks = await _data.fetchData();

      setState(() {
        stockList = stocks;
      });
    } catch (error) {
      print('Failed to load data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: stockList.length,
              itemBuilder: (context, index) {
                Color textColor = Colors.black;
                final item = stockList[index];
                if (item['color'] == 'green') {
                  textColor = Colors.green;
                } else if (item['color'] == 'red') {
                  textColor = Colors.red;
                }
                return Column(
                  children: [
                    ListTile(
                      title: Text(item['name'] ?? ''),
                      subtitle: Text(
                        item['tag'] ?? '',
                        style: TextStyle(color: textColor),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(item: item)),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
