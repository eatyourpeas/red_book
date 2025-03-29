class FHIRObject {
  List<Entry> entry;

  FHIRObject({required this.entry});

  factory FHIRObject.fromJson(Map<String, dynamic> json) {
    return FHIRObject(
      entry: List<Entry>.from(json['entry'].map((x) => Entry.fromJson(x))),
    );
  }
}

class Entry {
  Resource resource;

  Entry({required this.resource});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      resource: Resource.fromJson(json['resource']),
    );
  }
}

class Resource {
  String resourceType;
  Map<String, dynamic> data;

  Resource({required this.resourceType, required this.data});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      resourceType: json['resourceType'],
      data: json,
    );
  }
}
