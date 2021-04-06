import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutterfood/models/Category.dart';
import '../../../stores/categories.store.dart';

class Categories extends StatelessWidget {
  List<Category> _categories;
  CategoriesStore categoriesStore;

  Categories(this._categories);

  @override
  Widget build(BuildContext context) {
    /* Aqui consegue ter acesso ao mesmo store que estou trabalhando */
    categoriesStore = Provider.of<CategoriesStore>(context);
    /* Aqui faremos a listagem como um foreach no flutter */
    return _buildCategories();
  }

  Widget _buildCategories() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 2, left: 20, right: 20),
      height: 50,
      child: ListView.builder(
        /* alinha na horizontal */
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final Category category = _categories[index];
          /* aqui vamos criar outro widget para modularizar melhor */
          return _buildCategory(category);
        },
      ),
    );
  }

  Widget _buildCategory(Category category) {
    /* criar variavel para armazenar o nosso category.identify */
    final String identifyCategory = category.identify;
    final bool inFilter = categoriesStore.inFilter(identifyCategory);

    return GestureDetector(
      onTap: () => inFilter
          ? categoriesStore.removeFilter(category.identify)
          : categoriesStore.addFilter(category.identify),
      child: Container(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: inFilter ? Colors.black : Colors.grey)),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
                color: inFilter ? Colors.black : Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
