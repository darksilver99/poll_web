import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/checkbox_answer_view_widget.dart';
import '/components/radio_answer_view_widget.dart';
import '/components/text_field_answer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    this.qrCode,
  });

  final String? qrCode;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pollResult = await actions.checkIsCorrectQrCode(
        widget!.qrCode,
      );
      if (_model.pollResult != null) {
        FFAppState().tmpAnswerList = [];
        _model.pollDocument = _model.pollResult;
        while (
            _model.tmpAnswerIndex! < _model.pollDocument!.questionList.length) {
          FFAppState().addToTmpAnswerList(AnswerDataStruct(
            answer: [],
            questionType:
                (_model.pollDocument?.questionList?[_model.tmpAnswerIndex!])
                    ?.type,
          ));
          safeSetState(() {});
          _model.tmpAnswerIndex = _model.tmpAnswerIndex! + 1;
          _model.addToPassList(true);
        }
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ไม่มีรายการนี้แล้ว'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('ตกลง'),
                ),
              ],
            );
          },
        );
      }
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
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (!_model.isLoading)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return MediaQuery.sizeOf(context).width;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return MediaQuery.sizeOf(context).width;
                          } else {
                            return 800.0;
                          }
                        }(),
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height * 1.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.pollDocument?.subject,
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_model.pollDocument?.detail != null &&
                                  _model.pollDocument?.detail != '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.pollDocument?.detail,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              if (_model.pollDocument?.startDate != null)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.clock,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          functions.dateTh(_model.pollDocument
                                                      ?.startDate) !=
                                                  functions.dateTh(_model
                                                      .pollDocument?.endDate)
                                              ? 'ระยะเวลา ${valueOrDefault<String>(
                                                  functions.dateTh(_model
                                                      .pollDocument?.startDate),
                                                  '-',
                                                )} - ${valueOrDefault<String>(
                                                  functions.dateTh(_model
                                                      .pollDocument?.endDate),
                                                  '-',
                                                )}'
                                              : 'ระยะเวลา ${valueOrDefault<String>(
                                                  functions.dateTh(_model
                                                      .pollDocument?.startDate),
                                                  '-',
                                                )}',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Builder(
                                  builder: (context) {
                                    final questionListView = _model
                                            .pollDocument?.questionList
                                            ?.toList() ??
                                        [];

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(questionListView.length,
                                              (questionListViewIndex) {
                                        final questionListViewItem =
                                            questionListView[
                                                questionListViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (!_model.passList[
                                                        questionListViewIndex])
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.error_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    Expanded(
                                                      child: Text(
                                                        questionListViewItem
                                                            .topic,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (questionListViewItem
                                                            .type ==
                                                        1) {
                                                      return wrapWithModel(
                                                        model: _model
                                                            .textFieldAnswerViewModels
                                                            .getModel(
                                                          questionListViewIndex
                                                              .toString(),
                                                          questionListViewIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            TextFieldAnswerViewWidget(
                                                          key: Key(
                                                            'Key5z6_${questionListViewIndex.toString()}',
                                                          ),
                                                          itemIndex:
                                                              questionListViewIndex,
                                                        ),
                                                      );
                                                    } else if (questionListViewItem
                                                            .type ==
                                                        2) {
                                                      return Container(
                                                        child:
                                                            RadioAnswerViewWidget(
                                                          key: Key(
                                                              'Keycj8_${questionListViewIndex}_of_${questionListView.length}'),
                                                          itemIndex:
                                                              questionListViewIndex,
                                                          optionList:
                                                              questionListViewItem
                                                                  .optionList,
                                                        ),
                                                      );
                                                    } else {
                                                      return Container(
                                                        child:
                                                            CheckboxAnswerViewWidget(
                                                          key: Key(
                                                              'Key6f6_${questionListViewIndex}_of_${questionListView.length}'),
                                                          itemIndex:
                                                              questionListViewIndex,
                                                          optionList:
                                                              questionListViewItem
                                                                  .optionList,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 32.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.tmpAnswerIndex = 0;
                                    while (_model.tmpAnswerIndex! <
                                        FFAppState().tmpAnswerList.length) {
                                      if (FFAppState()
                                          .tmpAnswerList[_model.tmpAnswerIndex!]
                                          .answer
                                          .isNotEmpty) {
                                        _model.updatePassListAtIndex(
                                          _model.tmpAnswerIndex!,
                                          (_) => true,
                                        );
                                      } else {
                                        _model.updatePassListAtIndex(
                                          _model.tmpAnswerIndex!,
                                          (_) => false,
                                        );
                                      }

                                      _model.tmpAnswerIndex =
                                          _model.tmpAnswerIndex! + 1;
                                    }
                                    if (_model.passList.contains(false)) {
                                      safeSetState(() {});
                                    } else {
                                      await AnswerListRecord.createDoc(_model
                                              .pollDocument!.parentReference)
                                          .set({
                                        ...createAnswerListRecordData(
                                          createDate: getCurrentTimestamp,
                                          pollRef:
                                              _model.pollDocument?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answers':
                                                getAnswerDataListFirestoreData(
                                              FFAppState().tmpAnswerList,
                                            ),
                                          },
                                        ),
                                      });

                                      await _model.pollDocument!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'total_answer':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });

                                      context.goNamed('FinishPollPage');
                                    }
                                  },
                                  text: 'ส่งข้อมูล',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 57.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 8.0))
                                .addToEnd(SizedBox(height: 32.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '© 2024 ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: 'Anusorn Kongthong. ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await launchURL(
                                      'https://anusorn-profile.web.app');
                                },
                            ),
                            TextSpan(
                              text: 'All rights reserved.',
                              style: TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
