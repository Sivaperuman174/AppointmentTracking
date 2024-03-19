import 'package:flutter/material.dart';

class ClientAddPage extends StatefulWidget {
  const ClientAddPage({super.key});

  @override
  _ClientAddPageState createState() => _ClientAddPageState();
}

class _ClientAddPageState extends State<ClientAddPage> {
  // Define variables to hold employee details
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _positionController = TextEditingController();

  // Function to save employee details
  void _saveClientDetails() {
    // Implement saving logic here
    // For simplicity, let's just print the details for now
    print('Name: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print('Position: ${_positionController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveClientDetails,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
