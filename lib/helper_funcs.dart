String? customInputChecker(String? value) {
  bool acceptable = true;
  String v = value.toString().trim();
  int index = 0;
  if (v.isEmpty) {
    acceptable = false;
  }
  if (v.length > 1) {
    if (v[0] == '-') {
      index++;
    }
  }

  while (index < v.length && acceptable) {
    if (v.codeUnitAt(index) >= '0'.codeUnitAt(0) &&
        v.codeUnitAt(index) <= '9'.codeUnitAt(0)) {
      index++;
      continue;
    }
    acceptable = false;
  }

  if (!acceptable) {
    return "Give valid number input";
  }

  return null;
}
