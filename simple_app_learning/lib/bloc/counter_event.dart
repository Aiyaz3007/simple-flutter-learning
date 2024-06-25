part of 'counter_bloc.dart';

sealed class CounterEvents {}

final class CounterIncrement extends CounterEvents {}

final class CounterDecrement extends CounterEvents {}
