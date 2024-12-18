import '../database.dart';

class PendenciaTable extends SupabaseTable<PendenciaRow> {
  @override
  String get tableName => 'pendencia';

  @override
  PendenciaRow createRow(Map<String, dynamic> data) => PendenciaRow(data);
}

class PendenciaRow extends SupabaseDataRow {
  PendenciaRow(super.data);

  @override
  SupabaseTable get table => PendenciaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get uRef => getField<String>('uRef');
  set uRef(String? value) => setField<String>('uRef', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  String? get tipo => getField<String>('Tipo');
  set tipo(String? value) => setField<String>('Tipo', value);

  String? get descricao => getField<String>('Descrição');
  set descricao(String? value) => setField<String>('Descrição', value);

  String? get doc => getField<String>('Doc');
  set doc(String? value) => setField<String>('Doc', value);

  bool? get resolvido => getField<bool>('Resolvido');
  set resolvido(bool? value) => setField<bool>('Resolvido', value);
}
