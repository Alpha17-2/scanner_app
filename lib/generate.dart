import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scanner_app/routes/named_routes.dart';

class Generate extends StatelessWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.pushNamed(NamedRoutes.generateBarcodeWithData);
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.black87),
            elevation: MaterialStateProperty.all(5.5),
          ),
          child: const Text("Generate Barcode"),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(NamedRoutes.generateQrWithData);
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.black87),
            elevation: MaterialStateProperty.all(5.5),
          ),
          child: const Text("Generate QR code"),
        )
      ],
    );
  }
}


