import 'package:mobx/mobx.dart';

part 'model.g.dart';

class KeyboardModel = _KeyboardModel with _$KeyboardModel;

abstract class _KeyboardModel with Store {

  _KeyboardModel();

  @observable
  String _workingValue;
  @observable
  String _valA;
  @observable
  String _valB;

  @computed
  get workingValue => _workingValue;
  @computed
  get valA => _valA ?? '0';
  @computed
  get valB => _valB ?? '0';

  Future<bool> setWorkingValue(value) {
    _workingValue = value;
    return Future.value(true);
  }
  Future<bool> setValA(value) {
    _valA = value;
    return Future.value(true);
  }
  Future<bool> setValB(value) {
    _valB = value;
    return Future.value(true);
  }
}