import 'package:flutter/material.dart';
import 'package:newdhanlakshmi/src/blocs/provider.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: ListView(
        children: <Widget>[
          Text('Principle: ${bloc.exposedPrinciple}'),
          Text('InterestRate: ${bloc.exposedInterestRate}%'),
          Text('CompoundingPeriod: ${bloc.exposedCompoundingPeriod}'),
          Text('Time: ${bloc.exposedTimePassed}'),
          Text('Total Interest: ${bloc.exposedCalculatedTotalIntererest}'),
          Text('Amount: ${bloc.exposedCalculatedAmount}'),
        ],
      ),
    );
  }
}
