import 'package:appointmenttrackerapp/model/client.dart';
import 'package:flutter/material.dart';

class ClientEditPage extends StatefulWidget {
  final Client clientDetail;
  void Function() updateClientHandler;

  ClientEditPage(
      {super.key,
      required this.clientDetail,
      required this.updateClientHandler});

  @override
  _ClientEditPageState createState() => _ClientEditPageState();
}

class _ClientEditPageState extends State<ClientEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _primaryContactController;
  late TextEditingController _primaryContactNoController;
  late TextEditingController _secondaryContactController;
  late TextEditingController _secondaryContactNoController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.clientDetail.name ?? '');
    _addressController =
        TextEditingController(text: widget.clientDetail.address ?? '');
    _primaryContactController = TextEditingController(
        text: widget.clientDetail.primaryContactName ?? '');
    _primaryContactNoController =
        TextEditingController(text: widget.clientDetail.primaryContactNo ?? '');
    _secondaryContactController = TextEditingController(
        text: widget.clientDetail.secondaryContactName ?? '');
    _secondaryContactNoController = TextEditingController(
        text: widget.clientDetail.secondaryContactNo ?? '');
    _locationController =
        TextEditingController(text: widget.clientDetail.location ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _primaryContactController.dispose();
    _primaryContactNoController.dispose();
    _secondaryContactController.dispose();
    _secondaryContactNoController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  // Function to save employee details
  void _saveEmployeeDetails() {
    // Implement saving logic here
    // For simplicity, let's just print the details for now
    print('Name: ${_nameController.text}');
    print('Email: ${_addressController.text}');
    print('Primary contact: ${_primaryContactController.text}');
    print('Primary contact NO: ${_primaryContactNoController.text}');
    print('Position: ${_secondaryContactController.text}');
    print('Position: ${_secondaryContactNoController.text}');
    print('Position: ${_locationController.text}');

    widget.clientDetail.name = _nameController.text;
    widget.clientDetail.address = _addressController.text;
    widget.clientDetail.primaryContactName = _primaryContactController.text;
    widget.clientDetail.primaryContactNo = _primaryContactNoController.text;
    widget.clientDetail.secondaryContactName = _secondaryContactController.text;
    widget.clientDetail.secondaryContactNo = _secondaryContactNoController.text;
    widget.clientDetail.location = _locationController.text;
    widget.updateClientHandler();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client details edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _primaryContactController,
              decoration: const InputDecoration(labelText: 'Primary Contact'),
            ),
            TextField(
              controller: _primaryContactNoController,
              decoration:
                  const InputDecoration(labelText: 'Primary Contact No'),
            ),
            TextField(
              controller: _secondaryContactController,
              decoration: const InputDecoration(labelText: 'Secondary Contact'),
            ),
            TextField(
              controller: _secondaryContactNoController,
              decoration: const InputDecoration(labelText: 'Secondary Contact'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveEmployeeDetails,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
