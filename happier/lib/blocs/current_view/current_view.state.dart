import 'package:equatable/equatable.dart';

abstract class ViewState extends Equatable {
  const ViewState();

  @override
  List<Object> get props => [];

  get viewId => null;
}

// TODO: Tabs should be an enum
class BoardSelected extends ViewState {
  @override
  get viewId => 0;
}

class ChatbotSelected extends ViewState {
  @override
  get viewId => 1;
}

class ObjectivesSelected extends ViewState {
  @override
  get viewId => 2;
}

class HelpSelected extends ViewState {
  @override
  get viewId => 4;
}

class FAQSelected extends ViewState {
  @override
  get viewId => 5;
}
