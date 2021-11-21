class DataUser {
  final int userId;
  final String nombre;
  final String apellidos;
  final String edad;
  final String usuario;
  final String email;
  final String nombreRol;

  DataUser({
    required this.userId,
    required this.nombre,
    required this.apellidos,
    required this.edad,
    required this.usuario,
    required this.email,
    required this.nombreRol,
    // required this.title,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      userId: json['id_usuario'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      edad: json['edad'],
      usuario: json['usuario'],
      email: json['email'],
      nombreRol: json['nombrerol'],
      // title: json['title'],
    );
  }
}