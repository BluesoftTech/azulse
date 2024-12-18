import '../database.dart';

class MetasTable extends SupabaseTable<MetasRow> {
  @override
  String get tableName => 'metas';

  @override
  MetasRow createRow(Map<String, dynamic> data) => MetasRow(data);
}

class MetasRow extends SupabaseDataRow {
  MetasRow(super.data);

  @override
  SupabaseTable get table => MetasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeMeta => getField<String>('nome_meta');
  set nomeMeta(String? value) => setField<String>('nome_meta', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  int? get metaInteiro => getField<int>('meta_Inteiro');
  set metaInteiro(int? value) => setField<int>('meta_Inteiro', value);

  double? get metaValor => getField<double>('meta_Valor');
  set metaValor(double? value) => setField<double>('meta_Valor', value);

  String? get refCons => getField<String>('refCons');
  set refCons(String? value) => setField<String>('refCons', value);
}
