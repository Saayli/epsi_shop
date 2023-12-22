class Article {
  //Constructeur avec paramètres
  //nommés et requis

  //Méthode retournant le prix
  String nom;
  String? description;
  double prix;
  String image;
  String categorie;

  Article({required this.nom, required this.categorie, required this.prix, required this.image, this.description});

  String getPrixEuro() => "$prix€";

  @override
  String toString() {
    return 'Article{ $nom, description: $description, prix: $prix€, image: $image, categorie: $categorie}';
  }

}
void main(){
  final List<Article> lsArticle = [Article(nom: "Tomate", categorie: "Légumes", prix: 1.99, image: "oui"), Article(nom: "Banane", categorie: "Fruit", prix: 2, image: "oui")];
  var article;

  for(article in lsArticle) {
    print("Le produit ${article.nom} est vendu à ${article.getPrixEuro()}");
  }
}