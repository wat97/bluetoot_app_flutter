import 'package:blueetooth_app/provider/provider.dart';
import 'package:blueetooth_app/view/page/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: ChangeNotifierProvider(
        create: (context) => ProviderHome(),
        builder: (context, child) => PageHome(),
      ),
    );
  }
}

