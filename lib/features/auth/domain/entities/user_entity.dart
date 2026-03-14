class UserEntity {
  final String id;
  final String email;
  final String name;
  final String role; // e.g., 'doctor', 'patient', 'admin'

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
  });
}
