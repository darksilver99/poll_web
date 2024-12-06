import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkbox_answer_view_model.dart';
export 'checkbox_answer_view_model.dart';

class CheckboxAnswerViewWidget extends StatefulWidget {
  const CheckboxAnswerViewWidget({
    super.key,
    this.optionList,
    required this.itemIndex,
  });

  final List<String>? optionList;
  final int? itemIndex;

  @override
  State<CheckboxAnswerViewWidget> createState() =>
      _CheckboxAnswerViewWidgetState();
}

class _CheckboxAnswerViewWidgetState extends State<CheckboxAnswerViewWidget> {
  late CheckboxAnswerViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxAnswerViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
      child: Builder(
        builder: (context) {
          final optionListView = widget!.optionList?.toList() ?? [];

          return Column(
            mainAxisSize: MainAxisSize.max,
            children:
                List.generate(optionListView.length, (optionListViewIndex) {
              final optionListViewItem = optionListView[optionListViewIndex];
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      if (FFAppState()
                          .tmpAnswerList[widget!.itemIndex!]
                          .answer
                          .contains(optionListViewItem)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await _model.checkData(
                                context,
                                answer: optionListViewItem,
                              );
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.check_box,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 28.0,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await _model.checkData(
                                context,
                                answer: optionListViewItem,
                              );
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.check_box_outline_blank,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28.0,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Expanded(
                    child: Text(
                      optionListViewItem,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ],
              );
            }).divide(SizedBox(height: 8.0)),
          );
        },
      ),
    );
  }
}
