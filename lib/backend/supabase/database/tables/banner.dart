import '../database.dart';

class BannerTable extends SupabaseTable<BannerRow> {
  @override
  String get tableName => 'banner';

  @override
  BannerRow createRow(Map<String, dynamic> data) => BannerRow(data);
}

class BannerRow extends SupabaseDataRow {
  BannerRow(super.data);

  @override
  SupabaseTable get table => BannerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  int? get altura => getField<int>('altura');
  set altura(int? value) => setField<int>('altura', value);
}
