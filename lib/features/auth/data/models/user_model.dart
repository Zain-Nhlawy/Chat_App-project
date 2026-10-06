class UserModel {
  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.status,
  });

  final String uid;
  final String name;
  final String email;
  final String status;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String? ?? '',
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      status: map['status'] as String? ?? 'Unavailable',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'status': status,
    };
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? status,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.status == status;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ email.hashCode ^ status.hashCode;
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, status: $status)';
  }
}
