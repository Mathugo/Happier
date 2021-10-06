import 'package:flutter_bloc/flutter_bloc.dart';

import 'objectives.dart';

class ObjectivesBloc extends Bloc<ObjectivesEvent, ObjectivesState> {
  ObjectivesBloc() : super(ObjectivesInitial());

  @override
  Stream<ObjectivesState> mapEventToState(ObjectivesEvent event) async* {
    if (event is ObjectivesRequested) {
      yield ObjectivesLoading();
    } else if (event is ObjectiveUpdated) {
      yield ObjectivesLoading();
    }
  }
}