
class DataUsers{
  int idusuario = 0;
  String nombre = "";
  String apellidos = "";
  String usuario = "";
  String email = "";
  String foto = "";

    DataUsers(this.idusuario, this.nombre, this.apellidos, this.usuario, this.email, this.foto);

  DataUsers.fromJson(Map<String, dynamic> Json){
    idusuario = Json['id_usuario'];
    nombre = Json['nombre'];
    apellidos = Json['apellidos'];
    usuario = Json['usuario'];
    email = Json['email'];
    foto = Json['foto'];
  }

}