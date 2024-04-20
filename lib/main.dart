import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local file read/write Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ReadWriteFileExample(),
    );
  }
}

class ReadWriteFileExample extends StatefulWidget {
  const ReadWriteFileExample({super.key});

  @override
  State<ReadWriteFileExample> createState() => _ReadWriteFileExampleState();
}

class _ReadWriteFileExampleState extends State<ReadWriteFileExample> {
  final TextEditingController _textController = TextEditingController();

  static const String kLocalFileName = 'demo_localfile.txt';

  String _localFileContent = '';
  String _localFilePath = '';

  @override
  void initState() {
    super.initState();
    _readFromLocalFile();
    _getLocalFile.then((file) => setState(() => _localFilePath = file.path));
  }

  @override
  Widget build(BuildContext context) {
    FocusNode textFieldFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Write to local file:',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Write to local file:',
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            focusNode: textFieldFocusNode,
            controller: _textController,
            maxLines: null,
            style: const TextStyle(fontSize: 20),
          ),
          ButtonBar(
            children: [
              MaterialButton(
                onPressed: () async {
                  _readFromLocalFile();
                  _textController.text = _localFileContent;
                  FocusScope.of(context).requestFocus(textFieldFocusNode);
                  log('String successfully loaded from local file');
                },
                child: const Text(
                  'Load',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  await _writeLocalFile(_textController.text);
                  _textController.clear();
                  await _readFromLocalFile();
                  log('String successfully written to local file');
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          Text('Local file path:',
              style: Theme.of(context).textTheme.titleMedium),
          Text(_localFilePath, style: Theme.of(context).textTheme.titleSmall),
          const Divider(height: 20),
          Text('Local file content:',
              style: Theme.of(context).textTheme.titleMedium),
          Text(_localFileContent,
              style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }

  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/$kLocalFileName');
  }

  Future<File> _writeLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readFromLocalFile() async {
    String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch (e) {
      content = 'Error loading local file: $e';
    }
    setState(() {
      _localFileContent = content;
    });
  }
}
