import '../database.dart';

class RespostasFormTable extends SupabaseTable<RespostasFormRow> {
  @override
  String get tableName => 'respostasForm';

  @override
  RespostasFormRow createRow(Map<String, dynamic> data) =>
      RespostasFormRow(data);
}

class RespostasFormRow extends SupabaseDataRow {
  RespostasFormRow(super.data);

  @override
  SupabaseTable get table => RespostasFormTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get contato => getField<String>('contato');
  set contato(String? value) => setField<String>('contato', value);

  String? get tempoAtividade => getField<String>('tempoAtividade');
  set tempoAtividade(String? value) =>
      setField<String>('tempoAtividade', value);

  String? get porteEmpresa => getField<String>('porteEmpresa');
  set porteEmpresa(String? value) => setField<String>('porteEmpresa', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  String? get valorDesejado => getField<String>('valorDesejado');
  set valorDesejado(String? value) => setField<String>('valorDesejado', value);

  String? get faturamento => getField<String>('faturamento');
  set faturamento(String? value) => setField<String>('faturamento', value);

  String? get nomeCompleto => getField<String>('nome_completo');
  set nomeCompleto(String? value) => setField<String>('nome_completo', value);

  String? get indicador => getField<String>('indicador');
  set indicador(String? value) => setField<String>('indicador', value);
}
