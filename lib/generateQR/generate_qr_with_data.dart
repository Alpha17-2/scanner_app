import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner_app/controllers/app_state_controller.dart';
import 'package:scanner_app/routes/named_routes.dart';

class GenerateQrWithData extends ConsumerWidget {
  const GenerateQrWithData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayState = ref.watch(appStateController);
    final controlState = ref.watch(appStateController.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR"),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              onPressed: () => controlState.addNewQueryForQR(),
              icon: const Icon(Icons.add))
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Map<String, String> data = {};
          for (var formField in displayState.generateCodeState.listOfQueries!) {
            data[formField.keyForm.controller!.text] =
                formField.valueForm.controller!.text;
          }
          final afterEncoding = jsonEncode(data);

          context.pushNamed(NamedRoutes.downloadQRScreen,
              queryParams: {'data': afterEncoding});
        },
        child: Container(
          height: 60,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.black,
          child: const Text("Generate QR Code",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Fill form with your custom data",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      displayState.generateCodeState.listOfQueries!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: displayState.generateCodeState
                                  .listOfQueries![index].keyForm),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              flex: 7,
                              child: displayState.generateCodeState
                                  .listOfQueries![index].valueForm),
                        ],
                      ),
                    );
                  },
                ))
              ],
            )),
      ),
    );
  }
}
