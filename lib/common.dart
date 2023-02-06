import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CommonWidgets {
  formField({required TextEditingController controller, required String hint}) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black45,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  qrWithData(String data) {
    return QrImage(
      backgroundColor: Colors.white,
      data: data,
      size: 200,
    );
  }
}
