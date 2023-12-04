class MovieInfoModel {
  final String title;
  final List<String> genres; // list로 추후 변환해야함
  final int positive_count;
  final double positive_percentage;
  final int negative_count;
  final double negative_percentage;
  final List<dynamic> tags;
  MovieInfoModel({
    required this.title,
    required this.genres,
    required this.positive_count,
    required this.positive_percentage,
    required this.negative_count,
    required this.negative_percentage,
    required this.tags,
  });

  MovieInfoModel.fromJson({required Map<String, dynamic> json})
      : title = json['title'],
        genres = (json['genres'] as String).split('|'),
        positive_count = json['positive_count'],
        positive_percentage = json['positive_percentage'],
        negative_count = json['negative_count'],
        negative_percentage = json['negative_percentage'],
        tags = json['tags'];
}
