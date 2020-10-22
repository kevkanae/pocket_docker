import 'package:flutter/material.dart';
import 'package:pocket_docker/Page1.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'server.dart';

class Run extends StatefulWidget {
  final ipAddress;
  Run({this.ipAddress});
  @override
  _RunState createState() => _RunState();
}

class _RunState extends State<Run> {
  var response, variable, containerName, imageName, cmd;

  func(command) async {
    print(widget.ipAddress);
    ServerBase serverBase = ServerBase(cMD: command, iP: widget.ipAddress);
    variable = await serverBase.server();
    response = variable.statusCode;
    print(variable.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffe8ffff),
      appBar: AppBar(
        title: Text('R U N'),
        centerTitle: true,
        backgroundColor: Color(0xff41aea9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff213e3b),
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Container Name',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide:
                                    BorderSide(color: Color(0xff41aea9))),
                          ),
                          onChanged: (value) {
                            containerName = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Image Name',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide:
                                      BorderSide(color: Color(0xff41aea9)))),
                          onChanged: (value) {
                            imageName = value;
                          },
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width * .3,
                          child: FlatButton(
                              splashColor: Color(0xffe8ffff),
                              onPressed: () {
                                if (imageName == null) {
                                  setState(() {
                                    imageName = 'centos';
                                    cmd =
                                        'docker run -dit -P --name $containerName $imageName';
                                    func(cmd);
                                  });
                                } else {
                                  cmd =
                                      'docker run -dit -P --name $containerName $imageName';
                                  func(cmd);
                                }
                              },
                              child: Text(
                                'R U N',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .30,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff213e3b),
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AvatarGlow(
                          glowColor: Color(0xff41aea9),
                          endRadius: 90.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Page1(
                                      ipAddress: widget.ipAddress,
                                    ),
                                  ));
                            },
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 8.0,
                              child: CircleAvatar(
                                backgroundColor: Colors.blueGrey[100],
                                child: Text('V I E W'),
                                radius: 54.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
