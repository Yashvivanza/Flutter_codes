class Student {
  int? id;
  String name;
  String rollNo;
  String department;
  String email;

  Student({
    this.id,
    required this.name,
    required this.rollNo,
    required this.department,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rollNo': rollNo,
      'department': department,
      'email': email,
    };
  }
}