part of 'mine_bloc.dart';

abstract class MineState extends Equatable {
  const MineState();
}

class MineInitial extends MineState {
  @override
  List<Object> get props => [];
}
