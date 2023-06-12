import 'package:flutter/material.dart';
import 'package:hostellerie/Methods/read_key.dart';

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
      body: Column(
        children: [
          FutureBuilder(
              future: openDoorResult,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  if(snapshot.data.open){
                    return Text('Door Open Well Done');
                  } else {
                    return Text('Fail to open Door');
                  }
                } else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}
