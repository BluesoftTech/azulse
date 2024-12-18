import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'autochat_model.dart';
export 'autochat_model.dart';

class AutochatWidget extends StatefulWidget {
  const AutochatWidget({
    super.key,
    required this.conversa,
    required this.respostas,
  });

  final ConversasRow? conversa;
  final RespostasFormRow? respostas;

  @override
  State<AutochatWidget> createState() => _AutochatWidgetState();
}

class _AutochatWidgetState extends State<AutochatWidget> {
  late AutochatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AutochatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
                'Seja bem-vindo! Me chamo ${FFAppState().nomeRef}  e sou especialista em Crédito Empresarial da Azul Soluções Empresariais.  Preparei algumas perguntas para te ajudar da melhor maneira e de forma mais personalizada.  Vamos lá?',
          });
        }(),
      );
      unawaited(
        () async {
          await MensagensTable().insert({
            'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
            'ConversaRef': widget.conversa?.id.toString(),
            'autorRef': 'supporte',
            'mensagem': 'Qual é o seu nome?',
          });
        }(),
      );
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
      await _model.mensagens?.animateTo(
        _model.mensagens!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
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
        List<ConversasRow> autochatConversasRowList = snapshot.data!;

        final autochatConversasRow = autochatConversasRowList.isNotEmpty
            ? autochatConversasRowList.first
            : null;

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
                        autochatConversasRow?.id.toString(),
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
                                    16.0, 0.0, 16.0, 0.0),
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
                                      primary: false,
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
                                                            MainAxisSize.min,
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
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.75,
                                                              constraints:
                                                                  const BoxConstraints(
                                                                minHeight: 30.0,
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
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                              if (_model.p5 == true)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 0.0, 8.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          unawaited(
                                            () async {
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
                                                'mensagem': 'MEI',
                                              });
                                            }(),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          unawaited(
                                            () async {
                                              await RespostasFormTable().update(
                                                data: {
                                                  'porteEmpresa': 'MEI',
                                                },
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'id',
                                                  widget.respostas?.id,
                                                ),
                                              );
                                            }(),
                                          );
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          _model.typing = true;
                                          safeSetState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 3000));
                                          _model.typing = false;
                                          safeSetState(() {});
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'Tenho uma ótima notícia pra você ${_model.nome}! A sua empresa tem os pré-requisitos para conseguir um crédito de pelo até 28 mil reais!  Deseja prosseguir?',
                                              });
                                            }(),
                                          );
                                          _model.p5 = false;
                                          _model.p6 = true;
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                        },
                                        text: 'MEI',
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
                                            'ConversaRef': widget.conversa?.id
                                                .toString(),
                                            'created_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'autorRef': FFAppState()
                                                .clienteANON
                                                .toString(),
                                            'mensagem': 'Não MEI',
                                          });
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          await RespostasFormTable().update(
                                            data: {
                                              'porteEmpresa': 'Não MEI',
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              widget.respostas?.id,
                                            ),
                                          );
                                          safeSetState(() {
                                            _model.textController?.clear();
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
                                            'ConversaRef': widget.conversa?.id
                                                .toString(),
                                            'autorRef': 'supporte',
                                            'mensagem':
                                                'Tenho uma ótima notícia pra você ${_model.nome}! A sua empresa tem os pré-requisitos para conseguir um crédito a partir de 100 mil reais!  Esse crédito ajudaria a sua empresa?',
                                          });
                                          _model.p5 = false;
                                          _model.p6 = true;
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                        },
                                        text: 'Não MEI',
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
                              if (_model.p6 == true)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 0.0, 8.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          unawaited(
                                            () async {
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
                                            }(),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          _model.soundPlayer1 ??= AudioPlayer();
                                          if (_model.soundPlayer1!.playing) {
                                            await _model.soundPlayer1!.stop();
                                          }
                                          _model.soundPlayer1!.setVolume(1.0);
                                          await _model.soundPlayer1!
                                              .setAsset(
                                                  'assets/audios/Ding_-_Sound_Effect.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer1!.play());

                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          _model.typing = true;
                                          safeSetState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 3000));
                                          _model.typing = false;
                                          safeSetState(() {});
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'Então eu me comprometo a conseguir esse crédito para sua empresa ${_model.nome}!',
                                              });
                                            }(),
                                          );
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'mas para isso, eu preciso saber algumas informações da sua empresa, tudo bem?',
                                              });
                                            }(),
                                          );
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'Há quanto tempo a sua empresa está ativa?',
                                              });
                                            }(),
                                          );
                                          _model.p6 = false;
                                          _model.p7 = true;
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                          await Future.delayed(const Duration(
                                              milliseconds: 2000));
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
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
                                          unawaited(
                                            () async {
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
                                            }(),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          _model.typing = true;
                                          safeSetState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 3000));
                                          _model.typing = false;
                                          safeSetState(() {});
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'Eu entendo, é complicado confiar seus dados assim... Mas o que você acha de tomarmos um cafézinho ou fazermos uma vídeo chamada? Topa?',
                                              });
                                            }(),
                                          );
                                          _model.p6 = false;
                                          _model.dissenao = true;
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                          await Future.delayed(const Duration(
                                              milliseconds: 2000));
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
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
                              if (_model.dissenao == true)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 0.0, 8.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          unawaited(
                                            () async {
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
                                            }(),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          _model.typing = true;
                                          safeSetState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 3000));
                                          _model.typing = false;
                                          safeSetState(() {});
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'Então eu me comprometo a conseguir esse crédito para sua empresa ${_model.nome}!',
                                              });
                                            }(),
                                          );
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'mas para isso, eu preciso saber algumas informações da sua empresa, tudo bem?',
                                              });
                                            }(),
                                          );
                                          _model.p6 = false;
                                          _model.p7 = true;
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                          await Future.delayed(const Duration(
                                              milliseconds: 2000));
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                          _model.soundPlayer2 ??= AudioPlayer();
                                          if (_model.soundPlayer2!.playing) {
                                            await _model.soundPlayer2!.stop();
                                          }
                                          _model.soundPlayer2!.setVolume(1.0);
                                          await _model.soundPlayer2!
                                              .setAsset(
                                                  'assets/audios/Ding_-_Sound_Effect.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer2!.play());
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
                                          unawaited(
                                            () async {
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
                                            }(),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          safeSetState(() {
                                            _model.textController?.clear();
                                          });
                                          _model.typing = true;
                                          safeSetState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 3000));
                                          _model.typing = false;
                                          safeSetState(() {});
                                          unawaited(
                                            () async {
                                              await MensagensTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'ConversaRef': widget
                                                    .conversa?.id
                                                    .toString(),
                                                'autorRef': 'supporte',
                                                'mensagem':
                                                    'Eu entendo, é complicado confiar seus dados assim... Mas o que você acha de tomarmos um cafézinho ou fazermos uma vídeo chamada? Topa?',
                                              });
                                            }(),
                                          );
                                          _model.p6 = false;
                                          _model.p7 = true;
                                          safeSetState(() {});
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                          await Future.delayed(const Duration(
                                              milliseconds: 2000));
                                          unawaited(
                                            () async {
                                              await _model.mensagens?.animateTo(
                                                _model.mensagens!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    const Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            }(),
                                          );
                                        },
                                        text: 'Não, obrigado',
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 8.0,
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 4.0, 0.0),
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
                                    controller: _model.textController,
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
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.p1 == true)
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
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'autorRef':
                                            FFAppState().clienteANON.toString(),
                                        'mensagem': _model.textController.text,
                                      });
                                    }(),
                                  );
                                  unawaited(
                                    () async {
                                      await RespostasFormTable().update(
                                        data: {
                                          'nome': _model.textController.text,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.respostas?.id,
                                        ),
                                      );
                                    }(),
                                  );
                                  _model.nome = _model.textController.text;
                                  safeSetState(() {});
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.typing = true;
                                  safeSetState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 3000));
                                  _model.typing = false;
                                  safeSetState(() {});
                                  await Future.wait([
                                    Future(() async {
                                      unawaited(
                                        () async {
                                          await MensagensTable().insert({
                                            'created_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'ConversaRef': widget.conversa?.id
                                                .toString(),
                                            'autorRef': 'supporte',
                                            'mensagem':
                                                'Que bom que está aqui ${_model.nome}, O Diagnóstico Individual com um Especialista de Credito  é perfeito para você que quer obter capital de giro com os bancos tendo as melhores linhas de credito.  Depois de responder a algumas perguntas, o nosso sistema vai analisar suas respostas e verificar como podemos te ajudar da melhor forma possível.  Fazemos isso para garantir que a qualidade máxima do diagnóstico possa ser absorvida por todos.',
                                          });
                                        }(),
                                      );
                                    }),
                                    Future(() async {
                                      _model.soundPlayer3 ??= AudioPlayer();
                                      if (_model.soundPlayer3!.playing) {
                                        await _model.soundPlayer3!.stop();
                                      }
                                      _model.soundPlayer3!.setVolume(1.0);
                                      _model.soundPlayer3!
                                          .setAsset(
                                              'assets/audios/Ding_-_Sound_Effect.mp3')
                                          .then((_) =>
                                              _model.soundPlayer3!.play());
                                    }),
                                  ]);
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                  await Future.wait([
                                    Future(() async {
                                      unawaited(
                                        () async {
                                          await MensagensTable().insert({
                                            'created_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                            'ConversaRef': widget.conversa?.id
                                                .toString(),
                                            'autorRef': 'supporte',
                                            'mensagem':
                                                'Qual é o seu numero de whatsapp?',
                                          });
                                        }(),
                                      );
                                    }),
                                    Future(() async {
                                      _model.soundPlayer4 ??= AudioPlayer();
                                      if (_model.soundPlayer4!.playing) {
                                        await _model.soundPlayer4!.stop();
                                      }
                                      _model.soundPlayer4!.setVolume(1.0);
                                      _model.soundPlayer4!
                                          .setAsset(
                                              'assets/audios/Ding_-_Sound_Effect.mp3')
                                          .then((_) =>
                                              _model.soundPlayer4!.play());
                                    }),
                                  ]);
                                  _model.p1 = false;
                                  _model.p2 = true;
                                  safeSetState(() {});
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  unawaited(
                                    () async {
                                      await _model.mensagens?.animateTo(
                                        _model.mensagens!.position
                                            .maxScrollExtent,
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                    }(),
                                  );
                                },
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
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'autorRef':
                                            FFAppState().clienteANON.toString(),
                                        'mensagem': _model.textController.text,
                                      });
                                    }(),
                                  );
                                  unawaited(
                                    () async {
                                      await RespostasFormTable().update(
                                        data: {
                                          'contato': _model.textController.text,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.respostas?.id,
                                        ),
                                      );
                                    }(),
                                  );
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.typing = true;
                                  safeSetState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 3000));
                                  _model.typing = false;
                                  safeSetState(() {});
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'autorRef': 'supporte',
                                        'mensagem':
                                            'muito bem, preciso que responda algumas perguntas sobre você e o seu negócio...',
                                      });
                                    }(),
                                  );
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'autorRef': 'supporte',
                                        'mensagem': 'Qual é o seu CPF?',
                                      });
                                    }(),
                                  );
                                  _model.p2 = false;
                                  _model.p3 = true;
                                  safeSetState(() {});
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  unawaited(
                                    () async {
                                      await _model.mensagens?.animateTo(
                                        _model.mensagens!.position
                                            .maxScrollExtent,
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                    }(),
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
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'autorRef':
                                            FFAppState().clienteANON.toString(),
                                        'mensagem': _model.textController.text,
                                      });
                                    }(),
                                  );
                                  unawaited(
                                    () async {
                                      await RespostasFormTable().update(
                                        data: {
                                          'cpf': _model.textController.text,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.respostas?.id,
                                        ),
                                      );
                                    }(),
                                  );
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.typing = true;
                                  safeSetState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 6000));
                                  _model.typing = false;
                                  safeSetState(() {});
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'autorRef': 'supporte',
                                        'mensagem': 'E o CNPJ da sua empresa?',
                                      });
                                    }(),
                                  );
                                  _model.p3 = false;
                                  _model.p4 = true;
                                  safeSetState(() {});
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  unawaited(
                                    () async {
                                      await _model.mensagens?.animateTo(
                                        _model.mensagens!.position
                                            .maxScrollExtent,
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                    }(),
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
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'autorRef':
                                            FFAppState().clienteANON.toString(),
                                        'mensagem': _model.textController.text,
                                      });
                                    }(),
                                  );
                                  unawaited(
                                    () async {
                                      await RespostasFormTable().update(
                                        data: {
                                          'cnpj': _model.textController.text,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.conversa?.id,
                                        ),
                                      );
                                    }(),
                                  );
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.typing = true;
                                  safeSetState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 3000));
                                  _model.typing = false;
                                  safeSetState(() {});
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'autorRef': 'supporte',
                                        'mensagem': 'sua empresa é MEI?',
                                      });
                                    }(),
                                  );
                                  _model.p4 = false;
                                  _model.p5 = true;
                                  safeSetState(() {});
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  unawaited(
                                    () async {
                                      await _model.mensagens?.animateTo(
                                        _model.mensagens!.position
                                            .maxScrollExtent,
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                    }(),
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'responda através dos botões',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                },
                              ),
                            if ((widget.conversa?.auto == true) &&
                                (_model.p6 == true))
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
                                        'responda através dos botões',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                },
                              ),
                            if ((widget.conversa?.auto == true) &&
                                (_model.p7 == true))
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
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'autorRef':
                                            FFAppState().clienteANON.toString(),
                                        'mensagem': _model.textController.text,
                                      });
                                    }(),
                                  );
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  unawaited(
                                    () async {
                                      await RespostasFormTable().update(
                                        data: {
                                          'tempoAtividade':
                                              _model.textController.text,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.respostas?.id,
                                        ),
                                      );
                                    }(),
                                  );
                                  _model.soundPlayer5 ??= AudioPlayer();
                                  if (_model.soundPlayer5!.playing) {
                                    await _model.soundPlayer5!.stop();
                                  }
                                  _model.soundPlayer5!.setVolume(1.0);
                                  await _model.soundPlayer5!
                                      .setAsset(
                                          'assets/audios/Ding_-_Sound_Effect.mp3')
                                      .then((_) => _model.soundPlayer5!.play());

                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.typing = true;
                                  safeSetState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                  _model.typing = false;
                                  safeSetState(() {});
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'autorRef': 'supporte',
                                        'mensagem':
                                            'Parabéns ${_model.nome}, manter uma empresa assim não é fácil... você é realmente um vencedor!',
                                      });
                                    }(),
                                  );
                                  unawaited(
                                    () async {
                                      await _model.mensagens?.animateTo(
                                        _model.mensagens!.position
                                            .maxScrollExtent,
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );
                                    }(),
                                  );
                                  _model.typing = true;
                                  safeSetState(() {});
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                  _model.typing = false;
                                  safeSetState(() {});
                                  unawaited(
                                    () async {
                                      await MensagensTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'ConversaRef':
                                            widget.conversa?.id.toString(),
                                        'autorRef': 'supporte',
                                        'mensagem':
                                            'Eu acabei de enviar sua solicitação para nossa equipe de especialistas analisarem! Em breve entraremos em contato via whatsapp.',
                                      });
                                    }(),
                                  );
                                  _model.soundPlayer6 ??= AudioPlayer();
                                  if (_model.soundPlayer6!.playing) {
                                    await _model.soundPlayer6!.stop();
                                  }
                                  _model.soundPlayer6!.setVolume(1.0);
                                  await _model.soundPlayer6!
                                      .setAsset(
                                          'assets/audios/Ding_-_Sound_Effect.mp3')
                                      .then((_) => _model.soundPlayer6!.play());
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
