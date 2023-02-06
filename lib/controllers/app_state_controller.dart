import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scanner_app/common.dart';
import 'package:scanner_app/states/generate_code_state.dart';
import 'package:scanner_app/states/global_app_state.dart';

import '../models/form_model.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier()
      : super(AppState(
            generateCodeState: GenerateCodeState(listOfQueries: [
          FormModel(
              keyForm: CommonWidgets()
                  .formField(controller: TextEditingController(), hint: 'Key'),
              valueForm: CommonWidgets().formField(
                  controller: TextEditingController(), hint: 'Value'))
        ])));

  @override
  AppState get state => super.state;
  
  addNewQueryForQR() {
    state = state.copyWith(
        latestGenerateCodeState: state.generateCodeState.addNewQuery());
  }
  
}

final appStateController =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});
