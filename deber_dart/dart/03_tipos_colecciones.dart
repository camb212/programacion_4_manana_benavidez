void main() {
  List<String> vehiculos = ['Toyota Corolla', 'Chevrolet Spark', 'Kia Rio'];
  var preciosPorDia = [45, 35, 40, 50];

  print(vehiculos[0]);
  print(vehiculos.length);

  vehiculos.add('Hyundai Accent');
  vehiculos.remove('Chevrolet Spark');

  Map<String, int> diasAlquiler = {
    'Carlos': 5,
    'María': 3,
    'Juan': 7,
  };

  print(diasAlquiler['Carlos']);
  print(diasAlquiler['Pedro']);

  diasAlquiler['Ana'] = 4;

  Set<String> categorias = {'Sedán', 'SUV', 'Camioneta'};
  categorias.add('Sedán');

  print(categorias.length);

  var sucursalQuito = ['Toyota Corolla', 'Kia Rio'];
  var sucursalGuayaquil = ['Hyundai Accent', 'Mazda 3'];

  var flotaCompleta = [...sucursalQuito, ...sucursalGuayaquil];
  print(flotaCompleta);

  bool incluirSeguro = true;

  var servicios = [
    'Alquiler básico',
    'Asistencia vial',
    if (incluirSeguro) 'Seguro contra accidentes',
  ];

  print(servicios);

  var costosTotales = [for (var dias = 1; dias <= 5; dias++) dias * 45];
  print(costosTotales);
}