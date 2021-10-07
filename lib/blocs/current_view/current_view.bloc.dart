import 'package:flutter_bloc/flutter_bloc.dart';

import 'current_view.dart';

class CurrentViewBloc extends Bloc<ViewEvent, ViewState> {
  CurrentViewBloc() : super(BoardSelected());

  @override
  Stream<ViewState> mapEventToState(ViewEvent event) async* {
    if (event is ViewRequested) {
      yield event.view;
    }
  }
}