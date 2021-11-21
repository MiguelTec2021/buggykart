class DataUser {
  final int userId;
  // final int id;
  final String nombre;

  DataUser({
    required this.userId,
    required this.nombre,
    // required this.title,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      userId: json['id_usuario'],
      nombre: json['nombre'],
      // title: json['title'],
    );
  }
}