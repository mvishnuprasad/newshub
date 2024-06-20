import 'package:flutter/material.dart';
import 'package:newshub/pages/launchscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/persistance/newsmodel.dart';
import 'components/navbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NewsModelAdapter());
  runApp(const ProviderScope(
    child: Splash(),
  ));
}

class NewsHub extends StatelessWidget {
  const NewsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: navBar(),
      ),
    );
  }
}
