import 'package:task3/constant/constantfile.dart';
import 'package:task3/model/listmodelkampus.dart';
import 'package:http/http.dart' as http;

class NetworkProvider{

  List<ListModelKampus>? listKampus;

  Future<List<ListModelKampus>?> getDataKampus()async{
    final response = await http.get(Uri.parse(ConstantFile.url + "readkampus.php"));

    List<ListModelKampus> listKampus = listModelKampusFromJson(response.body);
    return listKampus;
  }

}