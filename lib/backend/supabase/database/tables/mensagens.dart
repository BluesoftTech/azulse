import '../database.dart';

class MensagensTable extends SupabaseTable<MensagensRow> {
  @override
  String get tableName => 'mensagens';

  @override
  MensagensRow createRow(Map<String, dynamic> data) => MensagensRow(data);
}

class MensagensRow extends SupabaseDataRow {
  MensagensRow(super.data);

  @override
  SupabaseTable get table => MensagensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get conversaRef => getField<String>('ConversaRef');
  set conversaRef(String? value) => setField<String>('ConversaRef', value);

  String? get autorRef => getField<String>('autorRef');
  set autorRef(String? value) => setField<String>('autorRef', value);

  String? get mensagem => getField<String>('mensagem');
  set mensagem(String? value) => setField<String>('mensagem', value);

  bool? get imagem => getField<bool>('imagem');
  set imagem(bool? value) => setField<bool>('imagem', value);

  bool? get video => getField<bool>('vídeo');
  set video(bool? value) => setField<bool>('vídeo', value);

  bool? get texto => getField<bool>('texto');
  set texto(bool? value) => setField<bool>('texto', value);

  bool? get audio => getField<bool>('audio');
  set audio(bool? value) => setField<bool>('audio', value);
}
