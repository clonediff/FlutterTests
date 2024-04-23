import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/default_appbar.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preference Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SharedPreferenceExample(),
    );
  }
}

class SharedPreferenceExample extends StatefulWidget {
  const SharedPreferenceExample({super.key});

  @override
  State<SharedPreferenceExample> createState() =>
      _SharedPreferenceExampleState();
}

class _SharedPreferenceExampleState extends State<SharedPreferenceExample> {
  late SharedPreferences _prefs;

  static const String kNumberPrefKey = 'number_pref';
  static const String kBoolPrefKey = 'bool_pref';

  int _numberPref = 0;
  bool _boolPref = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then(
      (value) {
        setState(() => _prefs = value);
        _loadNumberPref();
        _loadBoolPref();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('Shared Preference Demo'),
      ),
      body: Column(
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  const Text('Number Preference'),
                  Text('$_numberPref'),
                  ElevatedButton(
                    onPressed: () => _setNumberPref(_numberPref + 1),
                    child: const Text('Increment'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Text('Boolean Preference'),
                  Text('$_boolPref'),
                  ElevatedButton(
                    onPressed: () => _setBoolPref(!_boolPref),
                    child: const Text('Toogle'),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => _resetDataPref(),
            child: const Text('Reset Data'),
          ),
        ],
      ),
    );
  }

  Future<void> _setNumberPref(int value) async {
    await _prefs.setInt(kNumberPrefKey, value);
    _loadNumberPref();
  }

  Future<void> _setBoolPref(bool value) async {
    await _prefs.setBool(kBoolPrefKey, value);
    _loadBoolPref();
  }

  void _loadNumberPref() {
    setState(() {
      _numberPref = _prefs.getInt(kNumberPrefKey) ?? 0;
    });
  }

  void _loadBoolPref() {
    setState(() {
      _boolPref = _prefs.getBool(kBoolPrefKey) ?? false;
    });
  }

  Future<void> _resetDataPref() async {
    await _prefs.remove(kNumberPrefKey);
    await _prefs.remove(kBoolPrefKey);
    _loadBoolPref();
    _loadNumberPref();
  }
}
