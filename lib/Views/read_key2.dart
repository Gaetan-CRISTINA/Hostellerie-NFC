import 'package:flutter/material.dart';
import 'package:hostellerie/Views/read_key3.dart';
import 'package:nfc_manager/nfc_manager.dart';
import '../nfc_helpers/nfc_wrapper_view.dart';
import '../nfc_helpers/record_infos.dart';

class ReadKey2 extends StatefulWidget {
  final int roomId;

  const ReadKey2({Key? key, required this.roomId}) : super(key: key);

  @override
  State<ReadKey2> createState() => _ReadKey2State();
}

class _ReadKey2State extends State<ReadKey2> {
  Future<NfcTag?> _scannedTag = Future.value(null);
  bool _isScanning = false;
  Future<String?> _tagText = Future.value(null);

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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 25, left: 10),
            child: Text("Simulate access",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: SizedBox(
              height: 300,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isScanning = true;
                    });
                    getNfcData();
                  },
                  child: NFCWrapperView(isScanning: _isScanning)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: _tagText,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return const CircularProgressIndicator();
                  } else {
                    return Column(
                      children: [
                        const Center(
                          child: Text(
                            'Tap on the NFC icon to start reading',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/smartphone.png"),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  String? readNdef(NfcTag tag) {
    var tech = Ndef.from(tag);
    if (tech is Ndef) {
      final cachedMessage = tech.cachedMessage;

      if (cachedMessage != null) {
        final record = cachedMessage.records[0];
        final info = Record.fromNdef(record);
        if (info is WellknownTextRecord) {
          return info.text;
        }
      }
    }
    return null;
  }

  //Démarre la session de lecture NFC
  void getNfcData() async {
    bool isAvailable = await NfcManager.instance.isAvailable();

    if (isAvailable) {
      await NfcManager.instance.startSession(onError: (error) async {
        print(error);
        _scannedTag = Future.error(error);
      }, onDiscovered: (NfcTag tag) async {
        var tagText = readNdef(tag);
        if (tagText != null) {
          _tagText = Future.value(tagText);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ReadKey3(roomId: widget.roomId, hash: tagText),
            ),
          );
          _tagText = Future.value(null);
        }
        setState(() {
          _isScanning = false;
        });
        NfcManager.instance.stopSession();
      });
    }
  }
}
