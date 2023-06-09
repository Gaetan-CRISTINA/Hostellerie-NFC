//Author : Anthony Da Cruz - 2023
// ignore_for_file: prefer_const_constructors_in_immutables, unused_field, prefer_final_fields, avoid_print, prefer_const_constructors, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hostellerie/Views/confirm_created_card.dart';
import 'package:hostellerie/Views/fail_created_card.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../Methods/bookings_methods.dart';
import '../nfc_helpers/nfc_wrapper_view.dart';

class NfcWriteData extends StatefulWidget {
  final String dataToWrite;
  NfcWriteData({super.key, required this.dataToWrite});

  @override
  State<NfcWriteData> createState() => _KeycardCreateNfcState();
}

class _KeycardCreateNfcState extends State<NfcWriteData> {
  getDataCallback(String data) {}

  bool _isScanning = false;
  bool? _writeSuccess;
  bool? _validationSuccess = false;

  // String _dataToWrite = dataToWrite;

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
              onTap: () async {
                try {
                  writeData(await getHash(widget.dataToWrite));
                  setState(() {
                    _isScanning = true;
                  });
                } catch (e) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FailCreatedCard(),
                      ));
                  setState(() {
                    _isScanning = false;
                  });
                }
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
                        const SizedBox(height: 20),
                        NFCWrapperView(isScanning: _isScanning),
                        const SizedBox(height: 20),
                        Text("Touch NFC icon to create key",
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
            ), // Text('Data: ${result!.code}')
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
              builder: (context) => ConfirmCreatedCard(),
            ),
          );
        else
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FailCreatedCard(),
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
