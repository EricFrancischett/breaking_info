class EpisodesEntity {
  int? episodeId;
  String? title;
  String? season;
  String? airDate;
  List? characters;
  String? episode;
  String? series;

  EpisodesEntity(
      {this.episodeId,
      this.title,
      this.season,
      this.airDate,
      this.characters,
      this.episode,
      this.series});

  factory EpisodesEntity.fromMap(Map<String, dynamic> map) {
    return EpisodesEntity(
        episodeId: map['episode_id'],
        title: map['title'],
        season: map['season'],
        airDate: map['air_date'],
        characters: map['characters'],
        episode: map['episode'],
        series: map['series']);
  }

  Map<String, dynamic> toMap(EpisodesEntity entity) {
    return {
      'episode_id': entity.episodeId,
      'title': entity.title,
      'season': entity.season,
      'air_date': entity.airDate,
      'characters': entity.characters,
      'episode': entity.episode,
      'series': entity.series,
    };
  }
}
