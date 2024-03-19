import 'package:appointmenttrackerapp/view/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

// class Client {
//   final String name;
//   final List<Appointment> appointments;

//   Client({required this.name, required this.appointments});
// }

// class Appointment {
//   final String appointmentName;
//   final DateTime appointmentDate;
//   final DateTime appointmentCreatedDate;

//   Appointment({
//     required this.appointmentName,
//     required this.appointmentDate,
//     required this.appointmentCreatedDate,
//   });
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Client Appointments',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ClientPage(),
//     );
//   }
// }

// class EditAppointmentPage extends StatelessWidget {
//   final Appointment appointment;

//   const EditAppointmentPage({super.key, required this.appointment});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Appointment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Appointment Name: ${appointment.appointmentName}',
//               style: const TextStyle(fontSize: 18.0),
//             ),
//             const SizedBox(height: 20.0),
//             Text(
//               'Appointment Date: ${appointment.appointmentDate}',
//               style: const TextStyle(fontSize: 18.0),
//             ),
//             const SizedBox(height: 20.0),
//             Text(
//               'Created Date: ${appointment.appointmentCreatedDate}',
//               style: const TextStyle(fontSize: 18.0),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement edit functionality
//               },
//               child: const Text('Edit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
