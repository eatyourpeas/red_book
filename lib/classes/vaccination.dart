import 'dart:convert';
import 'package:yaml/yaml.dart';

// Parameters Classes
class Parameters {
  String resourceType;
  List<Parameter> parameter;

  Parameters({required this.resourceType, required this.parameter});

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      resourceType: json['resourceType'] as String,
      parameter: (json['parameter'] as List)
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'parameter': parameter.map((e) => e.toJson()).toList(),
    };
  }

  factory Parameters.fromYaml(String yamlString) {
    final dynamic yamlMap = loadYaml(yamlString);
    return Parameters.fromJson(yamlMap);
  }

  String toYaml() {
    return json.encode(toJson());
  }
}

class Parameter {
  String name;
  ValueIdentifier? valueIdentifier;
  List<Part>? part;

  Parameter({required this.name, this.valueIdentifier, this.part});

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      name: json['name'] as String,
      valueIdentifier: json['valueIdentifier'] == null
          ? null
          : ValueIdentifier.fromJson(
          json['valueIdentifier'] as Map<String, dynamic>),
      part: (json['part'] as List?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'valueIdentifier': valueIdentifier?.toJson(),
      'part': part?.map((e) => e.toJson()).toList(),
    };
  }
}

class ValueIdentifier {
  String system;
  String value;

  ValueIdentifier({required this.system, required this.value});

  factory ValueIdentifier.fromJson(Map<String, dynamic> json) {
    return ValueIdentifier(
      system: json['system'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'value': value,
    };
  }
}

class Part {
  String name;
  bool? valueBoolean;

  Part({required this.name, this.valueBoolean});

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      name: json['name'] as String,
      valueBoolean: json['valueBoolean'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'valueBoolean': valueBoolean,
    };
  }
}

// Bundle Classes
class Bundle {
  String resourceType;
  String type;
  Meta meta;
  List<Entry> entry;

  Bundle({
    required this.resourceType,
    required this.type,
    required this.meta,
    required this.entry,
  });

  factory Bundle.fromJson(Map<String, dynamic> json) {
    return Bundle(
      resourceType: json['resourceType'] as String,
      type: json['type'] as String,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      entry: (json['entry'] as List)
          .map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'type': type,
      'meta': meta.toJson(),
      'entry': entry.map((e) => e.toJson()).toList(),
    };
  }

  factory Bundle.fromYaml(String yamlString) {
    final dynamic yamlMap = loadYaml(yamlString);
    return Bundle.fromJson(yamlMap);
  }

  String toYaml() {
    return json.encode(toJson());
  }
}

class Meta {
  List<String> profile;
  String? versionId;
  String? lastUpdated;

  Meta({required this.profile, this.versionId, this.lastUpdated});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      profile: (json['profile'] as List).map((e) => e as String).toList(),
      versionId: json['versionId'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile,
      'versionId': versionId,
      'lastUpdated': lastUpdated,
    };
  }
}

class Entry {
  Resource resource;

  Entry({required this.resource});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      resource: Resource.fromJson(json['resource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resource': resource.toJson(),
    };
  }
}

class Resource {
  String resourceType;
  String? id;
  Meta? meta;
  List<Extension>? extension;
  List<Identifier>? identifier;
  bool? active;
  List<Name>? name;
  List<Telecom>? telecom;
  String? gender;
  String? birthDate;
  List<Address>? address;
  Reference? generalPractitioner;
  Reference? managingOrganization;
  String? status;
  String? mode;
  String? title;
  CodeableConcept? code;
  Reference? subject;
  String? date;
  CodeableConcept? orderedBy;
  List<EntryItem>? entry;
  bool? notGiven;
  CodeableConcept? vaccineCode;
  Reference? patient;
  Reference? encounter;
  bool? primarySource;
  Reference? location;
  Reference? manufacturer;
  String? lotNumber;
  String? expirationDate;
  CodeableConcept? site;
  CodeableConcept? route;
  Quantity? doseQuantity;
  List<PractitionerElement>? practitioner;
  List<Note>? note;
  Explanation? explanation;
  List<VaccinationProtocol>? vaccinationProtocol;

  Resource({
    required this.resourceType,
    this.id,
    this.meta,
    this.extension,
    this.identifier,
    this.active,
    this.name,
    this.telecom,
    this.gender,
    this.birthDate,
    this.address,
    this.generalPractitioner,
    this.managingOrganization,
    this.status,
    this.mode,
    this.title,
    this.code,
    this.subject,
    this.date,
    this.orderedBy,
    this.entry,
    this.notGiven,
    this.vaccineCode,
    this.patient,
    this.encounter,
    this.primarySource,
    this.location,
    this.manufacturer,
    this.lotNumber,
    this.expirationDate,
    this.site,
    this.route,
    this.doseQuantity,
    this.practitioner,
    this.note,
    this.explanation,
    this.vaccinationProtocol,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      resourceType: json['resourceType'] as String,
      id: json['id'] as String?,
      meta: json['meta'] == null ? null : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      extension: (json['extension'] as List?)?.map((e) => Extension.fromJson(e as Map<String, dynamic>)).toList(),
      identifier: (json['identifier'] as List?)?.map((e) => Identifier.fromJson(e as Map<String, dynamic>)).toList(),
      active: json['active'] as bool?,
      name: (json['name'] as List?)?.map((e) => Name.fromJson(e as Map<String, dynamic>)).toList(),
      telecom: (json['telecom'] as List?)?.map((e) => Telecom.fromJson(e as Map<String, dynamic>)).toList(),
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] as String?,
      address: (json['address'] as Map<String, dynamic>?) == null ? null : (json['address'] as List).map((e)=> Address.fromJson(e as Map<String, dynamic>)).toList(),
      generalPractitioner: json['generalPractitioner'] == null ? null : Reference.fromJson(json['generalPractitioner'] as Map<String, dynamic>),
      managingOrganization: json['managingOrganization'] == null ? null : Reference.fromJson(json['managingOrganization'] as Map<String, dynamic>),
      status: json['status'] as String?,
      mode: json['mode'] as String?,
      title: json['title'] as String?,
      code: json['code'] == null ? null : CodeableConcept.fromJson(json['code'] as Map<String, dynamic>),
      subject: json['subject'] == null ? null : Reference.fromJson(json['subject'] as Map<String, dynamic>),
      date: json['date'] as String?,
      orderedBy: json['orderedBy'] == null ? null : CodeableConcept.fromJson(json['orderedBy'] as Map<String, dynamic>),
      entry: (json['entry'] as List?)?.map((e) => EntryItem.fromJson(e as Map<String, dynamic>)).toList(),
      notGiven: json['notGiven'] as bool?,
      vaccineCode: json['vaccineCode'] == null ? null : CodeableConcept.fromJson(json['vaccineCode'] as Map<String, dynamic>),
      patient: json['patient'] == null ? null : Reference.fromJson(json['patient'] as Map<String, dynamic>),
      encounter: json['encounter'] == null ? null : Reference.fromJson(json['encounter'] as Map<String, dynamic>),
      primarySource: json['primarySource'] as bool?,
      location: json['location'] == null ? null : Reference.fromJson(json['location'] as Map<String, dynamic>),
      manufacturer: json['manufacturer'] == null ? null : Reference.fromJson(json['manufacturer'] as Map<String, dynamic>),
      lotNumber: json['lotNumber'] as String?,
      expirationDate: json['expirationDate'] as String?,
      site: json['site'] == null ? null : CodeableConcept.fromJson(json['site'] as Map<String, dynamic>),
      route: json['route'] == null ? null : CodeableConcept.fromJson(json['route'] as Map<String, dynamic>),
      doseQuantity: json['doseQuantity'] == null ? null : Quantity.fromJson(json['doseQuantity'] as Map<String, dynamic>),
      practitioner: (json['practitioner'] as List?)?.map((e) => PractitionerElement.fromJson(e as Map<String, dynamic>)).toList(),
      note: (json['note'] as List?)?.map((e) => Note.fromJson(e as Map<String, dynamic>)).toList(),
      explanation: json['explanation'] == null ? null : Explanation.fromJson(json['explanation'] as Map<String, dynamic>),
      vaccinationProtocol: (json['vaccinationProtocol'] as List?)?.map((e) => VaccinationProtocol.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'id': id,
      'meta': meta?.toJson(),
      'extension': extension?.map((e) => e.toJson()).toList(),
      'identifier': identifier?.map((e) => e.toJson()).toList(),
      'active': active,
      'name': name?.map((e) => e.toJson()).toList(),
      'telecom': telecom?.map((e) => e.toJson()).toList(),
      'gender': gender,
      'birthDate': birthDate,
      'address': address?.map((e)=> e.toJson()).toList(),
      'generalPractitioner': generalPractitioner?.toJson(),
      'managingOrganization': managingOrganization?.toJson(),
      'status': status,
      'mode': mode,
      'title': title,
      'code': code?.toJson(),
      'subject': subject?.toJson(),
      'date': date,
      'orderedBy': orderedBy?.toJson(),
      'entry': entry?.map((e) => e.toJson()).toList(),
      'notGiven': notGiven,
      'vaccineCode': vaccineCode?.toJson(),
      'patient': patient?.toJson(),
      'encounter': encounter?.toJson(),
      'primarySource': primarySource,
      'location': location?.toJson(),
      'manufacturer': manufacturer?.toJson(),
      'lotNumber': lotNumber,
      'expirationDate': expirationDate,
      'site': site?.toJson(),
      'route': route?.toJson(),
      'doseQuantity': doseQuantity?.toJson(),
      'practitioner': practitioner?.map((e) => e.toJson()).toList(),
      'note': note?.map((e) => e.toJson()).toList(),
      'explanation': explanation?.toJson(),
      'vaccinationProtocol': vaccinationProtocol?.map((e) => e.toJson()).toList(),
    };
  }
}

class Extension {
  String url;
  bool? valueBoolean;
  ValuePeriod? valuePeriod;
  CodeableConcept? valueCodeableConcept;
  String? valueDateTime;
  List<Extension>? extension;

  Extension({required this.url, this.valueBoolean, this.valuePeriod, this.valueCodeableConcept, this.valueDateTime, this.extension});

  factory Extension.fromJson(Map<String, dynamic> json) {
    return Extension(
        url: json['url'] as String,
        valueBoolean: json['valueBoolean'] as bool?,
        valuePeriod: json['valuePeriod'] == null ? null : ValuePeriod.fromJson(json['valuePeriod'] as Map<String, dynamic>),
        valueCodeableConcept: json['valueCodeableConcept'] == null ? null : CodeableConcept.fromJson(json['valueCodeableConcept'] as Map<String, dynamic>),
        valueDateTime: json['valueDateTime'] as String?,
        extension: (json['extension'] as List?)?.map((e) => Extension.fromJson(e as Map<String, dynamic>)).toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'valueBoolean': valueBoolean,
      'valuePeriod': valuePeriod?.toJson(),
      'valueCodeableConcept': valueCodeableConcept?.toJson(),
      'valueDateTime': valueDateTime,
      'extension': extension?.map((e) => e.toJson()).toList(),
    };
  }
}

class ValuePeriod {
  String? start;

  ValuePeriod({this.start});

  factory ValuePeriod.fromJson(Map<String, dynamic> json) {
    return ValuePeriod(
      start: json['start'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
    };
  }
}

class CodeableConcept {
  List<Coding>? coding;
  String? text;

  CodeableConcept({this.coding, this.text});

  factory CodeableConcept.fromJson(Map<String, dynamic> json) {
    return CodeableConcept(
      coding: (json['coding'] as List?)?.map((e) => Coding.fromJson(e as Map<String, dynamic>)).toList(),
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coding': coding?.map((e) => e.toJson()).toList(),
      'text': text,
    };
  }
}

class Coding {
  String? system;
  String? code;
  String? display;

  Coding({this.system, this.code, this.display});

  factory Coding.fromJson(Map<String, dynamic> json) {
    return Coding(
      system: json['system'] as String?,
      code: json['code'] as String?,
      display: json['display'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'code': code,
      'display': display,
    };
  }
}

class Identifier {
  List<Extension>? extension;
  String? system;
  String? value;

  Identifier({this.extension, this.system, this.value});

  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(
      extension: (json['extension'] as List?)?.map((e) => Extension.fromJson(e as Map<String, dynamic>)).toList(),
      system: json['system'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'extension': extension?.map((e) => e.toJson()).toList(),
      'system': system,
      'value': value,
    };
  }
}

class Name {
  String? use;
  String? text;
  String? family;
  List<String>? given;
  List<String>? prefix;

  Name({this.use, this.text, this.family, this.given, this.prefix});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      use: json['use'] as String?,
      text: json['text'] as String?,
      family: json['family'] as String?,
      given: (json['given'] as List?)?.map((e) => e as String).toList(),
      prefix: (json['prefix'] as List?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'use': use,
      'text': text,
      'family': family,
      'given': given,
      'prefix': prefix,
    };
  }
}

class Telecom {
  String? system;
  String? value;
  String? use;

  Telecom({this.system, this.value, this.use});

  factory Telecom.fromJson(Map<String, dynamic> json) {
    return Telecom(
      system: json['system'] as String?,
      value: json['value'] as String?,
      use: json['use'] as String?,
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

class Address {
  String? use;
  String? type;
  List<String>? line;
  String? city;
  String? district;
  String? postalCode;

  Address({this.use, this.type, this.line, this.city, this.district, this.postalCode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      use: json['use'] as String?,
      type: json['type'] as String?,
      line: (json['line'] as List?)?.map((e) => e as String).toList(),
      city: json['city'] as String?,
      district: json['district'] as String?,
      postalCode: json['postalCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'use': use,
      'type': type,
      'line': line,
      'city': city,
      'district': district,
      'postalCode': postalCode,
    };
  }
}

class Reference {
  String? reference;

  Reference({this.reference});

  factory Reference.fromJson(Map<String, dynamic> json) {
    return Reference(
      reference: json['reference'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
    };
  }
}

class EntryItem {
  Reference? item;

  EntryItem({this.item});

  factory EntryItem.fromJson(Map<String, dynamic> json) {
    return EntryItem(
      item: json['item'] == null ? null : Reference.fromJson(json['item'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item': item?.toJson(),
    };
  }
}

class Quantity {
  double? value;
  String? system;
  String? code;

  Quantity({this.value, this.system, this.code});

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      value: (json['value'] as num?)?.toDouble(),
      system: json['system'] as String?,
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'system': system,
      'code': code,
    };
  }
}

class PractitionerElement {
  CodeableConcept? role;
  Reference? actor;

  PractitionerElement({this.role, this.actor});

  factory PractitionerElement.fromJson(Map<String, dynamic> json) {
    return PractitionerElement(
      role: json['role'] == null ? null : CodeableConcept.fromJson(json['role'] as Map<String, dynamic>),
      actor: json['actor'] == null ? null : Reference.fromJson(json['actor'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role?.toJson(),
      'actor': actor?.toJson(),
    };
  }
}

class Note {
  String? text;

  Note({this.text});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}

class Explanation {
  List<CodeableConcept>? reason;
  List<CodeableConcept>? notGivenReason;

  Explanation({this.reason, this.notGivenReason});

  factory Explanation.fromJson(Map<String, dynamic> json) {
    return Explanation(
      reason: (json['reason'] as List?)?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>)).toList(),
      notGivenReason: (json['notGivenReason'] as List?)?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reason': reason?.map((e) => e.toJson()).toList(),
      'notGivenReason': notGivenReason?.map((e) => e.toJson()).toList(),
    };
  }
}

class VaccinationProtocol {
  int? doseSequence;
  int? seriesDoses;
  List<CodeableConcept>? targetDisease;
  CodeableConcept? doseStatus;

  VaccinationProtocol({this.doseSequence, this.seriesDoses, this.targetDisease, this.doseStatus});

  factory VaccinationProtocol.fromJson(Map<String, dynamic> json) {
    return VaccinationProtocol(
      doseSequence: json['doseSequence'] as int?,
      seriesDoses: json['seriesDoses'] as int?,
      targetDisease: (json['targetDisease'] as List?)?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>)).toList(),
      doseStatus: json['doseStatus'] == null ? null : CodeableConcept.fromJson(json['doseStatus'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doseSequence': doseSequence,
      'seriesDoses': seriesDoses,
      'targetDisease': targetDisease?.map((e) => e.toJson()).toList(),
      'doseStatus': doseStatus?.toJson(),
    };
  }
}