import 'package:appointmenttrackerapp/model/client.dart';
import 'package:appointmenttrackerapp/view/client_add_page.dart';
import 'package:appointmenttrackerapp/view/client_edit_page.dart';
import 'package:flutter/material.dart';

class ClientDetailPage extends StatefulWidget {
  const ClientDetailPage({Key? key}) : super(key: key);

  @override
  State<ClientDetailPage> createState() => _ClientDetailPageState();
}

class _ClientDetailPageState extends State<ClientDetailPage> {
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

  void addClientDetail(Client newClient) {
    setState(() {
      clients.add(newClient);
    });
  }

  void updateClientDetail() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Details'),
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
                          Text(
                              'Primary Contact No: ${clients[index].primaryContactNo}'),
                          Text(
                              'Secondary Contact: ${clients[index].secondaryContactName}'),
                          Text(
                              'Secondary Contact No: ${clients[index].secondaryContactNo}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientEditPage(
                                  clientDetail: clients[index],
                                  updateClientHandler: updateClientDetail),
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
            MaterialPageRoute(
                builder: (context) => ClientAddPage(
                      addClientHandler: addClientDetail,
                      totalClientCount: clients.length,
                    )),
          );
        },
        tooltip: 'Create new client',
        child: const Icon(Icons.add),
      ),
    );
  }
}
