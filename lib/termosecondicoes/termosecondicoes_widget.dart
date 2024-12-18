import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart';
import 'termosecondicoes_model.dart';
export 'termosecondicoes_model.dart';

class TermosecondicoesWidget extends StatefulWidget {
  const TermosecondicoesWidget({super.key});

  @override
  State<TermosecondicoesWidget> createState() => _TermosecondicoesWidgetState();
}

class _TermosecondicoesWidgetState extends State<TermosecondicoesWidget> {
  late TermosecondicoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermosecondicoesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(1.0);
      _model.soundPlayer!
          .setAsset(
              'assets/audios/Notificao_de_venda_Hotmart_Venda_Realizada.mp3')
          .then((_) => _model.soundPlayer!.play());
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Termos e Condições de uso',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                    child: Text(
                      'Termos de uso',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 26.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Azul Soluções Empresariais \nÚltima atualização: 10/09/2024\n\nBem-vindo ao aplicativo **Azul Soluções Empresariais**. Ao utilizar este aplicativo, você concorda em seguir e estar vinculado aos seguintes Termos e Condições de Uso. Por favor, leia-os atentamente antes de continuar a usar o aplicativo. Se você não concordar com algum dos termos, solicitamos que não utilize nossos serviços.\n\n# 1. **Objetivo do Aplicativo**\nO aplicativo **Azul Soluções Empresariais** tem como objetivo auxiliar empresas com CNPJ ativo a enviar documentos e informações empresariais para a busca de crédito junto a instituições financeiras. A plataforma facilita o envio de informações e a comunicação com parceiros financeiros.\n\n# 2. **Uso do Aplicativo**\nAo usar o aplicativo, o usuário se compromete a fornecer informações precisas e verídicas sobre a sua empresa, incluindo, mas não se limitando a, documentos como balanços financeiros, contratos sociais e declarações fiscais.\n\n- O usuário deve ser maior de 18 anos e representante legal da empresa para enviar dados.\n- O uso do aplicativo é exclusivo para empresas que desejam buscar crédito empresarial.\n- O envio de informações fraudulentas ou imprecisas poderá resultar na suspensão do uso do aplicativo.\n\n# 3. **Envio de Documentos e Informações**\nO usuário é responsável pelo envio dos documentos empresariais necessários para a análise de crédito. Todos os documentos e informações enviadas serão utilizados exclusivamente para fins de avaliação de crédito e de conformidade com as normas das instituições financeiras parceiras.\n\n- O aplicativo poderá solicitar cópias digitais de documentos como: CNPJ, certidões negativas, demonstrativos financeiros, contratos e outros documentos relevantes para a análise.\n- Ao enviar as informações, o usuário concede autorização à Azul Soluções Empresariais para compartilhar tais documentos com terceiros, respeitando as políticas de privacidade descritas.\n\n# 4. **Privacidade e Confidencialidade**\nA Azul Soluções Empresariais compromete-se a proteger a privacidade dos dados fornecidos pelos usuários. Os documentos e informações enviados serão armazenados com segurança e somente utilizados para os fins descritos nestes Termos.\n\n- Os dados serão compartilhados apenas com as instituições financeiras e parceiros necessários para a busca de crédito.\n- O usuário reconhece que, apesar de todos os esforços de segurança, nenhuma transmissão de dados pela internet é 100% segura. Portanto, a Azul Soluções Empresariais não pode garantir a total segurança das informações transmitidas.\n\n# 5. **Responsabilidades do Usuário**\nO usuário é o único responsável pela veracidade e autenticidade dos documentos e informações enviados. A Azul Soluções Empresariais não se responsabiliza pela concessão ou negativa de crédito por parte das instituições financeiras.\n\n- O usuário concorda em isentar a Azul Soluções Empresariais de qualquer responsabilidade em relação à avaliação de crédito realizada por terceiros.\n- Em caso de rescisão ou encerramento do contrato com a instituição financeira parceira, o usuário assume todos os encargos e responsabilidades decorrentes de sua decisão.\n\n# 6. **Propriedade Intelectual**\nTodos os direitos sobre o conteúdo, layout, design e funcionalidades do aplicativo pertencem à **Azul Soluções Empresariais**. É proibido o uso, reprodução ou distribuição não autorizada de qualquer material do aplicativo.\n\n# 7. **Sigilo e Direitos Autorais**\nA Azul Soluções Empresariais compromete-se a manter o sigilo sobre os dados e documentos enviados pelos usuários. É vedada a comercialização, compartilhamento ou desenvolvimento de soluções semelhantes com base nas informações confidenciais fornecidas por cada cliente.\n\n# 8. **Alterações nos Termos e Condições**\nA **Azul Soluções Empresariais** reserva-se o direito de alterar estes Termos e Condições a qualquer momento, mediante aviso prévio aos usuários. É responsabilidade do usuário manter-se atualizado sobre as possíveis modificações.\n\n# 9. **Rescisão de Uso**\nO descumprimento de qualquer um dos termos aqui mencionados poderá resultar na suspensão ou no cancelamento do acesso ao aplicativo, sem aviso prévio.\n\n# 10. **Legislação Aplicável**\nEstes Termos e Condições de Uso serão regidos pelas leis do Brasil. Qualquer disputa decorrente do uso do aplicativo será resolvida no foro da cidade de Aracaju, Sergipe, Brasil.\n\n# 11. **Contato**\nEm caso de dúvidas sobre os Termos e Condições, entre em contato conosco através do e-mail: suporteapp@azulse.com.br\n\n\n\n',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
