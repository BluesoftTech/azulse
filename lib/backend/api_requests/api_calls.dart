import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Brasil API Group Code

class BrasilAPIGroup {
  static String getBaseUrl() => 'https://brasilapi.com.br/api';
  static Map<String, String> headers = {};
  static BuscaPorCNPJNaAPIMinhaReceitaCall buscaPorCNPJNaAPIMinhaReceitaCall =
      BuscaPorCNPJNaAPIMinhaReceitaCall();
  static RetornaAsCorretorasNosArquivosDaCVMCall
      retornaAsCorretorasNosArquivosDaCVMCall =
      RetornaAsCorretorasNosArquivosDaCVMCall();
  static BuscaPorCorretorasNosArquivosDaCVMCall
      buscaPorCorretorasNosArquivosDaCVMCall =
      BuscaPorCorretorasNosArquivosDaCVMCall();
}

class BuscaPorCNPJNaAPIMinhaReceitaCall {
  Future<ApiCallResponse> call({
    String? cnpj = '',
  }) async {
    final baseUrl = BrasilAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Busca por CNPJ na API Minha Receita.',
      apiUrl: '$baseUrl/cnpj/v1/$cnpj',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'cnpj': cnpj,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  String? cep(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cep''',
      ));
  List? qsa(dynamic response) => getJsonField(
        response,
        r'''$.qsa''',
        true,
      ) as List?;
  List<String>? nomesocio(dynamic response) => (getJsonField(
        response,
        r'''$.qsa[:].nome_socio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? codigopais(dynamic response) => getJsonField(
        response,
        r'''$.qsa[:].codigo_pais''',
        true,
      ) as List?;
  List<String>? cnpjcpfdosocio(dynamic response) => (getJsonField(
        response,
        r'''$.qsa[:].cnpj_cpf_do_socio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? cnpj(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cnpj''',
      ));
  String? porte(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.porte''',
      ));
  String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  String? num(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.numero''',
      ));
  String? municipio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.municipio''',
      ));
  String? logradouro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  int? cnae(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.cnae_fiscal''',
      ));
  String? complemento(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.complemento''',
      ));
  int? codigoPorte(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.codigo_porte''',
      ));
  String? razaoSocial(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.razao_social''',
      ));
  int? capitalSocial(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.capital_social''',
      ));
  int? codMuni(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.codigo_municipio''',
      ));
  List? cnaeSecond(dynamic response) => getJsonField(
        response,
        r'''$.cnaes_secundarios''',
        true,
      ) as List?;
  int? situacaoCadastral(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.situacao_cadastral''',
      ));
  String? dataSituaCadast(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data_situacao_cadastral''',
      ));
  String? descSituaCadas(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.descricao_situacao_cadastral''',
      ));
  String? motivSituaCadas(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.descricao_motivo_situacao_cadastral''',
      ));
  String? contato(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ddd_telefone_1''',
      ));
  bool? enquadrado(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.opcao_pelo_mei''',
      ));
}

class RetornaAsCorretorasNosArquivosDaCVMCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = BrasilAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Retorna as corretoras nos arquivos da CVM.',
      apiUrl: '$baseUrl/cvm/corretoras/v1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscaPorCorretorasNosArquivosDaCVMCall {
  Future<ApiCallResponse> call({
    String? cnpj = '',
  }) async {
    final baseUrl = BrasilAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Busca por corretoras nos arquivos da CVM.',
      apiUrl: '$baseUrl/cvm/corretoras/v1/$cnpj',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Brasil API Group Code

class InserirUsuarioCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$senha"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'inserir usuario',
      apiUrl: 'https://tylnnpcniuxzsavqhpzb.supabase.co/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR5bG5ucGNuaXV4enNhdnFocHpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI2MDkyMDMsImV4cCI6MjAzODE4NTIwM30.MLeykKkvjnxcszADA19L0ywXv6WTcXhlD534i7jdRgg',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
