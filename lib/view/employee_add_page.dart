import 'package:appointmenttrackerapp/model/employee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Define a typedef for the callback function signature
typedef AddEmployeeCallback = void Function(Employee employee);

class EmployeeAddPage extends StatefulWidget {
  final AddEmployeeCallback addEmployeeHandler;
  final int totalEmployeeCount;
  const EmployeeAddPage(
      {super.key,
      required this.addEmployeeHandler,
      required this.totalEmployeeCount});

  @override
  _EmployeeAddPageState createState() => _EmployeeAddPageState();
}

class _EmployeeAddPageState extends State<EmployeeAddPage> {
  // Define variables to hold employee details
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _roleIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _dateOfJoinController = TextEditingController();
  final TextEditingController _dateOfReleaveController =
      TextEditingController();

  DateTime? _selectedDateOfBirth;
  DateTime? _selectedDateOfJoin;
  DateTime? _selectedDateOfReleave;

  // Function to save employee details
  void _saveEmployeeDetails() {
    // Implement saving logic here
    // For simplicity, let's just print the details for now

    Employee newEmployee = Employee(
        id: widget.totalEmployeeCount + 1,
        name: _nameController.text,
        companyId: 1,
        qualification: _qualificationController.text,
        dateOfBirth: _selectedDateOfBirth!,
        emailId: _emailIdController.text,
        roleId: int.parse(_roleIdController.text),
        contactNo: _contactNoController.text,
        address: _addressController.text,
        dateOfJoin: _selectedDateOfJoin!,
        dateOfReleave: _selectedDateOfReleave,
        deleted: 0);

    print(widget.totalEmployeeCount + 1);

    widget.addEmployeeHandler(newEmployee);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new Employee'),
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
                controller: _emailIdController,
                decoration: const InputDecoration(labelText: 'Email ID'),
              ),
              TextField(
                controller: _roleIdController,
                decoration: const InputDecoration(labelText: 'Rold Id'),
              ),
              TextField(
                controller: _contactNoController,
                decoration: const InputDecoration(labelText: 'Contact No'),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
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
                    child: const Text('Add'),
                  ),
                  const SizedBox(width: 20),
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
