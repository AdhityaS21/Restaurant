class ModelReviews{
  final String name;
  final String date;
  final String review;

  const ModelReviews({
    this.name,
    this.date,
    this.review
  });
}

List<ModelReviews> reviews = [
  const ModelReviews(
    name: "Gilang",
    date: "14 Agustus 2018",
    review: "Tempatnya bagus namun menurut saya masih sedikit mahal",
  ),

  const ModelReviews(
    name: "Arif",
    date: "13 November 2019",
    review: "Tidak rekomendasi untuk pelajar!",
  ),

  const ModelReviews(
    name: "Ahmad",
    date: "13 November 2019",
    review: "Tidak ada duanya!",
  ),
];