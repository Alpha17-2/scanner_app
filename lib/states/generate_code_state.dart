import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/common.dart';
import 'package:scanner_app/models/form_model.dart';

class GenerateCodeState {
  List<FormModel>? listOfQueries;
  GenerateCodeState({this.listOfQueries});

  GenerateCodeState addNewQuery() {
    CommonWidgets commonWidgets = CommonWidgets();
    TextEditingController keyController = TextEditingController();
    TextEditingController valueController = TextEditingController();
    listOfQueries!.add(
      FormModel(
          keyForm:
              commonWidgets.formField(controller: keyController, hint: 'Key'),
          valueForm: commonWidgets.formField(
              controller: valueController, hint: 'Value')),
    );
    return GenerateCodeState(listOfQueries: listOfQueries);
  }

}
