enum Cinsiyet { KADIN, ERKEK, DIGER }

enum Renkler { SARI, MAVI, YESIL, PEMBE, KIRMIZI, MOR }

class UserInformation {
  final String isim;
  final Cinsiyet cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);

  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'cinsiyet': cinsiyet.name,
      'renkler': renkler,
      'ogrenciMi': ogrenciMi,
    };
  }

  UserInformation.fromJson(Map<String, dynamic> json)
    : isim = json['isim'],
      cinsiyet = Cinsiyet.values.firstWhere(
        (element) => element.name.toString() == json['cinsiyet'],
      ),
      renkler = List<String>.from(json['renkler']),
      ogrenciMi = json['ogrenciMi'];
}
