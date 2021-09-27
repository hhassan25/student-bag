import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:demo_edu_ir/lessons.dart';
import 'package:flutter/material.dart';

class pdfView extends StatefulWidget {
  const pdfView({Key key}) : super(key: key);

  @override
  _pdfViewState createState() => _pdfViewState();
}

class _pdfViewState extends State<pdfView> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
        'https://www.brianheinold.net/python/A_Practical_Introduction_to_Python_Programming_Heinold.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Lessons())) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: const Text('Read the following pdf chapter'),
          ),
          body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(
                    document: document,
                  ),
          ),
        ),
      ),
    );
  }
}
