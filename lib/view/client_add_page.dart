import 'package:appointmenttrackerapp/model/client.dart';
import 'package:flutter/material.dart';

// Define a typedef for the callback function signature
typedef AddClientCallback = void Function(Client client);

class ClientAddPage extends StatefulWidget {
  final AddClientCallback addClientHandler;
  final int totalClientCount;
  const ClientAddPage(
      {super.key,
      required this.addClientHandler,
      required this.totalClientCount});

  @override
  _ClientAddPageState createState() => _ClientAddPageState();
}

class _ClientAddPageState extends State<ClientAddPage> {
  // Define variables to hold employee details
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _primaryContactController =
      TextEditingController();
  final TextEditingController _primaryContactNoController =
      TextEditingController();
  final TextEditingController _secondaryContactController =
      TextEditingController();
  final TextEditingController _secondaryContactNoController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Function to save employee details
  void _saveClientDetails() {
    // Implement saving logic here
    // For simplicity, let's just print the details for now
    Client newClient = Client(
        id: widget.totalClientCount + 1,
        name: _nameController.text,
        companyId: 1,
        address: _addressController.text,
        primaryContactName: _primaryContactController.text,
        primaryContactNo: _primaryContactNoController.text,
        secondaryContactName: _secondaryContactController.text,
        secondaryContactNo: _secondaryContactNoController.text,
        location: _locationController.text,
        deleted: 0);

    print(widget.totalClientCount + 1);

    widget.addClientHandler(newClient);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new client'),
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
              decoration:
                  const InputDecoration(labelText: 'Secondary Contact No'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
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
