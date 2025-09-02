class ContactFormModel {
  final int? id;
  final String name;
  final String email;
  final String subject;
  final String message;
  final DateTime submittedAt;

  ContactFormModel({
    this.id,
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    required this.submittedAt,
  });

  factory ContactFormModel.fromMap(Map<String, dynamic> map) {
    return ContactFormModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      email: map['email'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
      submittedAt: DateTime.parse(map['submitted_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
      'submitted_at': submittedAt.toIso8601String(),
    };
  }

  static List<ContactFormModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => ContactFormModel.fromMap(map)).toList();
  }
}