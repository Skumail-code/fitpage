import 'package:flutter/material.dart';

class VariableScreen extends StatefulWidget {
  final Map<String, dynamic> variableDetails;

  const VariableScreen({Key? key, required this.variableDetails})
      : super(key: key);

  @override
  State<VariableScreen> createState() => _VariableScreenState();
}

class _VariableScreenState extends State<VariableScreen> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display variable details based on the type
            if (widget.variableDetails['type'] == 'value') ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var value in widget.variableDetails['values'])
                    Text(
                      '$value',
                      style: const TextStyle(fontSize: 25),
                    ),
                ],
              )
            ] else if (widget.variableDetails['type'] == 'indicator') ...[
              Text(
                widget.variableDetails['study_type'].toUpperCase(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Set Parameter',
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  initialValue:
                      widget.variableDetails['default_value'].toString(),
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    labelText: 'Period',
                    labelStyle: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
