import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import '../nfc_helpers/ndef_records.dart';
import '../nfc_helpers/nfc_wrapper_view.dart';

class ReadKey2 extends StatefulWidget {
  const ReadKey2({Key? key, required roomId, required String hash}) : super(key: key);

  @override
  State<ReadKey2> createState() => _ReadKey2State();
}

class _ReadKey2State extends State<ReadKey2> {
  Future<NfcTag?> _scannedTag = Future.value(null);
  bool _isScanning = false;
  int roomId = 2;

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
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
              onTap: () =>
              {
                setState(() {
                  _isScanning = true;
                  getNfcData();
                })
              },
              child: NFCWrapperView(isScanning: _isScanning)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: _scannedTag,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return readNdef(snapshot.data);
                } else {
                  return const Center(
                      child: Text(
                          'No data, tap on the NFC icon to start reading'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  readNdef(NfcTag tag) {

    var tech = Ndef.from(tag);
    if (tech is Ndef) {
      final cachedMessage = tech.cachedMessage;

      if (cachedMessage != null) {
        final record = cachedMessage.records[0];
        final info = NdefRecordInfo.fromNdef(record);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadKey2(roomId: roomId, hash: info.subtitle,),
          ),
        );
      }



    } else {
      return [Text('No NDEF data found')];
    }
  }

  //Démarre la session de lecture NFC
  void getNfcData() async {
    bool isAvailable = await NfcManager.instance.isAvailable();

    if (isAvailable) {
      await NfcManager.instance.startSession(onError: (error) async {
        print(error);
        _scannedTag = Future.error(error);
      }, onDiscovered: (NfcTag tag) async {
        setState(() {
          _scannedTag = Future.value(tag);
          _isScanning = false;
        });
        NfcManager.instance.stopSession();
      });
    }
  }
}