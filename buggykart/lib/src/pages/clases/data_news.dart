// ignore: camel_case_types
class Data_news{
  int id = 0;
  String titulo = "";
  String contenido = "";
  String foto = "";
  String fecha = "";
  int iduser = 0;
  String nombreU = "";

  Data_news(this.id, this.titulo, this.contenido, this.foto, this.fecha, this.iduser, this.nombreU);

  // ignore: non_constant_identifier_names
  Data_news.fromJson(Map<String, dynamic> Json){
    id = Json['id_new'];
    titulo = Json['titulo'];
    contenido = Json['contenido'];
    iduser = Json['id_usuario'];
    nombreU = Json['usuario'];
  }
}