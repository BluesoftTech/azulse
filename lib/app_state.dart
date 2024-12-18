import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _uRef = prefs.getString('ff_uRef') ?? _uRef;
    });
    _safeInit(() {
      _clienteANON = prefs.getInt('ff_clienteANON') ?? _clienteANON;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _uRef = '';
  String get uRef => _uRef;
  set uRef(String value) {
    _uRef = value;
    prefs.setString('ff_uRef', value);
  }

  String _nomeForm = '';
  String get nomeForm => _nomeForm;
  set nomeForm(String value) {
    _nomeForm = value;
  }

  String _whatsappForm = '';
  String get whatsappForm => _whatsappForm;
  set whatsappForm(String value) {
    _whatsappForm = value;
  }

  String _cpfForm = '';
  String get cpfForm => _cpfForm;
  set cpfForm(String value) {
    _cpfForm = value;
  }

  String _cnpjForm = '';
  String get cnpjForm => _cnpjForm;
  set cnpjForm(String value) {
    _cnpjForm = value;
  }

  String _crencaForm = '';
  String get crencaForm => _crencaForm;
  set crencaForm(String value) {
    _crencaForm = value;
  }

  String _porteForm = '';
  String get porteForm => _porteForm;
  set porteForm(String value) {
    _porteForm = value;
  }

  String _atividadeForm = '';
  String get atividadeForm => _atividadeForm;
  set atividadeForm(String value) {
    _atividadeForm = value;
  }

  int _clienteANON = 0;
  int get clienteANON => _clienteANON;
  set clienteANON(int value) {
    _clienteANON = value;
    prefs.setInt('ff_clienteANON', value);
  }

  String _nomeRef = '';
  String get nomeRef => _nomeRef;
  set nomeRef(String value) {
    _nomeRef = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
