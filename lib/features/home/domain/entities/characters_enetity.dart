class CharactersEntity {
  int? charId;
  String? name;
  String? birthday;
  List? occupation;
  String? img;
  String? status;
  String? nickname;
  List? appearance;
  String? portrayed;
  String? category;

  CharactersEntity(
      {this.charId,
      this.name,
      this.birthday,
      this.occupation,
      this.img,
      this.status,
      this.nickname,
      this.appearance,
      this.portrayed,
      this.category});

  factory CharactersEntity.fromMap(Map<String, dynamic> map) {
    return CharactersEntity(
    charId: map['char_id'],
    name: map['name'],
    birthday: map['birthday'],
    occupation: map['occupation'],
    img: map['img'],
    status: map['status'],
    nickname: map['nickname'],
    appearance: map['appearance'],
    portrayed: map['portrayed'],
    category: map['category']);
  }

  Map<String, dynamic> toMap(CharactersEntity entity) {
    return {
    'char_id': entity.charId,
    'name': entity.name,
    'birthday': entity.birthday,
    'occupation': entity.occupation,
    'img': entity.img,
    'status': entity.status,
    'nickname': entity.nickname,
    'appearance': entity.appearance,
    'portrayed': entity.portrayed,
    'category': entity.category,
  };
  }
}