import 'package:flutter/material.dart';

import './routes.dart';
import './constants/app_theme.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  const FlutterFoodApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterFood',
      theme: themeData,
      /* Essa será a tela, rota, inicial */
      initialRoute: '/',
      /* 
        Aqui vamos trabalhar com a parte de roteamento nativa do Flutter  
        String == Nome da Rota
        WidgetBuilder == (A rota em si)
      */
      routes: Routes.routes,
    );
  }
}
