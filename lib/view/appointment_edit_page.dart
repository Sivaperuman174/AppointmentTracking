import 'package:appointmenttrackerapp/model/appointment.dart';
import 'package:flutter/material.dart';

// class AppointmentEditPage extends StatefulWidget {
//   const AppointmentEditPage({Key? key}) : super(key: key);

//   @override
//   State<AppointmentEditPage> createState() => _AppointmentEditPageState();
// }

// class _AppointmentEditPageState extends State<AppointmentEditPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// TextFormField(
//   readOnly: true,
//   controller: _dateController,
//   decoration: InputDecoration(
//     labelText: 'Select Date',
//     suffixIcon: IconButton(
//       icon: Icon(Icons.calendar_today),
//       onPressed: () async {
//         // Show date picker and update selected date
//         final DateTime? pickedDate = await showDatePicker(
//           context: context,
//           initialDate: _selectedDate ?? DateTime.now(),
//           firstDate: DateTime(1900),
//           lastDate: DateTime.now(),
//         );

//         if (pickedDate != null && pickedDate != _selectedDate) {
//           setState(() {
//             _selectedDate = pickedDate;
//             _dateController.text = pickedDate.toString(); // Update controller value
//           });
//         }
//       },
//     ),
//   ),
// ),

// class AppointmentEditPage extends StatefulWidget {
//   final Appointment appointmentDetail;
//   void Function() updateAppointmentHandler;

//   AppointmentEditPage(
//       {super.key,
//       required this.appointmentDetail,
//       required this.updateAppointmentHandler});

//   @override
//   State<AppointmentEditPage> createState() => _AppointmentEditPageState();
// }

// class _AppointmentEditPageState extends State<AppointmentEditPage> {
//   late TextEditingController _descriptionController;
//   late TextEditingController _addressController;
//   late TextEditingController _primaryContactController;
//   late TextEditingController _primaryContactNoController;
//   late TextEditingController _secondaryContactController;
//   late TextEditingController _secondaryContactNoController;
//   late TextEditingController _locationController;

//   @override
//   void initState() {
//     super.initState();
//     _descriptionController =
//         TextEditingController(text: widget.appointmentDetail.name ?? '');
//     _addressController =
//         TextEditingController(text: widget.appointmentDetail.address ?? '');
//     _primaryContactController = TextEditingController(
//         text: widget.appointmentDetail.primaryContactName ?? '');
//     _primaryContactNoController =
//         TextEditingController(text: widget.appointmentDetail.primaryContactNo ?? '');
//     _secondaryContactController = TextEditingController(
//         text: widget.appointmentDetail.secondaryContactName ?? '');
//     _secondaryContactNoController = TextEditingController(
//         text: widget.appointmentDetail.secondaryContactNo ?? '');
//     _locationController =
//         TextEditingController(text: widget.appointmentDetail.location ?? '');
//   }

//   @override
//   void dispose() {
//     _descriptionController.dispose();
//     _addressController.dispose();
//     _primaryContactController.dispose();
//     _primaryContactNoController.dispose();
//     _secondaryContactController.dispose();
//     _secondaryContactNoController.dispose();
//     _locationController.dispose();
//     super.dispose();
//   }

//   // Function to save employee details
//   void _saveEmployeeDetails() {
//     // Implement saving logic here
//     // For simplicity, let's just print the details for now
//     print('Name: ${_descriptionController.text}');
//     print('Email: ${_addressController.text}');
//     print('Primary contact: ${_primaryContactController.text}');
//     print('Primary contact NO: ${_primaryContactNoController.text}');
//     print('Position: ${_secondaryContactController.text}');
//     print('Position: ${_secondaryContactNoController.text}');
//     print('Position: ${_locationController.text}');

//     widget.appointmentDetail.name = _descriptionController.text;
//     widget.appointmentDetail.address = _addressController.text;
//     widget.appointmentDetail.primaryContactName = _primaryContactController.text;
//     widget.appointmentDetail.primaryContactNo = _primaryContactNoController.text;
//     widget.appointmentDetail.secondaryContactName = _secondaryContactController.text;
//     widget.appointmentDetail.secondaryContactNo = _secondaryContactNoController.text;
//     widget.appointmentDetail.location = _locationController.text;
//     widget.updateAppointmentHandler();
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Client details edit'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _addressController,
//               decoration: const InputDecoration(labelText: 'Address'),
//             ),
//             TextField(
//               controller: _primaryContactController,
//               decoration: const InputDecoration(labelText: 'Primary Contact'),
//             ),
//             TextField(
//               controller: _primaryContactNoController,
//               decoration:
//                   const InputDecoration(labelText: 'Primary Contact No'),
//             ),
//             TextField(
//               controller: _secondaryContactController,
//               decoration: const InputDecoration(labelText: 'Secondary Contact'),
//             ),
//             TextField(
//               controller: _secondaryContactNoController,
//               decoration: const InputDecoration(labelText: 'Secondary Contact'),
//             ),
//             TextField(
//               controller: _locationController,
//               decoration: const InputDecoration(labelText: 'Location'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveEmployeeDetails,
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
