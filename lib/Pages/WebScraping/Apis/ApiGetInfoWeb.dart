import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as html;
import 'package:proyecto_javier/Pages/WebScraping/Apis/EstructuraArticulo/Articulo.dart';

class ApiGetInfoWeb {
  Future<List<Articulo>?> getWebInfo() async {
    List<Articulo> articulos;

    final url = Uri.parse('https://www.consorciozaragoza.es/noticias');
    final response = await http.get(url);
    html.Document doc = html.Document.html(response.body);

    final titulos = doc.querySelectorAll('h2 > a').map((e) => e.innerHtml.trim()).toList();
    //final urlImagenes = doc.querySelectorAll('div > img').map((e) => e.attributes['src']).toList();
    final urls = doc.querySelectorAll('h2 > a').map((e) => e.attributes['href']).toList();

    articulos = List.generate(titulos.length, (index) => Articulo(titulo: titulos[index], url: urls[index]));

    return articulos;
  }
}
