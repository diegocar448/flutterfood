import 'package:mobx/mobx.dart';

import '../models/Category.dart';
import '../data/network/repositories/category_repository.dart';

part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  CategoryRepository repository = new CategoryRepository();

  @observable
  ObservableList<Category> categories = ObserverList<Category>();

  @observable
  bool isLoading = false;

  /* Essa action fará o toggle de isLoading */
  @action
  void setLoading(bool value) => isLoading = value;

  /* Metodo que irá adicionar um nova categoria em nosso array de nossa lista de categories*/
  @action
  void addCategory(Category category) {
    categories.add(category);
  }

  /* Metodo que irá remover uma categoria em nosso array de nossa lista de categories*/
  @action
  void removeCategory(Category category) {
    categories.remove(category);
  }

  /* Metodo que irá remover todas as categorias de nosso array de nossa lista de categories*/
  @action
  void clearCategory() {
    categories.clear();
  }

  /* Vai pegar os dados do categoryRepository e devolve-los */
  @action
  Future getCategories(String tokenCompany) async {
    setLoading(true);

    /* Assim que recarregar a nossa getCategories vamos limpar os dados anteriores antes de inserir os novos dados */
    clearCategory();

    final response = await repository.getCategories(tokenCompany);

    response
        .map((categoryJson) => addCategory(Category.fromJson(categoryJson)))
        .toList();
  }
}
