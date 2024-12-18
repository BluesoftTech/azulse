import '../database.dart';

class FinanceiroTable extends SupabaseTable<FinanceiroRow> {
  @override
  String get tableName => 'financeiro';

  @override
  FinanceiroRow createRow(Map<String, dynamic> data) => FinanceiroRow(data);
}

class FinanceiroRow extends SupabaseDataRow {
  FinanceiroRow(super.data);

  @override
  SupabaseTable get table => FinanceiroTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idCliente => getField<String>('id_cliente');
  set idCliente(String? value) => setField<String>('id_cliente', value);

  String? get idConsultor => getField<String>('id_consultor');
  set idConsultor(String? value) => setField<String>('id_consultor', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);
}
