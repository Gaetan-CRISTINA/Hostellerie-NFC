import 'package:flutter/material.dart';
import 'package:hostellerie/Components/primaryButton.dart';
import 'package:hostellerie/Methods/read_key.dart';
import 'package:hostellerie/Views/read_key1.dart';
import 'package:hostellerie/Views/read_key2.dart';

class ReadKey3 extends StatefulWidget {
  final int roomId;
  final String hash;

  const ReadKey3({super.key, required this.roomId, required this.hash});

  @override
  State<ReadKey3> createState() => _ReadKey3State();
}

class _ReadKey3State extends State<ReadKey3> {
  late Future openDoorResult;

  @override
  void initState() {
    super.initState();
    openDoorResult = openDoor(widget.roomId, widget.hash);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Open Door Simulator',
        ),
        backgroundColor: Color(0xFFe6b34b),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 25, left: 10),
            child: Text("Simulate access",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
          FutureBuilder(
              future: openDoorResult,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  if(snapshot.data.open){
                    return Column(
                      children: [
                        SizedBox(height: 50),
                        Text('Door Open!'),
                        SizedBox(height: 50),
                        Container(
                          width: 400,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/circularValidate.png"),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        PrimaryButton( textButton: 'Try again', action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ReadKey1(),
                            ),
                          );
                        }, size: 1,)
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: 50),
                        Text(snapshot.data.error),
                        SizedBox(height: 50),
                        Container(
                          width: 400,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/circularError.png"),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        const Text('Access denied'),
                        SizedBox(height: 30),
                        PrimaryButton( textButton: 'Try again', action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              ReadKey2(roomId: widget.roomId,),
                            ),
                          );
                        }, size: 1,)
                      ],
                    );
                  }
                } else if (snapshot.hasError){
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      Text('${snapshot.error}'),
                      SizedBox(height: 50),
                      Container(
                        width: 400,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/circularError.png"),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      const Text('Access denied'),
                      SizedBox(height: 30),
                      PrimaryButton( textButton: 'Try again', action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ReadKey2(roomId: widget.roomId,),
                          ),
                        );
                      }, size: 1,)
                    ],
                  );
                }
                return const CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}
