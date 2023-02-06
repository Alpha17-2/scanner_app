import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner_app/controllers/app_state_controller.dart';
import 'package:scanner_app/helpers/share_helper.dart';

class DownloadQRScreen extends ConsumerWidget {
  QrImage qrImage;
  DownloadQRScreen({required this.qrImage});

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayState = ref.watch(appStateController);
    final controlState = ref.watch(appStateController.notifier);

    Future<void> _captureAndSharePng() async {
      try {
        RenderRepaintBoundary boundary = globalKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        var image = await boundary.toImage();
        ByteData? byteData =
            await image.toByteData(format: ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        // final tempDir = await getTemporaryDirectory();
        // final file = await File('${tempDir.path}/image.png').create();
        // await file.writeAsBytes(pngBytes);
        ShareImageHelper.instance.shareImage(pngBytes);

        // const channel = MethodChannel('channel:me.alpha.share/share');
        // channel.invokeMethod('shareFile', 'image.png');
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RepaintBoundary(key: globalKey, child: qrImage),
            const SizedBox(
              height: 15,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.download,
                color: Colors.white,
              ),
              onPressed: () async {
                _captureAndSharePng();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.black87),
                elevation: MaterialStateProperty.all(5.5),
              ),
              label: const Text(
                "Download",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }
}
