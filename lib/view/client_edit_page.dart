import 'package:flutter/material.dart';

class ClientEditPage extends StatefulWidget {
  final String? initialName;
  final String? initialEmail;
  final String? initialPosition;

  ClientEditPage({this.initialName, this.initialEmail, this.initialPosition});

  @override
  _ClientEditPageState createState() => _ClientEditPageState();
}

class _ClientEditPageState extends State<ClientEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _positionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _emailController = TextEditingController(text: widget.initialEmail ?? '');
    _positionController =
        TextEditingController(text: widget.initialPosition ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  // Function to save employee details
  void _saveEmployeeDetails() {
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
        title: Text('Employee Details'),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveEmployeeDetails,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
