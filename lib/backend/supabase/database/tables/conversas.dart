import '../database.dart';

class ConversasTable extends SupabaseTable<ConversasRow> {
  @override
  String get tableName => 'conversas';

  @override
  ConversasRow createRow(Map<String, dynamic> data) => ConversasRow(data);
}

class ConversasRow extends SupabaseDataRow {
  ConversasRow(super.data);

  @override
  SupabaseTable get table => ConversasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String? get supportId => getField<String>('support_id');
  set supportId(String? value) => setField<String>('support_id', value);

  bool? get auto => getField<bool>('auto');
  set auto(bool? value) => setField<bool>('auto', value);

  DateTime? get closedAt => getField<DateTime>('closed_at');
  set closedAt(DateTime? value) => setField<DateTime>('closed_at', value);
}
