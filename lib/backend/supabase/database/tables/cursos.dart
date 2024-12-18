import '../database.dart';

class CursosTable extends SupabaseTable<CursosRow> {
  @override
  String get tableName => 'cursos';

  @override
  CursosRow createRow(Map<String, dynamic> data) => CursosRow(data);
}

class CursosRow extends SupabaseDataRow {
  CursosRow(super.data);

  @override
  SupabaseTable get table => CursosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeCurso => getField<String>('nomeCurso');
  set nomeCurso(String? value) => setField<String>('nomeCurso', value);

  String? get capaCurso => getField<String>('capaCurso');
  set capaCurso(String? value) => setField<String>('capaCurso', value);

  String? get cursoCode => getField<String>('curso_code');
  set cursoCode(String? value) => setField<String>('curso_code', value);
}
