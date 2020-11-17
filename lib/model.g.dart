// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$KeyboardModel on _KeyboardModel, Store {
  Computed<dynamic> _$workingValueComputed;

  @override
  dynamic get workingValue =>
      (_$workingValueComputed ??= Computed<dynamic>(() => super.workingValue,
              name: '_KeyboardModel.workingValue'))
          .value;
  Computed<dynamic> _$valAComputed;

  @override
  dynamic get valA => (_$valAComputed ??=
          Computed<dynamic>(() => super.valA, name: '_KeyboardModel.valA'))
      .value;
  Computed<dynamic> _$valBComputed;

  @override
  dynamic get valB => (_$valBComputed ??=
          Computed<dynamic>(() => super.valB, name: '_KeyboardModel.valB'))
      .value;

  final _$_workingValueAtom = Atom(name: '_KeyboardModel._workingValue');

  @override
  String get _workingValue {
    _$_workingValueAtom.reportRead();
    return super._workingValue;
  }

  @override
  set _workingValue(String value) {
    _$_workingValueAtom.reportWrite(value, super._workingValue, () {
      super._workingValue = value;
    });
  }

  final _$_valAAtom = Atom(name: '_KeyboardModel._valA');

  @override
  String get _valA {
    _$_valAAtom.reportRead();
    return super._valA;
  }

  @override
  set _valA(String value) {
    _$_valAAtom.reportWrite(value, super._valA, () {
      super._valA = value;
    });
  }

  final _$_valBAtom = Atom(name: '_KeyboardModel._valB');

  @override
  String get _valB {
    _$_valBAtom.reportRead();
    return super._valB;
  }

  @override
  set _valB(String value) {
    _$_valBAtom.reportWrite(value, super._valB, () {
      super._valB = value;
    });
  }

  @override
  String toString() {
    return '''
workingValue: ${workingValue},
valA: ${valA},
valB: ${valB}
    ''';
  }
}
