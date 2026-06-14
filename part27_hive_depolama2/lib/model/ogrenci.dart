import 'package:hive/hive.dart';
part 'ogrenci.g.dart';

@HiveType(typeId: 1)
class Ogrenci {
  @HiveField(0, defaultValue: 555)
  final int id;
  @HiveField(1)
  final String isim;
  @HiveField(2)
  final GozRenk renk;

  Ogrenci(this.id, this.isim, this.renk);

  @override
  String toString() {
    return 'Ogrenci{id: $id, isim: $isim, renk: $renk}';
  }


}
@HiveType(typeId: 2)
enum GozRenk{
  @HiveField(0, defaultValue: true)
  BLACK,
  @HiveField(1)
  BLUE,
  @HiveField(2)
  GREEN
}