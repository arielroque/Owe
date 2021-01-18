import 'package:flutter/cupertino.dart';

@immutable
class UserPerformance {
  const UserPerformance(this.name, this.size);

  final String name;
  final int size;
}

const metric1 = [
  const UserPerformance("Janeiro", 7),
  const UserPerformance("Fevereiro", 8),
  const UserPerformance("Março", 4),
  const UserPerformance("Abril", 5),
];

const metric2 = [
  const UserPerformance("Janeiro", 4),
  const UserPerformance("Fevereiro", 6),
  const UserPerformance("Março", 7),
  const UserPerformance("Abril", 8),
];
