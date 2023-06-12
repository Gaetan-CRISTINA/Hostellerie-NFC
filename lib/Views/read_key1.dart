import 'package:flutter/material.dart';
import 'package:hostellerie/Components/primaryButton.dart';
import 'package:hostellerie/Methods/read_key.dart';
import '../Models/room_identity.dart';
import './read_key2.dart';
import 'package:nfc_manager/nfc_manager.dart';
import '../nfc_helpers/ndef_records.dart';
import '../nfc_helpers/nfc_wrapper_view.dart';

class ReadKey1 extends StatefulWidget {
  const ReadKey1({Key? key}) : super(key: key);

  @override
  State<ReadKey1> createState() => _ReadKey1State();
}

class _ReadKey1State extends State<ReadKey1> {
  late Future<List<RoomIdentity>> futureListRooms;

  @override
  void initState() {
    super.initState();
    futureListRooms = getAllRooms();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Open Door Simulator',
        ),
        backgroundColor: const Color(0xFFe6b34b),
      ),
      body: FutureBuilder(
        future: futureListRooms,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.vertical,children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 25,
                    left: 10
                ),
                child: Text("Choose a room",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              ...snapshot.data!.map((e) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Text('Room id n° ${e.id}')
                      ),
                      PrimaryButton(
                        textButton: 'Test Key',
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadKey2(roomId:e.id, hash: ''),
                            ),
                          );
                        }, size: 1,),
                    ],
                  ),
                );
              }).toList()
            ],);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}