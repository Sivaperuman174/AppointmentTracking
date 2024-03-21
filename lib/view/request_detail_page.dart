import 'package:appointmenttrackerapp/model/appointment.dart';
import 'package:appointmenttrackerapp/model/client.dart';
import 'package:appointmenttrackerapp/model/request.dart';
import 'package:appointmenttrackerapp/view/appointment_create_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RequestDetailPage extends StatefulWidget {
  const RequestDetailPage({Key? key}) : super(key: key);

  @override
  State<RequestDetailPage> createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage> {
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
      appointments: [],
      requests: [
        Request(
            id: 1,
            clientId: 1,
            requestType: 'New',
            description: 'New product required',
            requestedOn: DateTime.now(),
            status: 'Created',
            deleted: 0),
        Request(
            id: 2,
            clientId: 1,
            requestType: 'Issue',
            description: 'Issue in existing product',
            requestedOn: DateTime.now(),
            status: 'Created',
            deleted: 0),
      ],
      location: '12.34,19.87',
      deleted: 0,
    ),
    Client(
      id: 2,
      name: "chennai Cnc",
      companyId: 1,
      address: "Cross road",
      primaryContactName: "mani",
      primaryContactNo: "5533222",
      secondaryContactName: "bala",
      secondaryContactNo: '00998877',
      appointments: [],
      requests: [
        Request(
            id: 1,
            clientId: 1,
            requestType: 'Issue',
            description: 'issue in new product',
            requestedOn: DateTime.now(),
            status: 'Created',
            deleted: 0),
        Request(
            id: 2,
            clientId: 1,
            requestType: 'Issue',
            description: 'Issue in existing product',
            requestedOn: DateTime.now(),
            status: 'AppointmentCreated',
            deleted: 0),
      ],
      location: '12.34,19.87',
      deleted: 0,
    ),
  ];

  void addAppointment(Appointment newAppointment) {
    setState(() {
      _selectedClient!.appointments?.add(newAppointment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests detail'),
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
                    itemCount: _selectedClient!.requests?.length,
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
                                      .requests![index].description),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          'Request Id: ${_selectedClient!.requests![index].id}'),
                                      Text(
                                          'Request type: ${_selectedClient!.requests![index].requestType}'),
                                      Text(
                                          'Description: ${_selectedClient!.requests![index].description}'),
                                      Text(
                                          'Status: ${_selectedClient!.requests![index].status}'),
                                      Text(
                                          'Requested On: ${DateFormat('dd-MM-yyyy').format(_selectedClient!.requests![index].requestedOn)}'),
                                      // Text(
                                      //     'Completed On: ${DateFormat('dd-MM-yyyy').format(_selectedClient!.requests![index].completedOn!)}'),
                                    ],
                                  ),
                                  trailing: _selectedClient!
                                              .requests![index].status !=
                                          "AppointmentCreated"
                                      ? IconButton(
                                          icon: const Icon(Icons.create),
                                          tooltip: 'Create Appointment',
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AppointmentCreatePage(
                                                        requestDetail:
                                                            _selectedClient!
                                                                    .requests![
                                                                index],
                                                        addAppointmentHandler:
                                                            addAppointment,
                                                        totalAppointmentCount:
                                                            _selectedClient!
                                                                    .appointments
                                                                    ?.length ??
                                                                0),
                                              ),
                                            );
                                          },
                                        )
                                      : Text(''),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : const Text('No Request to display'),
        ],
      ),
    );
  }
}
