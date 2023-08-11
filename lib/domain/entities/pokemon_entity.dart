import 'package:isar/isar.dart';

part 'pokemon_entity.g.dart';

@collection
class PokemonEntity {
  final Id isarId = Isar.autoIncrement;
  final int id;
  final String name;
  final String sprintFront;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.sprintFront,
  });
}
