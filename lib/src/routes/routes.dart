import 'package:componente/src/pages/alert_page.dart';
import 'package:componente/src/pages/animated_container_page.dart';
import 'package:componente/src/pages/avatar_page.dart';
import 'package:componente/src/pages/card_page.dart';
import 'package:componente/src/pages/home_page.dart';
import 'package:componente/src/pages/input_page.dart';
import 'package:componente/src/pages/listview_page.dart';
import 'package:componente/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListPage(),
  };
}
