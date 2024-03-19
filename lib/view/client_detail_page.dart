import 'package:appointmenttrackerapp/model/client.dart';
import 'package:appointmenttrackerapp/view/client_add_page.dart';
import 'package:appointmenttrackerapp/view/client_edit_page.dart';
import 'package:flutter/material.dart';

class ClientDetailPage extends StatelessWidget {
  ClientDetailPage({Key? key}) : super(key: key);

  final List<Client> clients = [
    Client(
        id: 1,
        name: 'Pressform',
        companyId: 1,
        address: 'main street',
        primaryContactName: 'mari',
        primaryContactNo: '123',
        secondaryContactName: 'siva',
        secondaryContactNo: '879',
        location: '123.00, 32.45',
        deleted: 0),
    Client(
        id: 2,
        name: 'Client CNC',
        companyId: 1,
        address: 'south street',
        primaryContactName: 'muthu',
        primaryContactNo: '432',
        secondaryContactName: 'guru',
        secondaryContactNo: '145',
        location: '156.00, 38.45',
        deleted: 0)
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    child: ListTile(
                      title: Text(clients[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Address: ${clients[index].address}'),
                          Text(
                              'Primary Contact: ${clients[index].primaryContactName}'),
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
