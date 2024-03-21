import 'package:appointmenttrackerapp/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeEditPage extends StatefulWidget {
  final Employee employeeDetail;
  void Function() updateEmployeeHandler;

  EmployeeEditPage(
      {super.key,
      required this.employeeDetail,
      required this.updateEmployeeHandler});

  @override
  _EmployeeEditPageState createState() => _EmployeeEditPageState();
}

class _EmployeeEditPageState extends State<EmployeeEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _qualificationController;
  late TextEditingController _dateOfBirthController;
  late TextEditingController _emailController;
  late TextEditingController _roleController;
  late TextEditingController _contactNoController;
  late TextEditingController _dateOfJoinController;
  late TextEditingController _dateOfReleaveController;

  DateTime? _selectedDateOfBirth;
  DateTime? _selectedDateOfJoin;
  DateTime? _selectedDateOfReleave;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.employeeDetail.name ?? '');
    _addressController =
        TextEditingController(text: widget.employeeDetail.address ?? '');
    _qualificationController =
        TextEditingController(text: widget.employeeDetail.qualification ?? '');
    _dateOfBirthController = TextEditingController(
        text: DateFormat('dd-MM-yyyy')
                .format(widget.employeeDetail.dateOfBirth) ??
            '');
    _emailController =
        TextEditingController(text: widget.employeeDetail.emailId ?? '');
    _roleController = TextEditingController(
        text: widget.employeeDetail.roleId.toString() ?? '');
    _contactNoController =
        TextEditingController(text: widget.employeeDetail.contactNo ?? '');
    _dateOfJoinController = TextEditingController(
        text:
            DateFormat('dd-MM-yyyy').format(widget.employeeDetail.dateOfJoin) ??
                '');
    _dateOfReleaveController = TextEditingController(
        text: widget.employeeDetail.dateOfReleave != null
            ? DateFormat('dd-MM-yyyy')
                .format(widget.employeeDetail.dateOfReleave!)
            : '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _qualificationController.dispose();
    _dateOfBirthController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    _contactNoController.dispose();
    _dateOfJoinController.dispose();
    _dateOfReleaveController.dispose();
    super.dispose();
  }

  // Function to save employee details
  void _saveEmployeeDetails() {
    // Implement saving logic here
    // For simplicity, let's just print the details for now
    // print('Name: ${_nameController.text}');
    // print('Address: ${_addressController.text}');
    // print('Primary contact: ${_primaryContactController.text}');
    // print('Primary contact NO: ${_primaryContactNoController.text}');
    // print('Position: ${_secondaryContactController.text}');
    // print('Position: ${_secondaryContactNoController.text}');
    // print('Position: ${_locationController.text}');

    widget.employeeDetail.name = _nameController.text;
    widget.employeeDetail.address = _addressController.text;
    widget.employeeDetail.qualification = _qualificationController.text;
    if (_selectedDateOfBirth != null) {
      widget.employeeDetail.dateOfBirth = _selectedDateOfBirth!;
    }
    widget.employeeDetail.emailId = _emailController.text;
    widget.employeeDetail.roleId = int.parse(_roleController.text);
    widget.employeeDetail.contactNo = _contactNoController.text;
    if (_selectedDateOfJoin != null) {
      widget.employeeDetail.dateOfJoin = _selectedDateOfJoin!;
    }
    if (_selectedDateOfReleave != null) {
      widget.employeeDetail.dateOfReleave = _selectedDateOfReleave!;
    }
    widget.updateEmployeeHandler();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee details edit'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                controller: _qualificationController,
                decoration: const InputDecoration(labelText: 'Qualification'),
              ),
              TextFormField(
                readOnly: true,
                controller: _dateOfBirthController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      // Show date picker and update selected date
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDateOfBirth ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null &&
                          pickedDate != _selectedDateOfBirth) {
                        _selectedDateOfBirth = pickedDate;
                        _dateOfBirthController.text = DateFormat('dd-MM-yyyy')
                            .format(pickedDate); // Update controller value
                      }
                    },
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email Id'),
              ),
              TextField(
                controller: _roleController,
                decoration: const InputDecoration(labelText: 'Role'),
              ),
              TextField(
                controller: _contactNoController,
                decoration: const InputDecoration(labelText: 'Contact no'),
              ),
              TextFormField(
                readOnly: true,
                controller: _dateOfJoinController,
                decoration: InputDecoration(
                  labelText: 'Date of Join',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      // Show date picker and update selected date
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDateOfJoin ?? DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2050),
                      );

                      if (pickedDate != null &&
                          pickedDate != _selectedDateOfJoin) {
                        _selectedDateOfJoin = pickedDate;
                        _dateOfJoinController.text = DateFormat('dd-MM-yyyy')
                            .format(pickedDate); // Update controller value
                      }
                    },
                  ),
                ),
              ),
              TextFormField(
                readOnly: true,
                controller: _dateOfReleaveController,
                decoration: InputDecoration(
                  labelText: 'Date of Releave',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      // Show date picker and update selected date
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDateOfReleave ?? DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2050),
                      );

                      if (pickedDate != null &&
                          pickedDate != _selectedDateOfReleave) {
                        _selectedDateOfReleave = pickedDate;
                        _dateOfReleaveController.text = DateFormat('dd-MM-yyyy')
                            .format(pickedDate); // Update controller value
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _saveEmployeeDetails,
                    child: const Text('Update'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
