class Articulo {
  String? titulo;
  String? descripcion;
  String? url;

  Articulo({this.titulo, this.descripcion, this.url});

  Articulo.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['descripcion'] = this.descripcion;
    data['url'] = this.url;
    return data;
  }
}
