import 'package:appointmenttrackerapp/model/appointment.dart';
import 'package:appointmenttrackerapp/model/client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentDetailPage extends StatefulWidget {
  const AppointmentDetailPage({Key? key}) : super(key: key);

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  Client? _selectedClient;
  final List<Client> clients = [
    Client(
        id: 1,
        name: "Pressform",
        companyId: 1,
        address: "main road",
        primaryContactName: "suresh",
        primaryContactNo: "44554433",
        secondaryContactName: "kumar",
        secondaryContactNo: '9988777',
        appointments: [
          Appointment(
              id: 1,
              clientId: 2,
              requestId: 123,
              allocatedTo: 32,
              createdBy: 33,
              alternateAllocateTo: 45,
              description: 'Testing new appointment 1',
              bookedOn: DateTime.now(),
              actualDate: DateTime(2024, 10, 13),
              alternateDate: DateTime(2024, 10, 25),
              status: 'Created',
              deleted: 0)
        ],
        location: '123.45,67.32',
        deleted: 0),
    Client(
        id: 2,
        name: "Sivanatha moulds",
        companyId: 1,
        address: "main road",
        primaryContactName: "suresh",
        primaryContactNo: "44554433",
        secondaryContactName: "kumar",
        secondaryContactNo: '9988777',
        appointments: [
          Appointment(
              id: 2,
              clientId: 3,
              requestId: 1234,
              allocatedTo: 321,
              createdBy: 332,
              alternateAllocateTo: 453,
              description: 'Testing new appointment 20',
              bookedOn: DateTime.now(),
              actualDate: DateTime(2024, 10, 15),
              alternateDate: DateTime(2024, 10, 29),
              status: 'Created',
              deleted: 0)
        ],
        location: '123.45,67.32',
        deleted: 0),
  ];
  final List<Appointment> appointments = [
    Appointment(
        id: 1,
        clientId: 2,
        requestId: 123,
        allocatedTo: 32,
        createdBy: 33,
        alternateAllocateTo: 45,
        description: 'Testing new appointment 1',
        bookedOn: DateTime.now(),
        actualDate: DateTime(2024, 10, 13),
        alternateDate: DateTime(2024, 10, 25),
        status: 'Created',
        deleted: 0),
    Appointment(
        id: 2,
        clientId: 3,
        requestId: 1234,
        allocatedTo: 321,
        createdBy: 332,
        alternateAllocateTo: 453,
        description: 'Testing new appointment 20',
        bookedOn: DateTime.now(),
        actualDate: DateTime(2024, 10, 15),
        alternateDate: DateTime(2024, 10, 29),
        status: 'Created',
        deleted: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Text(
                'Select Client :',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              ),
              DropdownButton<Client>(
                value: _selectedClient,
                items: clients.map((Client item) {
                  return DropdownMenuItem<Client>(
                    value: item,
                    child: Text(item.name),
                  );
                }).toList(),
                onChanged: (Client? selectedItem) {
                  setState(() {
                    _selectedClient = selectedItem;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          _selectedClient != null
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _selectedClient!.appointments?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Card(
                                child: ListTile(
                                  title: Text(_selectedClient!
                                      .appointments![index].description),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          'Request Id: ${_selectedClient!.appointments![index].requestId}'),
                                      Text(
                                          'Allocate To: ${_selectedClient!.appointments![index].allocatedTo}'),
                                      Text(
                                          'Alternate Allocate To: ${_selectedClient!.appointments![index].alternateAllocateTo}'),
                                      Text(
                                          'Actual Date: ${DateFormat('dd-MM-yyyy').format(_selectedClient!.appointments![index].actualDate)}'),
                                      Text(
                                          'Alternate Date: ${DateFormat('dd-MM-yyyy').format(_selectedClient!.appointments![index].alternateDate)}'),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => ClientEditPage(
                                      //       initialName: 'siva',
                                      //       initialEmail: 'siva@gmail.com',
                                      //       initialPosition: 'senior',
                                      //       //appointment: appointment
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : const Text('No appointments to display'),
        ],
      ),
    );
  }
}
