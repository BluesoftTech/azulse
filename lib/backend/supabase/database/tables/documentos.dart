import '../database.dart';

class DocumentosTable extends SupabaseTable<DocumentosRow> {
  @override
  String get tableName => 'documentos';

  @override
  DocumentosRow createRow(Map<String, dynamic> data) => DocumentosRow(data);
}

class DocumentosRow extends SupabaseDataRow {
  DocumentosRow(super.data);

  @override
  SupabaseTable get table => DocumentosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userRef => getField<String>('userRef');
  set userRef(String? value) => setField<String>('userRef', value);

  String? get nomeDoc => getField<String>('nome_Doc');
  set nomeDoc(String? value) => setField<String>('nome_Doc', value);

  String? get pdf => getField<String>('pdf');
  set pdf(String? value) => setField<String>('pdf', value);
}
