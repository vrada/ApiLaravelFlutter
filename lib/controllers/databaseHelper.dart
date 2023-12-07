import "dart:convert";
import "package:http/http.dart" as http;

class DatabaseHelper {
  String url = "http://192.168.76.25:8000/api/";
  // function get
  Future getApi() async {
   var response = await http.get(
    Uri.parse(url + "get-crud"),
    // headers: {
    //   "Accept": "application/json",
    //   "adsignature": "TESTING"
    // }
    ); 
    return json.decode(response.body)["data"];
  }
  //function post
  void addData(String nameproduct, String price) async {
    http.post(Uri.parse(url + "store-crud"),
      body: {
        "nameproduct": "$nameproduct",
        "price": "$price",
      },
    ).then((response) {
      print(response.body);
      print('response status : ${response.statusCode}');
    });
  }
}