import 'package:breaking_info/app_module.dart';
import 'package:path_provider/path_provider.dart';
import 'package:breaking_info/app_widget.dart';
import 'package:breaking_info/features/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox<String>('credentials');
  runApp(
    ModularApp(
      module: HomeModule(),
      child: const AppWidget(),
    ),
  );
}