import 'package:appointmenttrackerapp/model/appointment.dart';
import 'package:appointmenttrackerapp/model/request.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef AddAppointmentHandler = void Function(Appointment newAppointment);

class AppointmentCreatePage extends StatefulWidget {
  final Request requestDetail;
  final AddAppointmentHandler addAppointmentHandler;
  final int totalAppointmentCount;

  const AppointmentCreatePage(
      {super.key,
      required this.requestDetail,
      required this.addAppointmentHandler,
      required this.totalAppointmentCount});

  @override
  State<AppointmentCreatePage> createState() => _AppointmentCreatePageState();
}

class _AppointmentCreatePageState extends State<AppointmentCreatePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _allocateToController = TextEditingController();
  final TextEditingController _alternateAllocateToController =
      TextEditingController();
  final TextEditingController _actualDateController = TextEditingController();
  final TextEditingController _alternateDateController =
      TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  DateTime? _selectedActualDate;
  DateTime? _selectedAlternateDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _allocateToController.dispose();
    _alternateAllocateToController.dispose();
    _actualDateController.dispose();
    _alternateDateController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  // Function to save employee details
  void _saveAppointmentDetails() {
    // Implement saving logic here
    Appointment newAppointment = Appointment(
        id: widget.totalAppointmentCount + 1,
        clientId: widget.requestDetail.clientId,
        requestId: widget.requestDetail.id,
        createdBy: 1,
        allocatedTo: int.parse(_allocateToController.text),
        alternateAllocateTo: int.parse(_alternateAllocateToController.text),
        description: _descriptionController.text,
        bookedOn: DateTime.now(),
        actualDate: _selectedActualDate!,
        alternateDate: _selectedAlternateDate!,
        status: "Created",
        deleted: 0);

    widget.requestDetail.status = "AppointmentCreated";
    widget.addAppointmentHandler(newAppointment);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment details edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _allocateToController,
              decoration: const InputDecoration(labelText: 'Allocate to'),
            ),
            TextField(
              controller: _alternateAllocateToController,
              decoration:
                  const InputDecoration(labelText: 'Alternate allocate to'),
            ),
            TextFormField(
              readOnly: true,
              controller: _actualDateController,
              decoration: InputDecoration(
                labelText: 'Actual Date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    // Show date picker and update selected date
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedActualDate ?? DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2050),
                    );

                    if (pickedDate != null &&
                        pickedDate != _selectedActualDate) {
                      _selectedActualDate = pickedDate;
                      _actualDateController.text = DateFormat('dd-MM-yyyy')
                          .format(pickedDate); // Update controller value
                    }
                  },
                ),
              ),
            ),
            TextFormField(
              readOnly: true,
              controller: _alternateDateController,
              decoration: InputDecoration(
                labelText: 'Alternate Date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    // Show date picker and update selected date
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedAlternateDate ?? DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2050),
                    );

                    if (pickedDate != null &&
                        pickedDate != _selectedAlternateDate) {
                      _selectedAlternateDate = pickedDate;
                      _alternateDateController.text = DateFormat('dd-MM-yyyy')
                          .format(pickedDate); // Update controller value
                    }
                  },
                ),
              ),
            ),
            // TextField(
            //   controller: _statusController,
            //   decoration: const InputDecoration(labelText: 'Status'),
            // ),
            const SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _saveAppointmentDetails,
                  child: const Text('Save'),
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
    );
  }
}
