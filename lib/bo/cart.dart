import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<Article> _articles = <Article>[];

  List<Article> get articles => _articles;

  void addArticle(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void removeArticle(Article article) {
    _articles.remove(article);
    notifyListeners();
  }

  void removeAll() {
    _articles.clear();
    notifyListeners();
  }

  double totalPrix() {
    Article article;
    double prixTotal = 0;
    for (article in _articles) {
      prixTotal += article.prix;
    }

    return prixTotal;
  }

  double totalPrixTva() {
    double totalPrixTva;
    return totalPrixTva = totalPrix() * 1.2;
  }

  double totalTva() {
    double totalTva;
    return totalTva = totalPrixTva() - totalPrix();
  }

  bool articleInCart(Article article) {
    var a;
    for (a in _articles) {
      if (a == article) {
        return true;
      }
    }
    return false;
  }
}
