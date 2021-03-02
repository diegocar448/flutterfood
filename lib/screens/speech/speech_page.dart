import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpeechScreen extends StatefulWidget {
  SpeechScreen({Key key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  /* Recurso para sumir a barra superior do android */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    /* redirecionar para rota /login após 10 segundo como foi passando no metodo _checkAuth */
    _checkAuth().then((value) {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  child: Image.asset('assets/images/IconeFlutterFood.png'),
                ),
                Container(height: 30),
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                Container(height: 10),
                Text(
                  "Carregando...",
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
      ),
    );
  }

  Future<String> _checkAuth() async {
    await Future.delayed(Duration(seconds: 10));

    return '';
  }
}
