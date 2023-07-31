class WebtoonModel {
  final String title, thumb, id;

  //! constructor 방식은 별로 좋지못하다.
  //  -> 대신 named constructor방식을 사용.
  //! fromJson은 매우 많이 쓰이는 패턴이다.
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
