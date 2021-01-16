import 'dart:async';

class Validators {
  final validatePrinciple = StreamTransformer<String, String>.fromHandlers(
    handleData: (principle, sink) {
      if (principle.isNotEmpty) {
        sink.add(principle);
      } else {
        sink.addError('Enter Something');
      }
    },
  );

  final validateinterestRate = StreamTransformer<String, String>.fromHandlers(
    handleData: (interestRate, sink) {
      if (interestRate.isNotEmpty) {
        sink.add(interestRate);
      } else {
        sink.addError('Enter Something');
      }
    },
  );

  final validatecompoundPeriod = StreamTransformer<String, String>.fromHandlers(
    handleData: (compoundPeriod, sink) {
      if (compoundPeriod.isNotEmpty) {
        sink.add(compoundPeriod);
      } else {
        sink.addError('Enter Something');
      }
    },
  );

  final validateinitialDate = StreamTransformer<String, String>.fromHandlers(
    handleData: (initialDate, sink) {
      if (initialDate.isNotEmpty) {
        sink.add(initialDate);
      } else {
        sink.addError('Enter Something');
      }
    },
  );

  final validatefinalDate = StreamTransformer<String, String>.fromHandlers(
    handleData: (finalDate, sink) {
      if (finalDate.isNotEmpty) {
        sink.add(finalDate);
      } else {
        sink.addError('Enter Something');
      }
    },
  );
}
