import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';

class Bloc extends Object with Validators {
  final _principleController = BehaviorSubject<String>();
  final _interestRateController = BehaviorSubject<String>();
  final _compoundPeriodController = BehaviorSubject<String>();
  final _initialDateController = BehaviorSubject<String>();
  final _finalDateController = BehaviorSubject<String>();

  Function(String) get changePrinciple => _principleController.sink.add;
  Function(String) get changeInterestRate => _interestRateController.sink.add;
  Function(String) get changeCompoundPeriod =>
      _compoundPeriodController.sink.add;
  Function(String) get changeinitialDate => _initialDateController.sink.add;
  Function(String) get changefinalDate => _finalDateController.sink.add;

  Stream<String> get principle =>
      _principleController.stream.transform(validatePrinciple);
  Stream<String> get interestRate =>
      _interestRateController.stream.transform(validateinterestRate);
  Stream<String> get compoundPeriod =>
      _compoundPeriodController.stream.transform(validatecompoundPeriod);
  Stream<String> get initialDate =>
      _initialDateController.stream.transform(validateinitialDate);
  Stream<String> get finalDate =>
      _finalDateController.stream.transform(validatefinalDate);

  Stream<bool> get submitValid => Rx.combineLatest5(
          principle, interestRate, compoundPeriod, initialDate, finalDate,
          (p, i, c, inD, fiD) {
        if (p == _principleController.value &&
            i == _interestRateController.value) {
          return true;
        } else {
          return null;
        }
      });

  submit() {
    final validPrinciple = _principleController.value;
    final validInterestRate = _interestRateController.value;
    final validCompoundPeriod = _compoundPeriodController.value;
    final validInitialDate = _initialDateController.value;
    final validfinalDate = _finalDateController.value;

    print('Prinicple: $validPrinciple');
    print('Prinicple: $validInterestRate');
    print('Prinicple: $validCompoundPeriod');
    print('Prinicple: $validInitialDate');
    print('Prinicple: $validfinalDate');
  }

  dispose() {
    _principleController.close();
    _interestRateController.close();
    _compoundPeriodController.close();
    _initialDateController.close();
    _finalDateController.close();
  }
}
