/// Domain entity representing gender selection
/// Follows Entity pattern from Clean Architecture
class GenderSelection {
  final String value;

  const GenderSelection({required this.value});

  bool get isMen => value == 'men';
  bool get isWomen => value == 'women';
  bool get isAll => value == 'all';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderSelection &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}