class FhirBundle {
  String resourceType;
  String type;
  int total;
  List<FhirBundleEntry> entry;
  String timestamp;

  FhirBundle({
    required this.resourceType,
    required this.type,
    required this.total,
    required this.entry,
    required this.timestamp,
  });

  factory FhirBundle.fromJson(Map<String, dynamic> json) {
    return FhirBundle(
      resourceType: json['resourceType'],
      type: json['type'],
      total: json['total'],
      entry: (json['entry'] as List)
          .map((e) => FhirBundleEntry.fromJson(e))
          .toList(),
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'type': type,
      'total': total,
      'entry': entry.map((e) => e.toJson()).toList(),
      'timestamp': timestamp,
    };
  }
}

class FhirBundleEntry {
  String fullUrl;
  FhirSearch search;
  Patient resource;

  FhirBundleEntry({
    required this.fullUrl,
    required this.search,
    required this.resource,
  });

  factory FhirBundleEntry.fromJson(Map<String, dynamic> json) {
    return FhirBundleEntry(
      fullUrl: json['fullUrl'],
      search: FhirSearch.fromJson(json['search']),
      resource: Patient.fromJson(json['resource']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullUrl': fullUrl,
      'search': search.toJson(),
      'resource': resource.toJson(),
    };
  }
}

class FhirSearch {
  int score;

  FhirSearch({required this.score});

  factory FhirSearch.fromJson(Map<String, dynamic> json) {
    return FhirSearch(score: json['score']);
  }

  Map<String, dynamic> toJson() {
    return {'score': score};
  }
}

class Patient {
  List<Address> address;
  String birthDate;
  List<Contact> contact;
  String deceasedDateTime;
  List<Extension> extension;
  String gender;
  List<GeneralPractitioner> generalPractitioner;
  String id;
  List<Identifier> identifier;
  Meta meta;
  int multipleBirthInteger;
  List<Name> name;
  String resourceType;
  List<Telecom> telecom;

  Patient({
    required this.address,
    required this.birthDate,
    required this.contact,
    required this.deceasedDateTime,
    required this.extension,
    required this.gender,
    required this.generalPractitioner,
    required this.id,
    required this.identifier,
    required this.meta,
    required this.multipleBirthInteger,
    required this.name,
    required this.resourceType,
    required this.telecom,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      address: (json['address'] as List).map((e) => Address.fromJson(e)).toList(),
      birthDate: json['birthDate'],
      contact: (json['contact'] as List).map((e) => Contact.fromJson(e)).toList(),
      deceasedDateTime: json['deceasedDateTime'],
      extension: (json['extension'] as List).map((e) => Extension.fromJson(e)).toList(),
      gender: json['gender'],
      generalPractitioner: (json['generalPractitioner'] as List).map((e) => GeneralPractitioner.fromJson(e)).toList(),
      id: json['id'],
      identifier: (json['identifier'] as List).map((e) => Identifier.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta']),
      multipleBirthInteger: json['multipleBirthInteger'],
      name: (json['name'] as List).map((e) => Name.fromJson(e)).toList(),
      resourceType: json['resourceType'],
      telecom: (json['telecom'] as List).map((e) => Telecom.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address.map((e) => e.toJson()).toList(),
      'birthDate': birthDate,
      'contact': contact.map((e) => e.toJson()).toList(),
      'deceasedDateTime': deceasedDateTime,
      'extension': extension.map((e) => e.toJson()).toList(),
      'gender': gender,
      'generalPractitioner': generalPractitioner.map((e) => e.toJson()).toList(),
      'id': id,
      'identifier': identifier.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
      'multipleBirthInteger': multipleBirthInteger,
      'name': name.map((e) => e.toJson()).toList(),
      'resourceType': resourceType,
      'telecom': telecom.map((e) => e.toJson()).toList(),
    };
  }

  String getFullName() {
    if (name.isNotEmpty) {
      final first = name.first;
      final given = first.given.isNotEmpty ? first.given.join(' ') : '';
      final family = first.family ?? '';
      final prefix = first.prefix.isNotEmpty ? first.prefix.join(' ') : '';
      final suffix = first.suffix.isNotEmpty ? first.suffix.join(' ') : '';

      return '$prefix $given $family $suffix'.trim();
    }
    return 'No Name';
  }

  String getAddressString() {
    if (address.isNotEmpty) {
      final firstAddress = address.first;
      final lines = firstAddress.line.join(', ');
      return '$lines, ${firstAddress.postalCode}';
    }
    return 'No Address';
  }

  String getAddressUse() {
    if (address.isNotEmpty) {
      return address.first.use;
    }
    return 'No Address Use';
  }

  String getBirthDate(){
    return birthDate;
  }

  String? getContactNumber() {
    if (contact.isNotEmpty) {
      for (final contactInfo in contact) {
        if (contactInfo.telecom.isNotEmpty) {
          for (final telecom in contactInfo.telecom) {
            if (telecom.system == 'phone') {
              return telecom.value;
            }
          }
        }
      }
    }
    return null; // Return null if no phone number is found
  }

  String? getGeneralPractitionerId() {
    if (generalPractitioner.isNotEmpty) {
      return generalPractitioner.first.id;
    }
    return null;
  }

  String? getGeneralPractitionerSystem() {
    if(generalPractitioner.isNotEmpty && generalPractitioner.first.identifier != null){
      return generalPractitioner.first.identifier.system;
    }
    return null;
  }

  String? getGeneralPractitionerValue() {
    if(generalPractitioner.isNotEmpty && generalPractitioner.first.identifier != null){
      return generalPractitioner.first.identifier.value;
    }
    return null;
  }

  String? getNearestContactName() {
    if (contact.isNotEmpty) {
      for (final contactInfo in contact) {
        if (contactInfo.relationship.isNotEmpty) {
          for (final relation in contactInfo.relationship) {
            if (relation.coding.isNotEmpty) {
              for (final coding in relation.coding) {
                if (coding.code == 'C') { // Assuming 'C' represents emergency contact
                  return this.getFullName();
                }
              }
            }
          }
        }
      }
    }
    return null; // Return null if no nearest contact is found
  }

  String? getNearestContactNumber() {
    if (contact.isNotEmpty) {
      for (final contactInfo in contact) {
        if (contactInfo.relationship.isNotEmpty) {
          for (final relation in contactInfo.relationship) {
            if (relation.coding.isNotEmpty) {
              for (final coding in relation.coding) {
                if (coding.code == 'C') { // Assuming 'C' represents emergency contact
                  if (contactInfo.telecom.isNotEmpty) {
                    for (final telecom in contactInfo.telecom) {
                      if (telecom.system == 'phone') {
                        return telecom.value;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return null; // Return null if no nearest contact number is found
  }
}

class Address {
  List<Extension> extension;
  String id;
  List<String> line;
  Period period;
  String postalCode;
  String use;

  Address({
    required this.extension,
    required this.id,
    required this.line,
    required this.period,
    required this.postalCode,
    required this.use,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      extension: (json['extension'] as List)
          .map((e) => Extension.fromJson(e))
          .toList(),
      id: json['id'],
      line: List<String>.from(json['line']),
      period: Period.fromJson(json['period']),
      postalCode: json['postalCode'],
      use: json['use'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'extension': extension.map((e) => e.toJson()).toList(),
      'id': id,
      'line': line,
      'period': period.toJson(),
      'postalCode': postalCode,
      'use': use,
    };
  }
}

class Period {
  String start;
  String? end;

  Period({required this.start, this.end});

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(start: json['start'], end: json['end']);
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
    };
  }
}

class Contact {
  String id;
  Period period;
  List<ContactRelationship> relationship;
  List<ContactTelecom> telecom;

  Contact({
    required this.id,
    required this.period,
    required this.relationship,
    required this.telecom,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      period: Period.fromJson(json['period']),
      relationship: (json['relationship'] as List).map((e) => ContactRelationship.fromJson(e)).toList(),
      telecom: (json['telecom'] as List).map((e) => ContactTelecom.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'period': period.toJson(),
      'relationship': relationship.map((e) => e.toJson()).toList(),
      'telecom': telecom.map((e) => e.toJson()).toList(),
    };
  }
}

class ContactRelationship {
  List<Coding> coding;

  ContactRelationship({required this.coding});

  factory ContactRelationship.fromJson(Map<String, dynamic> json) {
    return ContactRelationship(coding: (json['coding'] as List).map((e) => Coding.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    return {'coding': coding.map((e) => e.toJson()).toList()};
  }
}

class ContactTelecom {
  String system;
  String value;

  ContactTelecom({required this.system, required this.value});

  factory ContactTelecom.fromJson(Map<String, dynamic> json) {
    return ContactTelecom(system: json['system'], value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {'system': system, 'value': value};
  }
}

class Extension {
  String url;
  dynamic valueCodeableConcept;
  dynamic valueString;
  dynamic valueDateTime;
  List<Extension> extension;

  Extension({
    required this.url,
    this.valueCodeableConcept,
    this.valueString,
    this.valueDateTime,
    required this.extension,
  });

  factory Extension.fromJson(dynamic json) { // Change the type of json to dynamic.
    if (json is Map<String, dynamic>) {
      // If the json is a map, handle it as before.
      return Extension(
        url: json['url'],
        valueCodeableConcept: json['valueCodeableConcept'] != null
            ? CodeableConcept.fromJson(json['valueCodeableConcept'])
            : null,
        valueString: json['valueString'],
        valueDateTime: json['valueDateTime'],
        extension: json['extension'] != null
            ? (json['extension'] as List)
            .map((e) => Extension.fromJson(e))
            .toList()
            : [],
      );
    } else if (json is List) {
      // If the json is a list, handle it as a list of extensions.
      return Extension(
        url: '', // Default url, since the json is a list.
        valueCodeableConcept: null, // Default values, since the json is a list.
        valueString: null, // Default values, since the json is a list.
        valueDateTime: null, // Default values, since the json is a list.
        extension: json.map((e) => Extension.fromJson(e)).toList(),
      );
    } else {
      // Handle invalid json type
      return Extension(
        url: '',
        valueCodeableConcept: null,
        valueString: null,
        valueDateTime: null,
        extension: [],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'valueCodeableConcept': valueCodeableConcept?.toJson(),
      'valueString': valueString,
      'valueDateTime': valueDateTime,
      'extension': extension.map((e) => e.toJson()).toList(),
    };
  }
}

class CodeableConcept {
  List<Coding> coding;

  CodeableConcept({required this.coding});

  factory CodeableConcept.fromJson(Map<String, dynamic> json) {
    return CodeableConcept(coding: (json['coding'] as List).map((e) => Coding.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    return {'coding': coding.map((e) => e.toJson()).toList()};
  }
}

class Coding {
  String code;
  String display;
  String system;
  String? version; // Make version nullable

  Coding({required this.code, required this.display, required this.system, this.version});

  factory Coding.fromJson(Map<String, dynamic> json) {
    return Coding(
      code: json['code'],
      display: json['display'],
      system: json['system'],
      version: json['version'], // No change needed here, as it handles null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'display': display,
      'system': system,
      'version': version,
    };
  }
}

class GeneralPractitioner {
  String id;
  Identifier identifier;
  String type;

  GeneralPractitioner({required this.id, required this.identifier, required this.type});

  factory GeneralPractitioner.fromJson(Map<String, dynamic> json) {
    return GeneralPractitioner(id: json['id'], identifier: Identifier.fromJson(json['identifier']), type: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'identifier': identifier.toJson(), 'type': type};
  }
}

class Identifier {
  Extension? extension;
  Period? period;
  String system;
  String value;

  Identifier({this.extension, this.period, required this.system, required this.value});

  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(
      extension: json['extension'] != null ? Extension.fromJson(json['extension']) : null,
      period: json['period'] != null ? Period.fromJson(json['period']) : null,
      system: json['system'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'extension': extension?.toJson(),
      'period': period?.toJson(),
      'system': system,
      'value': value,
    };
  }
}

class Meta {
  List<Coding> security;
  String versionId;

  Meta({required this.security, required this.versionId});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(security: (json['security'] as List).map((e) => Coding.fromJson(e)).toList(), versionId: json['versionId']);
  }

  Map<String, dynamic> toJson() {
    return {'security': security.map((e) => e.toJson()).toList(), 'versionId': versionId};
  }
}

class Name {
  String family;
  List<String> given;
  String id;
  Period period;
  List<String> prefix;
  List<String> suffix;
  String use;

  Name({
    required this.family,
    required this.given,
    required this.id,
    required this.period,
    required this.prefix,
    required this.suffix,
    required this.use,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      family: json['family'],
      given: List<String>.from(json['given']),
      id: json['id'],
      period: Period.fromJson(json['period']),
      prefix: List<String>.from(json['prefix']),
      suffix: List<String>.from(json['suffix']),
      use: json['use'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family': family,
      'given': given,
      'id': id,
      'period': period.toJson(),
      'prefix': prefix,
      'suffix': suffix,
      'use': use,
    };
  }
}

class Telecom {
  Extension? extension;
  String id;
  Period? period;
  String system;
  String use;
  String value;

  Telecom({this.extension, required this.id, this.period, required this.system, required this.use, required this.value});

  factory Telecom.fromJson(Map<String, dynamic> json) {
    return Telecom(
      extension: json['extension'] != null
          ? Extension.fromJson(json['extension'])
          : null,
      id: json['id'],
      period: json['period'] != null
          ? Period.fromJson(json['period'])
          : null,
      system: json['system'],
      use: json['use'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'extension': extension?.toJson(),
      'id': id,
      'period': period?.toJson(),
      'system': system,
      'use': use,
      'value': value,
    };
  }
}