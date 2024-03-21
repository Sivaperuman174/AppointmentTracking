import 'package:appointmenttrackerapp/model/employee.dart';
import 'package:appointmenttrackerapp/view/employee_add_page.dart';
import 'package:appointmenttrackerapp/view/employee_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class EmployeeDetailPage extends StatelessWidget {
//   const EmployeeDetailPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Text('this is employee detail page');
//   }
// }

class EmployeeDetailPage extends StatefulWidget {
  const EmployeeDetailPage({Key? key}) : super(key: key);

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  final List<Employee> employees = [
    Employee(
        id: 1,
        companyId: 1,
        name: 'Sivaperuman',
        qualification: 'B.Tech',
        dateOfBirth: DateTime(1990, 04, 17),
        roleId: 1,
        address: 'Main Street',
        contactNo: '9789606982',
        dateOfJoin: DateTime(2022, 10, 17),
        deleted: 0,
        emailId: 'sivaperuman@gmail.com'),
  ];

  void addEmployeeDetail(Employee newEmployee) {
    setState(() {
      employees.add(newEmployee);
    });
  }

  void updateEmployeeDetail() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    child: ListTile(
                      title: Text(employees[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Qualification: ${employees[index].qualification}'),
                          Text(
                              'Date of Birth: ${DateFormat('dd-MM-yyyy').format(employees[index].dateOfBirth)}'),
                          Text(
                              'Date of Join: ${DateFormat('dd-MM-yyyy').format(employees[index].dateOfJoin)}'),
                          Text('Role: ${employees[index].roleId}'),
                          Text('Address: ${employees[index].address}'),
                          Text('Contact No: ${employees[index].contactNo}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeEditPage(
                                  employeeDetail: employees[index],
                                  updateEmployeeHandler: updateEmployeeDetail),
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
              builder: (context) => EmployeeAddPage(
                addEmployeeHandler: addEmployeeDetail,
                totalEmployeeCount: employees.length,
              ),
            ),
          );
        },
        tooltip: 'Create new Employee',
        child: const Icon(Icons.add),
      ),
    );
  }
}
