import '../database.dart';

class PropostasTable extends SupabaseTable<PropostasRow> {
  @override
  String get tableName => 'propostas';

  @override
  PropostasRow createRow(Map<String, dynamic> data) => PropostasRow(data);
}

class PropostasRow extends SupabaseDataRow {
  PropostasRow(super.data);

  @override
  SupabaseTable get table => PropostasTable();

  String? get banco => getField<String>('Banco');
  set banco(String? value) => setField<String>('Banco', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  double? get taxas => getField<double>('taxas');
  set taxas(double? value) => setField<double>('taxas', value);

  int? get carencia => getField<int>('carencia');
  set carencia(int? value) => setField<int>('carencia', value);

  int? get parcelas => getField<int>('parcelas');
  set parcelas(int? value) => setField<int>('parcelas', value);

  bool? get aceitou => getField<bool>('aceitou');
  set aceitou(bool? value) => setField<bool>('aceitou', value);

  String? get clienteRef => getField<String>('clienteRef');
  set clienteRef(String? value) => setField<String>('clienteRef', value);

  String get idProposta => getField<String>('idProposta')!;
  set idProposta(String value) => setField<String>('idProposta', value);

  DateTime get createdDate => getField<DateTime>('createdDate')!;
  set createdDate(DateTime value) => setField<DateTime>('createdDate', value);

  DateTime? get dataProposta => getField<DateTime>('dataProposta');
  set dataProposta(DateTime? value) =>
      setField<DateTime>('dataProposta', value);

  DateTime? get dataPropostaAceita =>
      getField<DateTime>('data_proposta_aceita');
  set dataPropostaAceita(DateTime? value) =>
      setField<DateTime>('data_proposta_aceita', value);

  String? get nomeCredito => getField<String>('nomeCrédito');
  set nomeCredito(String? value) => setField<String>('nomeCrédito', value);

  int? get seguro => getField<int>('seguro');
  set seguro(int? value) => setField<int>('seguro', value);

  int? get taxaServico => getField<int>('taxaServiço');
  set taxaServico(int? value) => setField<int>('taxaServiço', value);

  String? get imagemBanco => getField<String>('imagemBanco');
  set imagemBanco(String? value) => setField<String>('imagemBanco', value);

  double? get ganho => getField<double>('ganho');
  set ganho(double? value) => setField<double>('ganho', value);
}
