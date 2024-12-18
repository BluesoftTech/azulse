import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "nome_completo" field.
  String? _nomeCompleto;
  String get nomeCompleto => _nomeCompleto ?? '';
  bool hasNomeCompleto() => _nomeCompleto != null;

  // "frente_RG" field.
  String? _frenteRG;
  String get frenteRG => _frenteRG ?? '';
  bool hasFrenteRG() => _frenteRG != null;

  // "verso_RG" field.
  String? _versoRG;
  String get versoRG => _versoRG ?? '';
  bool hasVersoRG() => _versoRG != null;

  // "CPF" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "OK" field.
  bool? _ok;
  bool get ok => _ok ?? false;
  bool hasOk() => _ok != null;

  // "adm" field.
  bool? _adm;
  bool get adm => _adm ?? false;
  bool hasAdm() => _adm != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "enviouDocs" field.
  bool? _enviouDocs;
  bool get enviouDocs => _enviouDocs ?? false;
  bool hasEnviouDocs() => _enviouDocs != null;

  // "nomeLimpo" field.
  bool? _nomeLimpo;
  bool get nomeLimpo => _nomeLimpo ?? false;
  bool hasNomeLimpo() => _nomeLimpo != null;

  // "CNPJLIMPO" field.
  bool? _cnpjlimpo;
  bool get cnpjlimpo => _cnpjlimpo ?? false;
  bool hasCnpjlimpo() => _cnpjlimpo != null;

  // "CNPJAprovado" field.
  bool? _cNPJAprovado;
  bool get cNPJAprovado => _cNPJAprovado ?? false;
  bool hasCNPJAprovado() => _cNPJAprovado != null;

  // "NomeEmpresa" field.
  String? _nomeEmpresa;
  String get nomeEmpresa => _nomeEmpresa ?? '';
  bool hasNomeEmpresa() => _nomeEmpresa != null;

  // "CNPJ" field.
  String? _cnpj;
  String get cnpj => _cnpj ?? '';
  bool hasCnpj() => _cnpj != null;

  // "Faturamento" field.
  String? _faturamento;
  String get faturamento => _faturamento ?? '';
  bool hasFaturamento() => _faturamento != null;

  // "DocCNPJ" field.
  String? _docCNPJ;
  String get docCNPJ => _docCNPJ ?? '';
  bool hasDocCNPJ() => _docCNPJ != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "userRefs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nomeCompleto = snapshotData['nome_completo'] as String?;
    _frenteRG = snapshotData['frente_RG'] as String?;
    _versoRG = snapshotData['verso_RG'] as String?;
    _cpf = snapshotData['CPF'] as String?;
    _ok = snapshotData['OK'] as bool?;
    _adm = snapshotData['adm'] as bool?;
    _tag = snapshotData['tag'] as String?;
    _enviouDocs = snapshotData['enviouDocs'] as bool?;
    _nomeLimpo = snapshotData['nomeLimpo'] as bool?;
    _cnpjlimpo = snapshotData['CNPJLIMPO'] as bool?;
    _cNPJAprovado = snapshotData['CNPJAprovado'] as bool?;
    _nomeEmpresa = snapshotData['NomeEmpresa'] as String?;
    _cnpj = snapshotData['CNPJ'] as String?;
    _faturamento = snapshotData['Faturamento'] as String?;
    _docCNPJ = snapshotData['DocCNPJ'] as String?;
    _status = snapshotData['status'] as bool?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _userRefs = getDataList(snapshotData['userRefs']);
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nomeCompleto,
  String? frenteRG,
  String? versoRG,
  String? cpf,
  bool? ok,
  bool? adm,
  String? tag,
  bool? enviouDocs,
  bool? nomeLimpo,
  bool? cnpjlimpo,
  bool? cNPJAprovado,
  String? nomeEmpresa,
  String? cnpj,
  String? faturamento,
  String? docCNPJ,
  bool? status,
  DocumentReference? userRef,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'nome_completo': nomeCompleto,
      'frente_RG': frenteRG,
      'verso_RG': versoRG,
      'CPF': cpf,
      'OK': ok,
      'adm': adm,
      'tag': tag,
      'enviouDocs': enviouDocs,
      'nomeLimpo': nomeLimpo,
      'CNPJLIMPO': cnpjlimpo,
      'CNPJAprovado': cNPJAprovado,
      'NomeEmpresa': nomeEmpresa,
      'CNPJ': cnpj,
      'Faturamento': faturamento,
      'DocCNPJ': docCNPJ,
      'status': status,
      'userRef': userRef,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nomeCompleto == e2?.nomeCompleto &&
        e1?.frenteRG == e2?.frenteRG &&
        e1?.versoRG == e2?.versoRG &&
        e1?.cpf == e2?.cpf &&
        e1?.ok == e2?.ok &&
        e1?.adm == e2?.adm &&
        e1?.tag == e2?.tag &&
        e1?.enviouDocs == e2?.enviouDocs &&
        e1?.nomeLimpo == e2?.nomeLimpo &&
        e1?.cnpjlimpo == e2?.cnpjlimpo &&
        e1?.cNPJAprovado == e2?.cNPJAprovado &&
        e1?.nomeEmpresa == e2?.nomeEmpresa &&
        e1?.cnpj == e2?.cnpj &&
        e1?.faturamento == e2?.faturamento &&
        e1?.docCNPJ == e2?.docCNPJ &&
        e1?.status == e2?.status &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.userRefs, e2?.userRefs) &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.nomeCompleto,
        e?.frenteRG,
        e?.versoRG,
        e?.cpf,
        e?.ok,
        e?.adm,
        e?.tag,
        e?.enviouDocs,
        e?.nomeLimpo,
        e?.cnpjlimpo,
        e?.cNPJAprovado,
        e?.nomeEmpresa,
        e?.cnpj,
        e?.faturamento,
        e?.docCNPJ,
        e?.status,
        e?.userRef,
        e?.userRefs,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
