import 'package:appointmenttrackerapp/main.dart';
import 'package:appointmenttrackerapp/view/client_add_page.dart';
import 'package:appointmenttrackerapp/view/client_edit_page.dart';
import 'package:flutter/material.dart';

class ClientDetailPage extends StatelessWidget {
  ClientDetailPage({Key? key}) : super(key: key);

  final List<Client> clients = [
    Client(
      name: 'Prashant',
      appointments: [
        Appointment(
          appointmentName: 'Meeting',
          appointmentDate: DateTime(2024, 3, 20),
          appointmentCreatedDate: DateTime(2024, 3, 18),
        ),
        Appointment(
          appointmentName: 'Presentation',
          appointmentDate: DateTime(2024, 3, 25),
          appointmentCreatedDate: DateTime(2024, 3, 18),
        ),
      ],
    ),
    Client(
      name: 'Sivaparman',
      appointments: [
        Appointment(
          appointmentName: 'Meeting',
          appointmentDate: DateTime(2024, 3, 20),
          appointmentCreatedDate: DateTime(2024, 3, 18),
        ),
        Appointment(
          appointmentName: 'Presentation',
          appointmentDate: DateTime(2024, 3, 25),
          appointmentCreatedDate: DateTime(2024, 3, 18),
        ),
        Appointment(
          appointmentName: 'Meeting',
          appointmentDate: DateTime(2024, 3, 20),
          appointmentCreatedDate: DateTime(2024, 3, 18),
        ),
        Appointment(
          appointmentName: 'Presentation',
          appointmentDate: DateTime(2024, 3, 25),
          appointmentCreatedDate: DateTime(2024, 3, 18),
        ),
      ],
    ),
    // Add more clients as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Appointments'),
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Center(
                child: Column(
                  children: clients[index]
                      .appointments
                      .map((appointment) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Card(
                              child: ListTile(
                                title: Text(appointment.appointmentName),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        'Date: ${appointment.appointmentDate}'),
                                    Text(
                                        'Created Date: ${appointment.appointmentCreatedDate}'),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ClientEditPage(
                                          initialName: 'siva',
                                          initialEmail: 'siva@gmail.com',
                                          initialPosition: 'senior',
                                          //appointment: appointment
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ClientAddPage()),
          );
        },
        tooltip: 'Create new client',
        child: const Icon(Icons.add),
      ),
    );
  }
}
