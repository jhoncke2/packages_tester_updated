import 'package:flutter/material.dart';
import 'package:packages_tester_updated/home/home_page.dart';
import 'package:packages_tester_updated/modules/bloc_timer/bloc_timer_page.dart';
import 'package:packages_tester_updated/modules/files/files_page.dart';
import 'package:packages_tester_updated/modules/general_tests/presentation/general_tests_page.dart';
import 'package:packages_tester_updated/modules/multi_methods/presentation/pages/multi_methods_page.dart';
import 'package:packages_tester_updated/modules/widgets_grid/widgets_grid_page.dart';
import 'package:packages_tester_updated/packages/calendar/calendar_page.dart';
import 'package:packages_tester_updated/packages/email_sender/email_sender_page.dart';
import 'package:packages_tester_updated/packages/pdf/pdf_page.dart';
import 'package:packages_tester_updated/packages/pusher/pusher_page.dart';
import 'package:packages_tester_updated/packages/qr/qr_page.dart';
import 'package:packages_tester_updated/packages/qr_scanner/qr_scanner_page.dart';
import 'package:packages_tester_updated/packages/sharing/sharing_page.dart';
import 'package:packages_tester_updated/packages/vcf/vcf_page.dart';
import 'package:packages_tester_updated/packages/widgets_packages/widgets_packages_page.dart';
import 'package:packages_tester_updated/packages/widgets_to_image/widgets_to_image_page.dart';

enum NavRoute{
  home,
  multiMethods,
  generaltests,
  blocTimer,
  qr,
  sharing,
  vcf,
  widgetsPackages,
  pdf,
  qrScanner,
  files,
  calendar,
  pusher,
  widgetsToImage,
  emailSender,
  widgetsGrid
}
final Map<NavRoute, String> routesNames = {
  NavRoute.home: 'home',
  NavRoute.generaltests: 'genera_tests',
  NavRoute.multiMethods: 'multi_methods',
  NavRoute.blocTimer: 'bloc_timer',
  NavRoute.qr: 'qr',
  NavRoute.sharing: 'sharing',
  NavRoute.vcf: 'vcf',
  NavRoute.widgetsPackages: 'widgets_packages',
  NavRoute.pdf: 'pdf',
  NavRoute.qrScanner: 'qr_scanner',
  NavRoute.files: 'files',
  NavRoute.calendar: 'calendar',
  NavRoute.pusher: 'pusher',
  NavRoute.widgetsToImage: 'widgets_to_image',
  NavRoute.emailSender: 'email_sender',
  NavRoute.widgetsGrid: 'widgets_grid'
};

final Map<String, Widget Function(BuildContext)> routes  = {
  routesNames[NavRoute.home]! : (_) => HomePage(),
  routesNames[NavRoute.multiMethods]! : (_) => MultiMethodsPage(),
  routesNames[NavRoute.generaltests]!: (_) => GeneralTestsPage(),
  routesNames[NavRoute.blocTimer]!: (_) => BlocTimerPage(),
  routesNames[NavRoute.qr]!: (_) => QrPage(),
  routesNames[NavRoute.sharing]!: (_) => SharingPage(),
  routesNames[NavRoute.vcf]!: (_) => VCFPage(),
  routesNames[NavRoute.widgetsPackages]!: (_) => WidgetsPackagesPage(),
  routesNames[NavRoute.pdf]!: (_) => PdfPage(),
  routesNames[NavRoute.qrScanner]!: (_) => QrScannerPage(),
  routesNames[NavRoute.files]!: (_) => FilesPage(),
  routesNames[NavRoute.calendar]!: (_) => CalendarPage(),
  routesNames[NavRoute.pusher]!: (_) => PusherPage(),
  routesNames[NavRoute.widgetsToImage]!: (_) => WidgetsToImagePage(),
  routesNames[NavRoute.emailSender]!: (_) => EmailSenderPage(),
  routesNames[NavRoute.widgetsGrid]!: (_) => WidgetsGridPage()
};