import 'package:flutterfood/data/network/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../data/network/repositories/auth_repository.dart';
part 'auth.store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  /* Aqui podemos usar os recurso do authRepository como getMe, register... */
  AuthRepository _authRepository = AuthRepository();

  /* default false (mostra o usuario como não autenticado por default) */
  @observable
  bool isAuthenticated = false;

  /* preloader */
  @observable
  bool isLoading = false;

  /* fazer o toggle do isAuthenticated */
  @action
  void setAuthenticated(bool value) => isAuthenticated = value;
  /* fazer o toggle do isLoading */
  @action
  void setLoading(bool value) => isLoading = value;

  @action
  Future<bool> auth(String email, String password) async {
    setLoading(true);

    await _authRepository.auth(email, password);

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
}
