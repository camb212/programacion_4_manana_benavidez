import 'auto_mp.dart';

class AutoDto {
  final int     id;
  final String  name;
  final String  price;
  final bool    isActive;
  final String? categoryName;

  const AutoDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory AutoDto.fromJson(Map<String, dynamic> json) => AutoDto(
    id:           json['id']            as int,
    name:         json['name']          as String,
    price:        json['price']         as String,
    isActive:     json['is_active']     as bool? ?? false,
    categoryName: json['category_name'] as String?,
  );

  Auto toDomain() => Auto(
    id:        id,
    nombre:    name,
    precio:    double.tryParse(price) ?? 0,
    activo:    isActive,
    categoria: categoryName,
  );
}
