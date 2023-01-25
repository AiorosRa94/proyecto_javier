import 'package:flutter/material.dart';
import 'package:proyecto_javier/Pages/WebScraping/Apis/ApiGetInfoWeb.dart';
import 'package:proyecto_javier/Pages/WebScraping/Apis/EstructuraArticulo/Articulo.dart';

class WebScraping extends StatefulWidget {
  const WebScraping({super.key});

  @override
  State<WebScraping> createState() => _WebScrapingState();
}

class _WebScrapingState extends State<WebScraping> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network("https://monzalbarbawtk.files.wordpress.com/2021/12/logo-final-1.png"),
      ),
      body: Column(
        children: [
          FutureBuilder<List<Articulo>?>(
            future: ApiGetInfoWeb().getWebInfo(),
            builder: (context, AsyncSnapshot<List<Articulo>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(
                    'Ocurrio un error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(leading: const Icon(Icons.list), title: Text(snapshot.data?[index].titulo ?? "No se encontro el titulo"));
                        }),
                  );
                } else {
                  return const Text(
                    'Sucedio un error inesperado',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  );
                }
              } else {
                return const Text(
                  'Cargando...',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
