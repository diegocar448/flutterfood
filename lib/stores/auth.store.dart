import 'package:flutterfood/data/network/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../data/network/repositories/auth_repository.dart';
import '../models/User.dart';
part 'auth.store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  /* Aqui podemos usar os recurso do authRepository como getMe, register... */
  AuthRepository _authRepository = AuthRepository();

  /* default false (mostra o usuario como não autenticado por default) */
  //@observable
  //bool isAuthenticated = false;

  @observable
  User user;

  /* preloader */
  @observable
  bool isLoading = false;

  /* Vamos user o observable user para identificar qualquer mudança do objeto user */
  @action
  void setUser(User value) => user = value;

  /* fazer o toggle do isLoading */
  @action
  void setLoading(bool value) => isLoading = value;

  @action
  Future auth(String email, String password) async {
    setLoading(true);

    await _authRepository.auth(email, password);

    /* Logo após a autenticação pegamos o dados do usuario autenticado */
    await getMe();

    setLoading(false);

    return true;
  }

  @action
  Future<bool> register(String name, String email, String password) async {
    setLoading(true);

    await _authRepository.register(name, email, password);

    await auth(email, password);

    setLoading(false);

    return true;
  }

  @action
  Future getMe() async {
    /* Aqui atualizamos o nosso user, dando certo seta o user*/
    await _authRepository.getMe().then((user) => setUser(user));
  }

  @action
  Future logout() async {
    setLoading(true);
    /* whenComplete é uma função nativa para executará após completar o metodo (logout) */
    await _authRepository.logout().whenComplete(() => setLoading(false));
  }
}
