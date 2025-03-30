import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:red_book/classes/fhir.dart';

Future<FhirBundle?> fetchFhirData() async {
  final url = Uri.parse(
      'https://sandbox.api.service.nhs.uk/personal-demographics/FHIR/R4/Patient?family=Smith&gender=female&birthdate=eq2010-10-22');

  try {
    final response = await http.get(
      url,
      headers: {
        'x-request-id': '58826280-6d07-44d3-b136-7247bf3c3e74',
        'Accept': 'application/fhir+json',
      },
    );

    if (response.statusCode == 200) {
      // Successful response
      print(response.body); // Print the raw JSON
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      try {
        return FhirBundle.fromJson(jsonData); // Parse the JSON into FhirBundle
      } catch (e) {
        print('Error parsing JSON: $e');
        return null;
      }
    } else {
      // Handle errors based on status code
      print('Error: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null; // Return null on error
    }
  } catch (e) {
    // Handle exceptions (e.g., network errors)
    print('Error: $e');
    return null; // Return null on error
  }
}