import '../database.dart';

class ProspectsTable extends SupabaseTable<ProspectsRow> {
  @override
  String get tableName => 'prospects';

  @override
  ProspectsRow createRow(Map<String, dynamic> data) => ProspectsRow(data);
}

class ProspectsRow extends SupabaseDataRow {
  ProspectsRow(super.data);

  @override
  SupabaseTable get table => ProspectsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get nomeDaEmpresa => getField<String>('nome da empresa');
  set nomeDaEmpresa(String? value) =>
      setField<String>('nome da empresa', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  bool? get convidou => getField<bool>('convidou');
  set convidou(bool? value) => setField<bool>('convidou', value);

  bool? get fezReuniao => getField<bool>('fez reunião');
  set fezReuniao(bool? value) => setField<bool>('fez reunião', value);

  String? get followUp1 => getField<String>('followUp1');
  set followUp1(String? value) => setField<String>('followUp1', value);

  String? get followUp2 => getField<String>('followUp2');
  set followUp2(String? value) => setField<String>('followUp2', value);

  String? get uRef => getField<String>('uRef');
  set uRef(String? value) => setField<String>('uRef', value);
}
