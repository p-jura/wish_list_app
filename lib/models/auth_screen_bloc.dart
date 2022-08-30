import 'dart:async';
import 'package:wish_list_app/models/auth_scrren_event.dart';


// learning bloc - this part of code is writen this way for learning purpuses.



class SigningInLogingInBloc {
  bool _hasAccount = false;

  final _hasAccountStateController = StreamController<bool>();
  StreamSink<bool> get _hasAccountSink => _hasAccountStateController.sink;

  Stream<bool> get hasAccount => _hasAccountStateController.stream;

  final _hasAccountEventController = StreamController<SigningInLogingIn>();

  StreamSink<SigningInLogingIn> get hasAccountEventSink =>
      _hasAccountEventController.sink;

  SigningInLogingInBloc() {
    _hasAccountEventController.stream.listen(_mapEventState);
  }

  void _mapEventState(SigningInLogingIn event) {
    if (event is SignIn) {
      _hasAccount = false;
    } else {
      _hasAccount = true;
    }

    _hasAccountSink.add(_hasAccount);
  }

  void dispose() {
    _hasAccountEventController.close();
    _hasAccountStateController.close();
  }
}
