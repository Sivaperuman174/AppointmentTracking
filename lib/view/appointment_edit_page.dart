import 'package:appointmenttrackerapp/model/appointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class AppointmentEditPage extends StatefulWidget {
  final Appointment appointmentDetail;
  void Function() updateAppointmentHandler;

  AppointmentEditPage(
      {super.key,
      required this.appointmentDetail,
      required this.updateAppointmentHandler});

  @override
  State<AppointmentEditPage> createState() => _AppointmentEditPageState();
}

class _AppointmentEditPageState extends State<AppointmentEditPage> {
  late TextEditingController _descriptionController;
  late TextEditingController _allocateToController;
  late TextEditingController _alternateAllocateToController;
  late TextEditingController _actualDateController;
  late TextEditingController _alternateDateController;
  late TextEditingController _statusController;

  DateTime? _selectedActualDate;
  DateTime? _selectedAlternateDate;

  @override
  void initState() {
    super.initState();
    _descriptionController =
        TextEditingController(text: widget.appointmentDetail.description ?? '');
    _allocateToController = TextEditingController(
        text: widget.appointmentDetail.allocatedTo.toString() ?? '');
    _alternateAllocateToController = TextEditingController(
        text: widget.appointmentDetail.alternateAllocateTo.toString() ?? '');
    _actualDateController = TextEditingController(
        text: DateFormat('dd-MM-yyyy')
                .format(widget.appointmentDetail.actualDate) ??
            '');
    _alternateDateController = TextEditingController(
        text: DateFormat('dd-MM-yyyy')
                .format(widget.appointmentDetail.alternateDate) ??
            '');
    _statusController =
        TextEditingController(text: widget.appointmentDetail.status ?? '');
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
    widget.appointmentDetail.description = _descriptionController.text;
    widget.appointmentDetail.allocatedTo =
        int.parse(_allocateToController.text);
    widget.appointmentDetail.alternateAllocateTo =
        int.parse(_alternateAllocateToController.text);
    widget.appointmentDetail.actualDate = _selectedActualDate!;
    widget.appointmentDetail.alternateDate = _selectedAlternateDate!;
    widget.appointmentDetail.status = _statusController.text;
    widget.updateAppointmentHandler();
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
              decoration: const InputDecoration(labelText: 'Name'),
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
            TextField(
              controller: _statusController,
              decoration: const InputDecoration(labelText: 'Status'),
            ),
            const SizedBox(height: 20),
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
