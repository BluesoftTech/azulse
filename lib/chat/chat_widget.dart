import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.conversa,
    required this.respostas,
  });

  final ConversasRow? conversa;
  final RespostasFormRow? respostas;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await MensagensTable().insert({
            'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
            'ConversaRef': widget.conversa?.id.toString(),
            'autorRef': FFAppState().clienteANON.toString(),
            'mensagem':
                'Oi, me interessei pelo serviço da Azul e gostaria de falar com um especialista de Crédito',
          });
        }(),
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.typing = true;
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 3000));
      _model.typing = false;
      safeSetState(() {});
      unawaited(
        () async {
          await MensagensTable().insert({
            'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
            'ConversaRef': widget.conversa?.id.toString(),
            'autorRef': 'supporte',
            'mensagem':
                'Opa! Você encontrou a empresa certa! Uma satisfação ter você aqui!  Como você se chama?',
          });
        }(),
      );
      _model.p1 = false;
      _model.p2 = true;
      safeSetState(() {});
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
      await _model.mensagens?.animateTo(
        _model.mensagens!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.nomeTextController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();

    _model.cpfTextController ??= TextEditingController();
    _model.cpfFocusNode ??= FocusNode();

    _model.contatoTextController ??= TextEditingController();
    _model.contatoFocusNode ??= FocusNode();

    _model.nomeEmpresaTextController ??= TextEditingController();
    _model.nomeEmpresaFocusNode ??= FocusNode();

    _model.cnpjTextController ??= TextEditingController();
    _model.cnpjFocusNode ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ConversasRow>>(
      future: ConversasTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'client_id',
          FFAppState().clienteANON.toString(),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<ConversasRow> chatConversasRowList = snapshot.data!;

        final chatConversasRow =
            chatConversasRowList.isNotEmpty ? chatConversasRowList.first : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 80.0),
                  child: FutureBuilder<List<MensagensRow>>(
                    future: MensagensTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'ConversaRef',
                        chatConversasRow?.id.toString(),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<MensagensRow> conteudoMensagensRowList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/BG-Home.jpg',
                            ).image,
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: _model.columnController,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: FutureBuilder<List<MensagensRow>>(
                                  future: (_model.requestCompleter ??=
                                          Completer<List<MensagensRow>>()
                                            ..complete(
                                                MensagensTable().queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'ConversaRef',
                                                    widget.conversa?.id
                                                        .toString(),
                                                  )
                                                  .order('created_at',
                                                      ascending: true),
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MensagensRow>
                                        mensagensMensagensRowList =
                                        snapshot.data!;

                                    return SingleChildScrollView(
                                      controller: _model.mensagens,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: List.generate(
                                            mensagensMensagensRowList.length,
                                            (mensagensIndex) {
                                          final mensagensMensagensRow =
                                              mensagensMensagensRowList[
                                                  mensagensIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                if (mensagensMensagensRow
                                                        .autorRef ==
                                                    'supporte')
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/2.jpeg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                if (mensagensMensagensRow
                                                        .autorRef !=
                                                    'supporte')
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/do-utilizador.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    if (mensagensMensagensRow
                                                            .texto ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 280.0,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  minHeight:
                                                                      30.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0x6639D2C0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      mensagensMensagensRow
                                                                          .mensagem,
                                                                      'mensagem',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "jm",
                                                                  mensagensMensagensRow
                                                                      .createdAt,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (mensagensMensagensRow
                                                            .video ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 280.0,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  minHeight:
                                                                      30.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0x6639D2C0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child:
                                                                      FlutterFlowVideoPlayer(
                                                                    path: mensagensMensagensRow
                                                                        .mensagem!,
                                                                    videoType:
                                                                        VideoType
                                                                            .network,
                                                                    autoPlay:
                                                                        false,
                                                                    looping:
                                                                        false,
                                                                    showControls:
                                                                        true,
                                                                    allowFullScreen:
                                                                        false,
                                                                    allowPlaybackSpeedMenu:
                                                                        true,
                                                                    lazyLoad:
                                                                        true,
                                                                    pauseOnNavigate:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "jm",
                                                                  mensagensMensagensRow
                                                                      .createdAt,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (mensagensMensagensRow
                                                            .imagem ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 280.0,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  minHeight:
                                                                      30.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0x6639D2C0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      mensagensMensagensRow
                                                                          .mensagem!,
                                                                      width:
                                                                          276.0,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "jm",
                                                                  mensagensMensagensRow
                                                                      .createdAt,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (mensagensMensagensRow
                                                            .audio ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 280.0,
                                                                constraints:
                                                                    const BoxConstraints(
                                                                  minHeight:
                                                                      30.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0x6639D2C0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child:
                                                                      FlutterFlowAudioPlayer(
                                                                    audio: Audio
                                                                        .network(
                                                                      mensagensMensagensRow
                                                                          .mensagem!,
                                                                      metas:
                                                                          Metas(
                                                                        title:
                                                                            'Áudio',
                                                                      ),
                                                                    ),
                                                                    titleTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    playbackDurationTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    playbackButtonColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    elevation:
                                                                        0.0,
                                                                    playInBackground:
                                                                        PlayInBackground
                                                                            .disabledPause,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "jm",
                                                                  mensagensMensagensRow
                                                                      .createdAt,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              if (_model.preencher == true)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 580.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.nomeTextController,
                                                focusNode: _model.nomeFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText:
                                                      'Nome completo do(s) sócio(s)\n',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .nomeTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.cpfTextController,
                                                focusNode: _model.cpfFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'CPF(s)',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .cpfTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  _model.cpfMask
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .contatoTextController,
                                                focusNode:
                                                    _model.contatoFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'Contato',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .contatoTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  _model.contatoMask
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .nomeEmpresaTextController,
                                                focusNode:
                                                    _model.nomeEmpresaFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'Nome da empresa',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .nomeEmpresaTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.cnpjTextController,
                                                focusNode: _model.cnpjFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'CNPJ',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .cnpjTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  _model.cnpjMask
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .porteValueController ??=
                                                  FormFieldController<String>(
                                                _model.porteValue ??= '',
                                              ),
                                              options: List<String>.from(
                                                  ['MEI', 'NÃO MEI']),
                                              optionLabels: const ['MEI', 'NÃO MEI'],
                                              onChanged: (val) => safeSetState(
                                                  () =>
                                                      _model.porteValue = val),
                                              width: 200.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'PORTE DA EMPRESA',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .tempoValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: const [
                                                'MENOS DE 1 ANO',
                                                'MAIS DE 1 ANO'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () =>
                                                      _model.tempoValue = val),
                                              width: 200.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'TEMPO DE ATIVIDADE',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .faturamentoValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: const [
                                                'ATÉ 250 MIL',
                                                'ENTRE 250 E 500 MIL',
                                                'ENTRE 500 MIL E 1 MILHÃO',
                                                'ACIMA DE 1 MILHÃO'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                      .faturamentoValue = val),
                                              width: 200.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'FAIXA DE FATURAMENTO ANUAL',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .creditoIdealValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: const [
                                                'DE 25 A 50 MIL',
                                                'DE 50 A 200 MIL',
                                                'DE 200 A 500 MIL',
                                                'ACIMA DE 500 MIL'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                      .creditoIdealValue = val),
                                              width: 200.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'CRÉDITO IDEAL',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await RespostasFormTable()
                                                    .update(
                                                  data: {
                                                    'tempoAtividade':
                                                        _model.tempoValue,
                                                    'porteEmpresa':
                                                        _model.porteValue,
                                                    'cpf': _model
                                                        .cpfTextController.text,
                                                    'cnpj': _model
                                                        .cnpjTextController
                                                        .text,
                                                    'faturamento':
                                                        _model.faturamentoValue,
                                                    'nome_completo': _model
                                                        .nomeEmpresaTextController
                                                        .text,
                                                    'valorDesejado': _model
                                                        .creditoIdealValue,
                                                    'contato': _model
                                                        .contatoTextController
                                                        .text,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    widget.respostas?.id,
                                                  ),
                                                );
                                                _model.formBasic = false;
                                                _model.porte =
                                                    _model.porteValue;
                                                _model.preencher = false;
                                                safeSetState(() {});
                                                await MensagensTable().insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'ConversaRef': widget
                                                      .conversa?.id
                                                      .toString(),
                                                  'autorRef': FFAppState()
                                                      .clienteANON
                                                      .toString(),
                                                  'mensagem': 'Feito!',
                                                });
                                                _model.typing = true;
                                                safeSetState(() {});
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 2000));
                                                _model.typing = false;
                                                _model.p3 = false;
                                                _model.p4 = true;
                                                safeSetState(() {});
                                                if (_model.porte == 'MEI') {
                                                  await MensagensTable()
                                                      .insert({
                                                    'created_at': supaSerialize<
                                                            DateTime>(
                                                        getCurrentTimestamp),
                                                    'ConversaRef': widget
                                                        .conversa?.id
                                                        .toString(),
                                                    'autorRef': 'supporte',
                                                    'mensagem':
                                                        '${_model.nome}, eu tenho uma ótima notícia pra você!  Com base nas informações que você me forneceu, sua empresa cumpre os pré-requisitos para acessar um crédito de até 30 mil reais!',
                                                  });
                                                } else {
                                                  await MensagensTable()
                                                      .insert({
                                                    'created_at': supaSerialize<
                                                            DateTime>(
                                                        getCurrentTimestamp),
                                                    'ConversaRef': widget
                                                        .conversa?.id
                                                        .toString(),
                                                    'autorRef': 'supporte',
                                                    'mensagem':
                                                        '${_model.nome}, eu tenho uma ótima notícia pra você!  Com base nas informações que você me forneceu, sua empresa cumpre os pré-requisitos para acessar um crédito acima 50 mil reais!',
                                                  });
                                                }

                                                await MensagensTable().insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'ConversaRef': widget
                                                      .conversa?.id
                                                      .toString(),
                                                  'autorRef': 'supporte',
                                                  'mensagem':
                                                      'Tudo certo por enquanto ${_model.nome}, Fique atento ao seu WhatsApp, porque muito em breve, eu ou um de nossos especialistas entrará em contato com você para lhe entregar o seu diagnóstico de crédito',
                                                });
                                                await MensagensTable().insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'ConversaRef': widget
                                                      .conversa?.id
                                                      .toString(),
                                                  'autorRef': 'supporte',
                                                  'mensagem':
                                                      'A Azul funciona como uma ponte entre você, empresário(a), e o Banco, e a nossa função é instruir, desburocratizar e preparar a sua empresa rumo ao crédito sustentável.',
                                                });
                                                await MensagensTable().insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'ConversaRef': widget
                                                      .conversa?.id
                                                      .toString(),
                                                  'autorRef': 'supporte',
                                                  'mensagem':
                                                      'Nós vamos te ajudar a ser o cliente dos sonhos de QUALQUER BANCO!  E nunca mais a resposta ao crédito que você precisa será NÃO!',
                                                });
                                                await MensagensTable().insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'ConversaRef': widget
                                                      .conversa?.id
                                                      .toString(),
                                                  'autorRef': 'supporte',
                                                  'mensagem':
                                                      '${_model.nome}, eu já encaminhei sua solicitação para os setores responsáveis, em até 12 horas você receberá no seu whatsapp',
                                                });
                                                await MensagensTable().insert({
                                                  'created_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                  'ConversaRef': widget
                                                      .conversa?.id
                                                      .toString(),
                                                  'autorRef': 'supporte',
                                                  'mensagem':
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/nome-azul-uqoueq/assets/4tkqn7hw1j47/escritorioo.mp4',
                                                  'texto': false,
                                                  'vídeo': true,
                                                });
                                                safeSetState(() => _model
                                                    .requestCompleter = null);
                                                await _model
                                                    .waitForRequestCompleted();
                                                _model.p4 = true;
                                                safeSetState(() {});
                                              },
                                              text: 'Enviar',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.formBasic == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 0.0, 8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.preencher = true;
                                            safeSetState(() {});
                                          },
                                          text: 'Preencher formulário',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (_model.p3 == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 0.0, 8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await MensagensTable().insert({
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'autorRef': FFAppState()
                                                  .clienteANON
                                                  .toString(),
                                              'mensagem': 'Sim',
                                            });
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            safeSetState(() {
                                              _model.textController6?.clear();
                                            });
                                            _model.typing = true;
                                            safeSetState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                            _model.typing = false;
                                            safeSetState(() {});
                                            await MensagensTable().insert({
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'autorRef': 'supporte',
                                              'mensagem':
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/nome-azul-uqoueq/assets/a6r418rr7lnt/video_Prata~2.mp4',
                                              'vídeo': true,
                                              'texto': false,
                                            });
                                            await Future.delayed(const Duration(
                                                milliseconds: 1000));
                                            _model.formBasic = true;
                                            safeSetState(() {});
                                            _model.p3 = false;
                                            safeSetState(() {});
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: 'Sim',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 0.0, 8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await MensagensTable().insert({
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'autorRef': FFAppState()
                                                  .clienteANON
                                                  .toString(),
                                              'mensagem': 'Não',
                                            });
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            safeSetState(() {
                                              _model.textController6?.clear();
                                            });
                                            _model.typing = true;
                                            safeSetState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                            _model.typing = false;
                                            safeSetState(() {});
                                            await MensagensTable().insert({
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'autorRef': 'supporte',
                                              'mensagem':
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/nome-azul-uqoueq/assets/jbylqpspbsxz/Topa.mp3',
                                              'texto': false,
                                              'audio': true,
                                            });
                                            await MensagensTable().insert({
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'autorRef': 'supporte',
                                              'mensagem':
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/nome-azul-uqoueq/assets/5s2myymdgdm6/cafezin.jpg',
                                              'texto': false,
                                              'imagem': true,
                                            });
                                            _model.p3 = false;
                                            _model.nao = true;
                                            safeSetState(() {});
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: 'Não',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (_model.nao == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 0.0, 8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.nao = false;
                                            safeSetState(() {});
                                            await MensagensTable().insert({
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'autorRef': FFAppState()
                                                  .clienteANON
                                                  .toString(),
                                              'mensagem': 'Topo!',
                                            });
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            safeSetState(() {
                                              _model.textController6?.clear();
                                            });
                                            _model.typing = true;
                                            safeSetState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                            _model.typing = false;
                                            safeSetState(() {});
                                            await MensagensTable().insert({
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'autorRef': 'supporte',
                                              'mensagem':
                                                  'Show de bola ${_model.nome}, deixe o seu Whatsapp e em breve eu entrarei em contato!',
                                            });
                                            _model.p4 = false;
                                            _model.topo = true;
                                            safeSetState(() {});
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            _model.topo = true;
                                            safeSetState(() {});
                                          },
                                          text: 'Topo!',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 0.0, 8.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.nao = false;
                                            safeSetState(() {});
                                            await MensagensTable().insert({
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'autorRef': FFAppState()
                                                  .clienteANON
                                                  .toString(),
                                              'mensagem': 'Melhor não',
                                            });
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            safeSetState(() {
                                              _model.textController6?.clear();
                                            });
                                            _model.typing = true;
                                            safeSetState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 3000));
                                            _model.typing = false;
                                            safeSetState(() {});
                                            await MensagensTable().insert({
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'ConversaRef': widget
                                                  .conversa?.id
                                                  .toString(),
                                              'autorRef': 'supporte',
                                              'mensagem':
                                                  'Entendo, caso mude de ideia no futuro, clique no botão abaixo:',
                                              'texto': true,
                                            });
                                            _model.p4 = false;
                                            _model.melhorNao = true;
                                            safeSetState(() {});
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));
                                            await _model.mensagens?.animateTo(
                                              _model.mensagens!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          },
                                          text: 'Melhor não',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (_model.melhorNao == true)
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.melhorNao = false;
                                          safeSetState(() {});

                                          context.goNamed(
                                            'prechat',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Mudei de ideia',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_model.formBasic == false)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8.0,
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 4.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: SizedBox(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController6,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Escreva aqui',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textController6Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              if ((widget.conversa?.auto == true) &&
                                  (_model.p2 == true))
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 24.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await MensagensTable().insert({
                                      'ConversaRef':
                                          widget.conversa?.id.toString(),
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'autorRef':
                                          FFAppState().clienteANON.toString(),
                                      'mensagem': _model.textController6.text,
                                    });
                                    await RespostasFormTable().update(
                                      data: {
                                        'nome': _model.textController6.text,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget.respostas?.id,
                                      ),
                                    );
                                    _model.nome = _model.textController6.text;
                                    safeSetState(() {});
                                    safeSetState(
                                        () => _model.requestCompleter = null);
                                    await _model.waitForRequestCompleted();
                                    safeSetState(() {
                                      _model.textController6?.clear();
                                    });
                                    _model.typing = true;
                                    safeSetState(() {});
                                    await Future.delayed(
                                        const Duration(milliseconds: 3000));
                                    _model.typing = false;
                                    safeSetState(() {});
                                    await MensagensTable().insert({
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'ConversaRef':
                                          widget.conversa?.id.toString(),
                                      'autorRef': 'supporte',
                                      'mensagem':
                                          'Oi ${_model.nome}, sou Italo Prata, há alguns anos trabalho com Crédito para empresas e graças a Deus, a Azul SE tem ajudado muitos empresários, principalmente no nordeste, a ter acesso as melhores linhas de crédito do mercado.',
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    await MensagensTable().insert({
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'ConversaRef':
                                          widget.conversa?.id.toString(),
                                      'autorRef': 'supporte',
                                      'mensagem':
                                          'Para que eu possa te oferecer um atendimento VIP, eu preciso de algumas informações, mas fique tranquilo! Nós conhecemos e respeitamos a Lei Geral de Proteção de Dados (LGPD) Art. 17.',
                                    });
                                    await MensagensTable().insert({
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'ConversaRef':
                                          widget.conversa?.id.toString(),
                                      'autorRef': 'supporte',
                                      'mensagem': 'Podemos continuar?',
                                    });
                                    _model.p2 = false;
                                    _model.p3 = true;
                                    safeSetState(() {});
                                    safeSetState(
                                        () => _model.requestCompleter = null);
                                    await _model.waitForRequestCompleted();
                                    await _model.mensagens?.animateTo(
                                      _model
                                          .mensagens!.position.maxScrollExtent,
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    await _model.mensagens?.animateTo(
                                      _model
                                          .mensagens!.position.maxScrollExtent,
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                  },
                                ),
                              if ((widget.conversa?.auto == true) &&
                                  (_model.p3 == true))
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 24.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Responda através dos botões',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  },
                                ),
                              if ((widget.conversa?.auto == true) &&
                                  (_model.p4 == true))
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 24.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Responda através dos botões',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  },
                                ),
                              if ((widget.conversa?.auto == true) &&
                                  (_model.p5 == true))
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 24.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await MensagensTable().update(
                                      data: {
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'autorRef':
                                            FFAppState().clienteANON.toString(),
                                        'mensagem': _model.textController6.text,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'ConversaRef',
                                        widget.conversa?.id.toString(),
                                      ),
                                    );
                                  },
                                ),
                              if ((widget.conversa?.auto == true) &&
                                  (_model.topo == true))
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 24.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await RespostasFormTable().update(
                                      data: {
                                        'contato': _model.textController6.text,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        chatConversasRow?.id,
                                      ),
                                    );
                                    await MensagensTable().insert({
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'ConversaRef':
                                          chatConversasRow?.id.toString(),
                                      'autorRef':
                                          FFAppState().clienteANON.toString(),
                                      'mensagem': _model.textController6.text,
                                    });
                                    safeSetState(() {
                                      _model.textController6?.clear();
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  child: Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/2.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Azul Soluções Empresariais',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'Online',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              if (_model.typing == true)
                                Text(
                                  'Digitando...',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 14.0, 0.0, 0.0),
                            child: Icon(
                              Icons.verified_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
