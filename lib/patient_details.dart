import 'package:flutter/material.dart';
import 'package:red_book/classes/fhir.dart';
import 'api/personal_demographics.dart';


class PatientDetails extends StatefulWidget {
  const PatientDetails({super.key});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  String? _patientName = '...';
  String? _patientAddress = '...';
  String? _patientDOB = '...';
  String? _patientContactNumber = '...';
  String? _patientContactContact = '...';
  FhirBundle? fhirData;

  Future<void> fetchData() async {
    final data = await fetchFhirData();
    setState(() {
      if (data != null) {
        fhirData = data;
        final patient = getPatientFromFhirBundle(data); // Use the local 'data' variable
        _patientName = patient?.getFullName();
        _patientAddress = patient?.getAddressString();
        _patientDOB = patient?.getBirthDate();
        _patientContactNumber = patient?.getContactNumber();
        _patientContactContact = patient?.getNearestContactNumber();

      } else {
        print('Failed to fetch data or data was null.');
      }
    });
  }

  Patient? getPatientFromFhirBundle(FhirBundle? fhirBundle) { // FhirBundle?
    if (fhirBundle != null && fhirBundle.entry.isNotEmpty) {
      final firstEntry = fhirBundle.entry.first;
      return firstEntry.resource;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: $_patientName'),
            const SizedBox(height: 16),
            Text('Address: $_patientAddress'),
            const SizedBox(height: 16),
            Text('Date of Birth: $_patientDOB'),
            const SizedBox(height: 16),
            Text('Telephone: $_patientContactNumber'),
            const SizedBox(height: 16),
            Text('Emergency Contact number: $_patientContactContact'),
          ],
        ),
      ),
    );
  }
}