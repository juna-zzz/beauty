import 'package:hive/hive.dart';
part 'favourite.g.dart';

@HiveType(typeId: 1)
class FavouriteM {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final String image;

  FavouriteM({
    required this.name,
    required this.price,
    required this.image,
  });
}
