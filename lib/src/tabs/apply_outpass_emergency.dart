import 'package:flutter/material.dart';
import 'package:outpass_app/src/components/appbar.dart';
import 'package:intl/intl.dart';

class ApplyOutpassEmergency extends StatefulWidget {
  const ApplyOutpassEmergency({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ApplyOutpassEmergencyState createState() => _ApplyOutpassEmergencyState();
}

class _ApplyOutpassEmergencyState extends State<ApplyOutpassEmergency> {
  // DateTime selectedDate = DateTime.now();
  // TextEditingController dateController = TextEditingController(
  //   text: DateFormat('yyyy-MM-dd').format(selectedDate),
  // );

  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedOutDate;
  DateTime? _selectedInDate;
  final TextEditingController _parentContactController =
      TextEditingController();
  final TextEditingController _studentContactController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  bool _termsAccepted = false;

  Future<void> _selectOutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedOutDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedOutDate) {
      setState(() {
        _selectedOutDate = picked;
      });
    }
  }

  Future<void> _selectInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedInDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedInDate) {
      setState(() {
        _selectedInDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: 'Enter the location',
                      contentPadding: const EdgeInsets.only(left: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () => _selectOutDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Out Date',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        // fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                      hintText: 'MM/DD/YYYY',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(
                      text: _selectedOutDate == null
                          ? ''
                          : DateFormat('MM/dd/yyyy').format(_selectedOutDate!),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              GestureDetector(
                onTap: () => _selectInDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'In Date',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        // fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                      hintText: 'MM/DD/YYYY',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(
                      text: _selectedInDate == null
                          ? ''
                          : DateFormat('MM/dd/yyyy').format(_selectedInDate!),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Parents Contact',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _parentContactController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter the parent\'s contact number',
                      contentPadding: const EdgeInsets.only(left: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Student Contact',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _studentContactController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter the student\'s contact number',
                      contentPadding: const EdgeInsets.only(left: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Remarks',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _remarksController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter Remarks',
                      contentPadding: const EdgeInsets.only(left: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              // Terms and conditions checkbox with the checkbox on the left
              Row(
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    onChanged: (bool? value) {
                      setState(() {
                        _termsAccepted = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Applying for the outpass will result in an Email being sent to your parents',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _termsAccepted
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission logic
                            print('Form submitted');
                          }
                        }
                      : null, // Disable the button if terms are not accepted
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD0BCFF), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Apply for outpass',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
