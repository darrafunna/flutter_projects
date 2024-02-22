import 'package:cozy_app/models/space.dart';
import 'package:http/http.dart' as http;

class SpaceProvider {
  Future<List<Space>?> getSpace() async {
    var client = http.Client();

    var uri = Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}