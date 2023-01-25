import 'package:http/http.dart' as http;

class ApiSensores {
  Future<void> getInfoSensores(String accessToken) async {
    final response = await http.get(
      Uri.parse("https://www.digitplan.com/api/v1/sensor"),
      headers: <String, String>{'Authorization': 'Bearer $accessToken'},
    );
  }
}
