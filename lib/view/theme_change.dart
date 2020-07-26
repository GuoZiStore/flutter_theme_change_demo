import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_change/model/value.dart';
import 'package:theme_change/view_model/theme_model.dart';

class ThemeChange extends StatefulWidget {
  @override
  _ThemeChangeState createState() => _ThemeChangeState();
}

class _ThemeChangeState extends State<ThemeChange> {
  String _colorKey=ThemeModel().getColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('颜色主题切换Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionTile(
              leading: Icon(Icons.color_lens),
              title: Text('颜色主题'),
              initiallyExpanded: false,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: themeColorMap.keys.map((key) {
                      Color value = themeColorMap[key];
                      return InkWell(
                        onTap: () {
                          var model =
                              Provider.of<ThemeModel>(context, listen: false);
                          model.switchTheme(key);
                          setState(() {
                            _colorKey = key;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          color: value,
                          child: _colorKey== key
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
