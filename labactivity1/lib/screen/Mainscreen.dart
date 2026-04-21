import 'package:flutter/material.dart';

void main() {
  runApp(const Mainscreen());
}

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Activity Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;

  
  double result = 0;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    result = 0; 
  }

  
  void addNumbers() {
    double n1 = double.tryParse(num1Controller.text) ?? 0;
    double n2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = n1 + n2;
    });
  }

  // Subtraction function
  void subtractNumbers() {
    double n1 = double.tryParse(num1Controller.text) ?? 0;
    double n2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = n1 - n2;
    });
  }

  // Multiplication function
  void multiplyNumbers() {
    double n1 = double.tryParse(num1Controller.text) ?? 0;
    double n2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      result = n1 * n2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input fields
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter first number'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter second number'),
            ),
            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: addNumbers, child: const Text('Add')),
                ElevatedButton(onPressed: subtractNumbers, child: const Text('Subtract')),
                ElevatedButton(onPressed: multiplyNumbers, child: const Text('Multiply')),
              ],
            ),
            const SizedBox(height: 20),

            // Result display
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
