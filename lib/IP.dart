import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'docker_run.dart';

class IPCheck extends StatefulWidget {
  @override
  _IPCheckState createState() => _IPCheckState();
}

class _IPCheckState extends State<IPCheck> {
  var ip;
  var selectedMenuItemId;

  bool isvisible = false, code = false;

  status(ip) async {
    code = validator.ip('$ip');
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffe8ffff),
      appBar: AppBar(
        backgroundColor: Color(0xff41aea9),
        title: Text('P O C K E T  D O C K E R'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .65,
              decoration: BoxDecoration(
                color: Color(0xff213e3b),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: code == true ? Colors.green[200] : Colors.red[200],
                    blurRadius: 7.0,
                    spreadRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Text(
                      code != true ? '.: Enter A Valid IP :.' : 'IP is Valid',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                  SizedBox(
                    height: 21.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Enter System IP Address',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.7)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          hintText: 'eg: 192.168.128.152'),
                      onChanged: (value) {
                        ip = value;
                        try {
                          print(ip);
                          status(ip);
                          print(code);
                          if (code == true) {
                            setState(() {
                              isvisible = true;
                            });
                          } else {
                            setState(() {
                              isvisible = false;
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Visibility(
                    visible: isvisible,
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Run(
                                  ipAddress: ip,
                                ),
                              ));
                        },
                        child: Material(
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('✔'),
                            radius: 28.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
