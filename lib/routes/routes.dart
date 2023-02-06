import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner_app/common.dart';
import 'package:scanner_app/generateQR/download_qr.dart';
import 'package:scanner_app/home_screen.dart';

import '../generateBarCode/generate_barcode.dart';
import '../generateQR/generate_qr_with_data.dart';
import 'named_routes.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
  ),
  GoRoute(
      path: '/${NamedRoutes.generateQrWithData}',
      builder: (context, state) => GenerateQrWithData(),
      name: NamedRoutes.generateQrWithData),
  GoRoute(
      path: '/${NamedRoutes.generateBarcodeWithData}',
      builder: (context, state) => GenerateBarCodeWithData(),
      name: NamedRoutes.generateBarcodeWithData),
  GoRoute(
    path: '/${NamedRoutes.downloadQRScreen}',
    builder: (context, state) => DownloadQRScreen(
      qrImage: CommonWidgets().qrWithData(state.queryParams['data']!),
    ),
    name: NamedRoutes.downloadQRScreen,
  ),
]);
