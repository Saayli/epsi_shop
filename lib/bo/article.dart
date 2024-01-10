class Article {
  //Constructeur avec paramètres
  //nommés et requis

  //Méthode retournant le prix
  String nom;
  String? description;
  double prix;
  String image;
  String categorie;

  Article(
      {required this.nom,
      required this.categorie,
      required this.prix,
      required this.image,
      this.description});

  String getPrixEuro() => "$prix€";

  @override
  String toString() {
    return 'Article{ $nom, description: $description, prix: $prix€, image: $image, categorie: $categorie}';
  }

  Map<String, dynamic> toMap() {
    return {
      'nom': this.nom,
      'description': this.description,
      'prix': this.prix,
      'image': this.image,
      'categorie': this.categorie,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      nom: map['title'] as String,
      description: map['description'] as String,
      prix: (map['price'] as num).toDouble(),
      image: map['image'] as String,
      categorie: map['category'] as String,
    );
  }
}

void main() {
  final List<Article> lsArticle = [
    Article(nom: "Tomate", categorie: "Légumes", prix: 1.99, image: "oui"),
    Article(nom: "Banane", categorie: "Fruit", prix: 2, image: "oui")
  ];
  var article;

  for (article in lsArticle) {
    print("Le produit ${article.nom} est vendu à ${article.getPrixEuro()}");
  }
}
