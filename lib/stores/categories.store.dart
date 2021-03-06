import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/Category.dart';
import '../data/network/repositories/category_repository.dart';

part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  CategoryRepository repository = new CategoryRepository();

  /* Será observado nas mudanças em nosso screens */
  @observable
  ObservableList<Category> categories = ObservableList<Category>();

  /* Criamos aqui o nosso observable para ter a lista com os filtros */
  @observable
  List<String> filtersCategory = [];

  @observable
  bool filterChanged = false;

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

  /* Adiciona filtro */
  @action
  void addFilter(String identify) {
    if (identify == 'all') {
      return clearFilter();
    } else {
      filtersCategory.add(identify);
    }

    /* Para ser observado no nosso screen */
    categories = categories;
    /* touch para inverter o valor ex: de false para true */
    filterChanged = !filterChanged;
  }

  /* Remove filtro */
  @action
  void removeFilter(String identify) {
    if (identify != 'all') {
      filtersCategory.remove(identify);
    }

    /* Para ser observado no nosso screen */
    categories = categories;
    /* touch para inverter o valor ex: de false para true */
    filterChanged = !filterChanged;
  }

  /* Verificar se existe filtro */
  @action
  bool inFilter(String identify) {
    return (identify == 'all' && filtersCategory.length == 0) ||
        filtersCategory.contains(identify);
  }

  /* Um limpar filter mais generico */
  @action
  void clearFilter() {
    filtersCategory.clear();

    /* Para ser observado no nosso screen */
    categories = categories;
    /* touch para inverter o valor ex: de false para true */
    filterChanged = !filterChanged;
  }

  /* Vai pegar os dados do categoryRepository e devolve-los */
  @action
  Future getCategories(String tokenCompany) async {
    setLoading(true);

    /* Assim que recarregar a nossa getCategories vamos limpar os dados anteriores antes de inserir os novos dados */
    clearCategory();
    /* Antes da requisição limpamos os filtros */
    clearFilter();

    /* Aqui nós iremos acessar o repository que faz a requisição para a nossa API laravel */
    final response = await repository.getCategories(tokenCompany);

    /* Aqui formatamos os dados que retornaram de API para o formato list */
    response
        .map((categoryJson) => addCategory(Category.fromJson(categoryJson)))
        .toList();

    /* Após concluir a requisição passamos o isLoading para false */
    setLoading(false);
  }
}
