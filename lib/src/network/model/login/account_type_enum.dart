enum AccountType {
  teacher,
  student;

  String get nameOf {
    switch (this) {
      case teacher:
        return "GV";
      case student:
        return "SV";
      default:
        return "";
    }
  }

  static AccountType fromString(String s) {
    switch (s) {
      case "GV":
        return teacher;
      case "SV":
        return student;
      default:
        return student;
    }
  }
}
