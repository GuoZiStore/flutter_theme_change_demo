import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_change/manager/provder_manager.dart';
import 'package:theme_change/manager/router_manager.dart';
import 'package:theme_change/manager/storage_manager.dart';
import 'package:theme_change/view_model/theme_model.dart';

main() async{
  Provider.debugCheckInvalidValueType=null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers,child: Consumer<ThemeModel>(builder: (context, themeModel, child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeModel.themeData(),
        onGenerateRoute: Router.generateRoute,
        initialRoute: RouteName.themechange,
      );
    },),);
  }
}