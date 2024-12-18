import '../database.dart';

class AulasTable extends SupabaseTable<AulasRow> {
  @override
  String get tableName => 'aulas';

  @override
  AulasRow createRow(Map<String, dynamic> data) => AulasRow(data);
}

class AulasRow extends SupabaseDataRow {
  AulasRow(super.data);

  @override
  SupabaseTable get table => AulasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeAula => getField<String>('nomeAula');
  set nomeAula(String? value) => setField<String>('nomeAula', value);

  String? get cursoRef => getField<String>('cursoRef');
  set cursoRef(String? value) => setField<String>('cursoRef', value);

  String? get aula => getField<String>('aula');
  set aula(String? value) => setField<String>('aula', value);
}
