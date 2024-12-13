import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_answer_view_model.dart';
export 'radio_answer_view_model.dart';

class RadioAnswerViewWidget extends StatefulWidget {
  const RadioAnswerViewWidget({
    super.key,
    this.optionList,
    required this.itemIndex,
  });

  final List<String>? optionList;
  final int? itemIndex;

  @override
  State<RadioAnswerViewWidget> createState() => _RadioAnswerViewWidgetState();
}

class _RadioAnswerViewWidgetState extends State<RadioAnswerViewWidget> {
  late RadioAnswerViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioAnswerViewModel());

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
                              .tmpAnswerList
                              .elementAtOrNull(widget!.itemIndex!)
                              ?.answer
                              ?.contains(optionListViewItem) ??
                          false) {
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
                              Icons.radio_button_checked_rounded,
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
                              Icons.circle_outlined,
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
