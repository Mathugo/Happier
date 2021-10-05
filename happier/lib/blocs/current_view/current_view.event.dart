import 'package:equatable/equatable.dart';
import 'package:happier/blocs/current_view/current_view.dart';

abstract class ViewEvent extends Equatable{
  const ViewEvent();
}

class ViewRequested extends ViewEvent {
  final ViewState view;

  const ViewRequested({required this.view});

  @override
  List<Object> get props => [view];
}