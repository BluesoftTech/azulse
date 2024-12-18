import '../database.dart';

class RelatorioTable extends SupabaseTable<RelatorioRow> {
  @override
  String get tableName => 'relatorio';

  @override
  RelatorioRow createRow(Map<String, dynamic> data) => RelatorioRow(data);
}

class RelatorioRow extends SupabaseDataRow {
  RelatorioRow(super.data);

  @override
  SupabaseTable get table => RelatorioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get clientesContactados => getField<int>('clientes_contactados');
  set clientesContactados(int? value) =>
      setField<int>('clientes_contactados', value);

  int? get reunioesAgendadas => getField<int>('reuniões_agendadas');
  set reunioesAgendadas(int? value) =>
      setField<int>('reuniões_agendadas', value);

  int? get reunioesRealizadas => getField<int>('reuniões_realizadas');
  set reunioesRealizadas(int? value) =>
      setField<int>('reuniões_realizadas', value);

  int? get clientesEmProcesso => getField<int>('clientes_em_processo');
  set clientesEmProcesso(int? value) =>
      setField<int>('clientes_em_processo', value);

  int? get clientesFechados => getField<int>('clientes_fechados');
  set clientesFechados(int? value) => setField<int>('clientes_fechados', value);

  String? get uRef => getField<String>('uRef');
  set uRef(String? value) => setField<String>('uRef', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get gerenteRef => getField<String>('gerenteRef');
  set gerenteRef(String? value) => setField<String>('gerenteRef', value);
}
