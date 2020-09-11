import 'dart:io';
import 'dart:typed_data';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class ReadPdf extends StatefulWidget {
  @override
  _ReadPdfState createState() => _ReadPdfState();
}

class _ReadPdfState extends State<ReadPdf> {
  String path;
  //   iOS เพิ่มใน iso/Runner/info.plist
  //<key>io.flutter.embedded_views_preview</key>
  //<true />

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/teste.pdf');
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsBytes(stream);
  }

  Future<bool> existsFile() async {
    final file = await _localFile;
    return file.exists();
  }

  Future<Uint8List> fetchPost() async {
    final response = await http.get(
        'https://mozilla.github.io/pdf.js/web/compressed.tracemonkey-pldi-09.pdf');
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  void loadPdf() async {
    await writeCounter(await fetchPost());
    await existsFile();
    path = (await _localFile).path;
    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    loadPdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สื่อธรรมะ',
          style: TextStyles().titleBar,
        ),
        shape: CustomShapeBorder(),
        backgroundColor: Color(0xFFDFF1CD),
        iconTheme: IconThemeData(
          color: Color(0xFF4D890E), //change your color here
        ),
        actions: [
          InkWell(
            onTap: () {
              Url().download(
                  'https://mozilla.github.io/pdf.js/web/compressed.tracemonkey-pldi-09.pdf');
            },
            child: Icon(Icons.file_download),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              path != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.88,
                      child: PdfViewer(
                        filePath: path,
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
