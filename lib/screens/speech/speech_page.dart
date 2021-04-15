import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../stores/auth.store.dart';

class SpeechScreen extends StatefulWidget {
  SpeechScreen({Key key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  AuthStore _authStore;
  // Create storage para trabalhar com o storage de armazenamento
  FlutterSecureStorage storage = new FlutterSecureStorage();

  /* Recurso para sumir a barra superior do android */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    /* redirecionar para rota /login após 10 segundo como foi passando no metodo _checkAuth */
    _checkAuth().then((bool isAuthenticated) {
      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, "/restaurants");
        return;
      }

      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    /* Aqui será um provider de AuthStore */
    _authStore = Provider.of<AuthStore>(context);
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

  Future<bool> _checkAuth() async {
    final String token = await storage.read(key: 'token_sanctum');

    if (token != null) {
      final bool isAuthenticated = await _authStore.getMe();
      return isAuthenticated;
    }

    return false;
  }
}
