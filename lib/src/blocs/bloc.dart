import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';
import 'calculation_provider.dart';

class Bloc extends Object with Validators, CalculationProvider {
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

  String get exposedPrinciple => _principleController.value;
  String get exposedInterestRate => _interestRateController.value;
  String get exposedCompoundingPeriod => _compoundPeriodController.value;
  String get exposedInitialDate => _initialDateController.value;
  String get exposedFinalDate => _finalDateController.value;

  submit() {
    final validPrinciple = exposedPrinciple;
    final validInterestRate = exposedInterestRate;
    final validCompoundPeriodString = exposedCompoundingPeriod;
    final validInitialDate = exposedInitialDate;
    final validfinalDate = exposedFinalDate;

    String validCompoundPeriod;

    print('Prinicple: $validPrinciple');
    print('Prinicple: $validInterestRate');
    print('Prinicple: $validCompoundPeriodString');
    print('Prinicple: $validInitialDate');
    print('Prinicple: $validfinalDate');

    if (validCompoundPeriodString == 'Simple Interest') {
      validCompoundPeriod = '360';
    } else if (validCompoundPeriodString == '4 Year') {
      validCompoundPeriod = '48';
    } else if (validCompoundPeriodString == '3 Year') {
      validCompoundPeriod = '36';
    } else if (validCompoundPeriodString == '2 Year') {
      validCompoundPeriod = '24';
    } else if (validCompoundPeriodString == '1 Year') {
      validCompoundPeriod = '12';
    } else if (validCompoundPeriodString == '9 Month') {
      validCompoundPeriod = '9';
    } else if (validCompoundPeriodString == '8 Month') {
      validCompoundPeriod = '8';
    } else if (validCompoundPeriodString == '6 Month') {
      validCompoundPeriod = '6';
    } else if (validCompoundPeriodString == '4 Month') {
      validCompoundPeriod = '4';
    } else if (validCompoundPeriodString == '3 Month') {
      validCompoundPeriod = '3';
    } else if (validCompoundPeriodString == '2 Month') {
      validCompoundPeriod = '2';
    } else if (validCompoundPeriodString == '1 Month') {
      validCompoundPeriod = '1';
    }

    print('validPeriod: $validCompoundPeriod');

    calculation(validPrinciple, validInterestRate, validCompoundPeriod,
        validInitialDate, validfinalDate);

    print('Amount: $exposedCalculatedAmount');
    print('TotalInterest: $exposedCalculatedTotalIntererest');
  }

  dispose() {
    _principleController.close();
    _interestRateController.close();
    _compoundPeriodController.close();
    _initialDateController.close();
    _finalDateController.close();
  }
}
