class ClienteDto {
  final int id;
  final String name;
  final String email;

  const ClienteDto({
    required this.id,
    required this.name,
    required this.email,
  });

  factory ClienteDto.fromJson(Map<String, dynamic> json) => ClienteDto(
    id:    json['id']    as int,
    name:  json['name']  as String,
    email: json['email'] as String,
  );
}