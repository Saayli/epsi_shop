import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier{
  final List<Article> _articles = <Article>[];

  get articles => _articles;

  void add(Article article){
    _articles.add(article);
    notifyListeners();
  }

  void removeAll(){
    _articles.clear();
    notifyListeners();
  }
}