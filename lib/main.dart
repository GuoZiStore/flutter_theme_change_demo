
// import 'package:flustars/flustars.dart';
// import 'package:flutter/material.dart';
// import 'package:theme_change/app_provider.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   Color _themeColor;

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [ChangeNotifierProvider.value(value: AppInfoProvider())],
//       child: Consumer<AppInfoProvider>(
//         builder: (context, appInfo, _) {
//           String colorKey = appInfo.themeColor;
//           if (themeColorMap[colorKey] != null) {
//             _themeColor = themeColorMap[colorKey];
//           }

//           return MaterialApp(
//             title: 'Flutter Demo',
//             theme: ThemeData(primaryColor: _themeColor, accentColor: _themeColor
//                 // floatingActionButtonTheme:
//                 //     FloatingActionButtonThemeData(backgroundColor: _themeColor,foregroundColor: Colors.white),
//                 ),
//             home: MyHomePage(title: 'Flutter Theme Change demo'),
//           );
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String _colorKey;

//   @override
//   void initState() {
//     super.initState();
//     _initAsync();
//   }

//   Future<void> _initAsync() async {
//     await SpUtil.getInstance();
//     // SharedPreferences prefs=await SharedPreferences.getInstance();
//     _colorKey = SpUtil.getString('key_theme_color', defValue: 'blue');
//     // _colorKey=prefs.getString('key_theme_color',defValue: 'blue');
//     // 设置初始化主题颜色
//     Provider.of<AppInfoProvider>(context, listen: false).setTheme(_colorKey);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
// ExpansionTile(
//   leading: Icon(Icons.color_lens),
//   title: Text('颜色主题'),
//   initiallyExpanded: false,
//   children: <Widget>[
//     Padding(
//       padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       child: Wrap(
//         spacing: 8,
//         runSpacing: 8,
//         children: themeColorMap.keys.map((key) {
//           Color value = themeColorMap[key];
//           return InkWell(
//             onTap: () {
//               setState(() {
//                 _colorKey = key;
//               });
//               SpUtil.putString('key_theme_color', key);
//               Provider.of<AppInfoProvider>(context, listen: false)
//                   .setTheme(key);
//             },
//             child: Container(
//               width: 40,
//               height: 40,
//               color: value,
//               child: _colorKey == key
//                   ? Icon(
//                       Icons.done,
//                       color: Colors.white,
//                     )
//                   : null,
//             ),
//           );
//         }).toList(),
//       ),
//     )
//   ],
// ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
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