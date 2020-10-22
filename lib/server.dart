import 'package:http/http.dart' as http;

//192.168.43.236 windows
class ServerBase {
  final String iP;
  final String cMD;
  var response;
  ServerBase({this.iP, this.cMD});

  server() async {
    var url = 'http://$iP/cgi-bin/myCGI.py?x=$cMD'; //192.168.43.161 centos
    response = await http.get(url);
    return response;
  }
}
