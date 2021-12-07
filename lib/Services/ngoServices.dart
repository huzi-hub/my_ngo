// ignore_for_file: file_names, deprecated_member_use, prefer_collection_literals, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:my_ngo/models/ngoModel.dart';

class NGOData {
  static const String url = 'https://edonations.000webhostapp.com/api-ngo.php';

  Future<List<Ngos>> getNgos() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Ngos> ngos = ngosFromJson(response.body);
        return ngos;
      } else {
        return List.empty();
      }
    } catch (e) {
      rethrow;
    }
  }
}
