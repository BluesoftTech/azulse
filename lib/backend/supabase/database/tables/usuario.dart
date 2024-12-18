import '../database.dart';

class UsuarioTable extends SupabaseTable<UsuarioRow> {
  @override
  String get tableName => 'usuario';

  @override
  UsuarioRow createRow(Map<String, dynamic> data) => UsuarioRow(data);
}

class UsuarioRow extends SupabaseDataRow {
  UsuarioRow(super.data);

  @override
  SupabaseTable get table => UsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeUnicoUsuario => getField<String>('nome_unico_usuario');
  set nomeUnicoUsuario(String? value) =>
      setField<String>('nome_unico_usuario', value);

  String? get contato => getField<String>('contato');
  set contato(String? value) => setField<String>('contato', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get userID => getField<String>('userID');
  set userID(String? value) => setField<String>('userID', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get frenteRG => getField<String>('frenteRG');
  set frenteRG(String? value) => setField<String>('frenteRG', value);

  String? get versoRG => getField<String>('versoRG');
  set versoRG(String? value) => setField<String>('versoRG', value);

  bool? get enviouDocs => getField<bool>('enviouDocs');
  set enviouDocs(bool? value) => setField<bool>('enviouDocs', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get nomeCompleto => getField<String>('nomeCompleto');
  set nomeCompleto(String? value) => setField<String>('nomeCompleto', value);

  String? get userRef => getField<String>('userRef');
  set userRef(String? value) => setField<String>('userRef', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  double? get faturamento => getField<double>('faturamento');
  set faturamento(double? value) => setField<double>('faturamento', value);

  String? get pdfCNPJ => getField<String>('pdfCNPJ');
  set pdfCNPJ(String? value) => setField<String>('pdfCNPJ', value);

  String? get enderecoEmpresa => getField<String>('endereco_Empresa');
  set enderecoEmpresa(String? value) =>
      setField<String>('endereco_Empresa', value);

  String? get contratoSocial => getField<String>('contratoSocial');
  set contratoSocial(String? value) =>
      setField<String>('contratoSocial', value);

  String? get ccmei => getField<String>('CCMEI');
  set ccmei(String? value) => setField<String>('CCMEI', value);

  String? get pgdas => getField<String>('PGDAS');
  set pgdas(String? value) => setField<String>('PGDAS', value);

  String? get ecf => getField<String>('ECF');
  set ecf(String? value) => setField<String>('ECF', value);

  String? get comprovanteResid => getField<String>('comprovanteResid');
  set comprovanteResid(String? value) =>
      setField<String>('comprovanteResid', value);

  String? get ir => getField<String>('IR');
  set ir(String? value) => setField<String>('IR', value);

  String? get certCasamento => getField<String>('CertCasamento');
  set certCasamento(String? value) => setField<String>('CertCasamento', value);

  bool? get iniciouMEI => getField<bool>('iniciouMEI');
  set iniciouMEI(bool? value) => setField<bool>('iniciouMEI', value);

  bool? get simplesNacional => getField<bool>('simplesNacional');
  set simplesNacional(bool? value) => setField<bool>('simplesNacional', value);

  bool? get casado => getField<bool>('casado');
  set casado(bool? value) => setField<bool>('casado', value);

  double? get valorDesejado => getField<double>('valorDesejado');
  set valorDesejado(double? value) => setField<double>('valorDesejado', value);

  bool? get buscandoProposta => getField<bool>('buscandoProposta');
  set buscandoProposta(bool? value) =>
      setField<bool>('buscandoProposta', value);

  bool? get docsOK => getField<bool>('docsOK');
  set docsOK(bool? value) => setField<bool>('docsOK', value);

  bool? get propostaEncontrada => getField<bool>('propostaEncontrada');
  set propostaEncontrada(bool? value) =>
      setField<bool>('propostaEncontrada', value);

  String? get propostas => getField<String>('propostas');
  set propostas(String? value) => setField<String>('propostas', value);

  bool? get aberturaConta => getField<bool>('aberturaConta');
  set aberturaConta(bool? value) => setField<bool>('aberturaConta', value);

  bool? get pagou => getField<bool>('pagou');
  set pagou(bool? value) => setField<bool>('pagou', value);

  String? get nomeEmpresa => getField<String>('nomeEmpresa');
  set nomeEmpresa(String? value) => setField<String>('nomeEmpresa', value);

  DateTime? get dataEnvioDocs => getField<DateTime>('dataEnvioDocs');
  set dataEnvioDocs(DateTime? value) =>
      setField<DateTime>('dataEnvioDocs', value);

  DateTime? get dataAnaliseDocs => getField<DateTime>('dataAnaliseDocs');
  set dataAnaliseDocs(DateTime? value) =>
      setField<DateTime>('dataAnaliseDocs', value);

  bool? get aceitouProposta => getField<bool>('aceitouProposta');
  set aceitouProposta(bool? value) => setField<bool>('aceitouProposta', value);

  DateTime? get dataAceitouProposta =>
      getField<DateTime>('dataAceitouProposta');
  set dataAceitouProposta(DateTime? value) =>
      setField<DateTime>('dataAceitouProposta', value);

  String? get assinatura => getField<String>('assinatura');
  set assinatura(String? value) => setField<String>('assinatura', value);

  String? get selfie => getField<String>('selfie');
  set selfie(String? value) => setField<String>('selfie', value);

  DateTime? get dataAberturaConta => getField<DateTime>('dataAberturaConta');
  set dataAberturaConta(DateTime? value) =>
      setField<DateTime>('dataAberturaConta', value);

  bool? get docsEmAnalise => getField<bool>('docsEmAnalise');
  set docsEmAnalise(bool? value) => setField<bool>('docsEmAnalise', value);

  String? get sexo => getField<String>('sexo');
  set sexo(String? value) => setField<String>('sexo', value);

  int? get idade => getField<int>('idade');
  set idade(int? value) => setField<int>('idade', value);

  String? get estadoCivil => getField<String>('estadoCivil');
  set estadoCivil(String? value) => setField<String>('estadoCivil', value);

  int? get cPFdoConjuge => getField<int>('CPFdoConjuge');
  set cPFdoConjuge(int? value) => setField<int>('CPFdoConjuge', value);

  String? get endereco => getField<String>('endereço');
  set endereco(String? value) => setField<String>('endereço', value);

  bool? get temSocios => getField<bool>('temSocios');
  set temSocios(bool? value) => setField<bool>('temSocios', value);

  String? get cpfSocios => getField<String>('cpfSocios');
  set cpfSocios(String? value) => setField<String>('cpfSocios', value);

  bool? get sociosCasados => getField<bool>('sociosCasados');
  set sociosCasados(bool? value) => setField<bool>('sociosCasados', value);

  String? get cpfConjugesSocios => getField<String>('cpfConjugesSocios');
  set cpfConjugesSocios(String? value) =>
      setField<String>('cpfConjugesSocios', value);

  bool? get temRestricaoSocio => getField<bool>('temRestricaoSocio');
  set temRestricaoSocio(bool? value) =>
      setField<bool>('temRestricaoSocio', value);

  String? get descricaoRestricaoSocio =>
      getField<String>('descricaoRestricaoSocio');
  set descricaoRestricaoSocio(String? value) =>
      setField<String>('descricaoRestricaoSocio', value);

  String? get tempoDeAtividade => getField<String>('tempoDeAtividade');
  set tempoDeAtividade(String? value) =>
      setField<String>('tempoDeAtividade', value);

  bool? get houveAlteracao => getField<bool>('houveAlteracao');
  set houveAlteracao(bool? value) => setField<bool>('houveAlteracao', value);

  String? get haQuantoTempo => getField<String>('HaQuantoTempo');
  set haQuantoTempo(String? value) => setField<String>('HaQuantoTempo', value);

  String? get ramoComercial => getField<String>('ramoComercial');
  set ramoComercial(String? value) => setField<String>('ramoComercial', value);

  String? get bancosComRelacionamento =>
      getField<String>('bancosComRelacionamento');
  set bancosComRelacionamento(String? value) =>
      setField<String>('bancosComRelacionamento', value);

  String? get enderecoDaEmpresa => getField<String>('EnderecoDaEmpresa');
  set enderecoDaEmpresa(String? value) =>
      setField<String>('EnderecoDaEmpresa', value);

  String? get finalidadeDoCredito => getField<String>('finalidadeDoCredito');
  set finalidadeDoCredito(String? value) =>
      setField<String>('finalidadeDoCredito', value);

  String? get cidade => getField<String>('Cidade');
  set cidade(String? value) => setField<String>('Cidade', value);

  String? get classeEmpresa => getField<String>('classeEmpresa');
  set classeEmpresa(String? value) => setField<String>('classeEmpresa', value);

  String? get temsocios => getField<String>('temsocios');
  set temsocios(String? value) => setField<String>('temsocios', value);

  String? get socioRestri => getField<String>('socioRestri?');
  set socioRestri(String? value) => setField<String>('socioRestri?', value);

  String? get casadoo => getField<String>('casadoo?');
  set casadoo(String? value) => setField<String>('casadoo?', value);

  String? get comecouMEI => getField<String>('comecouMEI?');
  set comecouMEI(String? value) => setField<String>('comecouMEI?', value);

  String? get fezAlteracao => getField<String>('fezAlteracao?');
  set fezAlteracao(String? value) => setField<String>('fezAlteracao?', value);

  String? get socioTemConjuge => getField<String>('socioTemConjuge?');
  set socioTemConjuge(String? value) =>
      setField<String>('socioTemConjuge?', value);

  bool? get abriuConta => getField<bool>('abriu conta');
  set abriuConta(bool? value) => setField<bool>('abriu conta', value);

  bool? get recebeuCredito => getField<bool>('recebeuCredito');
  set recebeuCredito(bool? value) => setField<bool>('recebeuCredito', value);

  String? get pgdasRecibo => getField<String>('pgdasRecibo');
  set pgdasRecibo(String? value) => setField<String>('pgdasRecibo', value);

  String? get dfisDeclara => getField<String>('dfisDeclara');
  set dfisDeclara(String? value) => setField<String>('dfisDeclara', value);

  String? get dfisRecibo => getField<String>('dfisRecibo');
  set dfisRecibo(String? value) => setField<String>('dfisRecibo', value);

  String? get ecfFaturamento => getField<String>('ecfFaturamento');
  set ecfFaturamento(String? value) =>
      setField<String>('ecfFaturamento', value);

  String? get iRRecibo => getField<String>('IRRecibo');
  set iRRecibo(String? value) => setField<String>('IRRecibo', value);

  bool? get consultor => getField<bool>('consultor');
  set consultor(bool? value) => setField<bool>('consultor', value);

  bool? get gerente => getField<bool>('gerente');
  set gerente(bool? value) => setField<bool>('gerente', value);

  int? get pontos => getField<int>('pontos');
  set pontos(int? value) => setField<int>('pontos', value);

  bool? get bateuMeta => getField<bool>('bateu meta');
  set bateuMeta(bool? value) => setField<bool>('bateu meta', value);

  bool? get contador => getField<bool>('contador');
  set contador(bool? value) => setField<bool>('contador', value);

  bool? get nagociando => getField<bool>('nagociando');
  set nagociando(bool? value) => setField<bool>('nagociando', value);

  bool? get cliente => getField<bool>('cliente');
  set cliente(bool? value) => setField<bool>('cliente', value);

  bool? get adm => getField<bool>('adm');
  set adm(bool? value) => setField<bool>('adm', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);

  String? get uid => getField<String>('uid');
  set uid(String? value) => setField<String>('uid', value);
}
