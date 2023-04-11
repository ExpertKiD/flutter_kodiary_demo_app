enum Country { CANADA, NEPAL }

enum State { ONTARIO, BAGMATI_PROVINCE }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

final stateValues = EnumValues(
    {"Bagmati Province": State.BAGMATI_PROVINCE, "Ontario": State.ONTARIO});
