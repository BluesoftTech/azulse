import '../database.dart';

class ComentariosTable extends SupabaseTable<ComentariosRow> {
  @override
  String get tableName => 'comentarios';

  @override
  ComentariosRow createRow(Map<String, dynamic> data) => ComentariosRow(data);
}

class ComentariosRow extends SupabaseDataRow {
  ComentariosRow(super.data);

  @override
  SupabaseTable get table => ComentariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get clienteRef => getField<String>('clienteRef');
  set clienteRef(String? value) => setField<String>('clienteRef', value);

  String? get nomeAutor => getField<String>('nomeAutor');
  set nomeAutor(String? value) => setField<String>('nomeAutor', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  String? get fotoAutor => getField<String>('fotoAutor');
  set fotoAutor(String? value) => setField<String>('fotoAutor', value);
}
