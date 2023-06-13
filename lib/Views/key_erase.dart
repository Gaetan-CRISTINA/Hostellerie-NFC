// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable, unused_field, avoid_print, prefer_final_fields, use_build_context_synchronously, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hostellerie/Views/erase_key_success.dart';
import '/nfc_helpers/nfc_wrapper_view.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcEraseData extends StatefulWidget {
  NfcEraseData({Key? key}) : super(key: key);

  @override
  State<NfcEraseData> createState() => _NfcEraseData();
}

class _NfcEraseData extends State<NfcEraseData> {
  bool _isScanning = false;
  bool? _writeSuccess;
  bool? _validationSuccess = false;

  String _dataToWrite = "";

  late Future<String> _generatedKey;
  Future<bool?> _linkKeyToReservation = Future.value(false);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Create Key',
          ),
          backgroundColor: Color(0xFFe6b34b),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => {
                setState(() {
                  _isScanning = true;
                  writeData(_dataToWrite);
                })
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                    child: Column(
                      children: [
                        Text("Key will be erased",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 20),
                        NFCWrapperView(isScanning: _isScanning),
                        const SizedBox(height: 20),
                        Text("Touch NFC icon to erase tag",
                            style: TextStyle(
                                color: Colors.orangeAccent[800],
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }

  Future<NfcTag?> scannedTag = Future.value(null);

  //Démarre la session d'écriture NFC
  void writeData(String keyCode) async {
    NfcManager.instance.startSession(onError: (error) async {
      print(error.details);
      print(error.message);
    }, onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        print('Tag is not writable');
        _isScanning = false;
        _writeSuccess = false;
        NfcManager.instance.stopSession();
        return;
      }

      NdefMessage message = NdefMessage(
        [NdefRecord.createText(keyCode)],
      );

      try {
        await ndef.write(message);
        print("successfuly write");
        NfcManager.instance.stopSession();
        setState(() {
          _writeSuccess = true;
          _isScanning = false;
        });
        if (_writeSuccess == true)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ConfirmErasedKey(),
            ),
          );
      } catch (e) {
        NfcManager.instance.stopSession(errorMessage: e.toString());
        setState(() {
          _writeSuccess = false;
          _isScanning = false;
        });
        print("error");
        return;
      }
    });
  }
}
