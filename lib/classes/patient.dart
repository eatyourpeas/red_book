import 'dart:convert';

class Patient {
  String? resourceType;
  String? id;
  String? name;
  List<String>? telecom;
  String? birthDate;
  String? gender;
  List<Extension>? extension;
  List<Identifier>? identifier;
  bool? active;
  List<NameComponent>? nameComponents;
  List<TelecomComponent>? telecomComponents;
  List<AddressComponent>? addresses;
  List<GeneralPractitioner>? generalPractitioners;
  ManagingOrganization? managingOrganization;

  Patient({
    this.resourceType,
    this.id,
    this.name,
    this.telecom,
    this.birthDate,
    this.gender,
    this.extension,
    this.identifier,
    this.active,
    this.nameComponents,
    this.telecomComponents,
    this.addresses,
    this.generalPractitioners,
    this.managingOrganization,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      resourceType: json['resourceType'],
      id: json['id'],
      name: json['name'],
      telecom: List<String>.from(json['telecom'] ?? []),
      birthDate: json['birthDate'],
      gender: json['gender'],
      extension: List<Extension>.from(json['extension'] ?? []),
      identifier: List<Identifier>.from(json['identifier'] ?? []),
      active: json['active'],
      nameComponents: List<NameComponent>.from(json['name'] ?? []),
      telecomComponents: List<TelecomComponent>.from(json['telecom'] ?? []),
      addresses: List<AddressComponent>.from(json['address'] ?? []),
      generalPractitioners: List<GeneralPractitioner>.from(json['generalPractitioner'] ?? []),
      managingOrganization: json['managingOrganization'] != null ? ManagingOrganization.fromJson(json['managingOrganization']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'id': id,
      'name': name,
      'telecom': telecom ?? [],
      'birthDate': birthDate,
      'gender': gender,
      'extension': extension ?? [],
      'identifier': identifier ?? [],
      'active': active,
      'nameComponents': nameComponents ?? [],
      'telecomComponents': telecomComponents ?? [],
      'addresses': addresses ?? [],
      'generalPractitioners': generalPractitioners ?? [],
      'managingOrganization': managingOrganization?.toJson(),
    };
  }
}

class Extension {
  String? url;
  dynamic valueExtension;

  Extension({this.url, this.valueExtension});

  factory Extension.fromJson(Map<String, dynamic> json) {
    return Extension(
      url: json['url'],
      valueExtension: json['valueExtension'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'valueExtension': valueExtension,
    };
  }
}

class Identifier {
  String? system;
  String? value;
  List<Extension>? extension;

  Identifier({this.system, this.value, this.extension});

  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(
      system: json['system'],
      value: json['value'],
      extension: List<Extension>.from(json['extension'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'value': value,
      'extension': extension ?? [],
    };
  }
}

class NameComponent {
  String? use;
  String? text;
  List<String>? family;
  List<String>? given;
  List<String>? prefix;

  NameComponent({this.use, this.text, this.family, this.given, this.prefix});

  factory NameComponent.fromJson(Map<String, dynamic> json) {
    return NameComponent(
      use: json['use'],
      text: json['text'],
      family: List<String>.from(json['family'] ?? []),
      given: List<String>.from(json['given'] ?? []),
      prefix: List<String>.from(json['prefix'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'use': use,
      'text': text,
      'family': family ?? [],
      'given': given ?? [],
      'prefix': prefix ?? [],
    };
  }
}

class TelecomComponent {
  String? system;
  String? value;
  String? use;

  TelecomComponent({this.system, this.value, this.use});

  factory TelecomComponent.fromJson(Map<String, dynamic> json) {
    return TelecomComponent(
      system: json['system'],
      value: json['value'],
      use: json['use'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'value': value,
      'use': use,
    };
  }
}

class AddressComponent {
  String? use;
  String? type;
  List<String>? line;
  String? city;
  String? district;
  String? postalCode;

  AddressComponent({this.use, this.type, this.line, this.city, this.district, this.postalCode});

  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return AddressComponent(
      use: json['use'],
      type: json['type'],
      line: List<String>.from(json['line'] ?? []),
      city: json['city'],
      district: json['district'],
      postalCode: json['postalCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'use': use,
      'type': type,
      'line': line ?? [],
      'city': city,
      'district': district,
      'postalCode': postalCode,
    };
  }
}

class GeneralPractitioner {
  String? reference;

  GeneralPractitioner({this.reference});

  factory GeneralPractitioner.fromJson(Map<String, dynamic> json) {
    return GeneralPractitioner(
      reference: json['reference'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
    };
  }
}

class ManagingOrganization {
  String? reference;

  ManagingOrganization({this.reference});

  factory ManagingOrganization.fromJson(Map<String, dynamic> json) {
    return ManagingOrganization(
      reference: json['reference'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
    };
  }
}
