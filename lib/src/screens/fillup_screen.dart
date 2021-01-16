import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../blocs/provider.dart';
import '../blocs/bloc.dart';

class FillUpScreen extends StatelessWidget {
  DateTime nowDate = DateTime.now();
  TextEditingController initDateCtl = TextEditingController();
  TextEditingController finalDateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('DhanLakshmi'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            principleField(bloc),
            interestRateField(bloc),
            compoundingTimeField(bloc),
            initialDate(bloc),
            finalDate(bloc),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget principleField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.principle,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
          maxLength: 8,
          decoration: InputDecoration(
            labelText: 'Principle',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePrinciple,
        );
      },
    );
  }

  Widget interestRateField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.interestRate,
      builder: (context, snapshot) {
        return TextField(
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter(
              RegExp(r'^(\d+)?\.?\d{0,2}'),
            ),
          ],
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          maxLength: 5,
          decoration: InputDecoration(
            labelText: 'Interest Rate %',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeInterestRate,
        );
      },
    );
  }

  Widget compoundingTimeField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.compoundPeriod,
      builder: (context, snapshot) {
        return DropdownButton<String>(
          value: snapshot.data,
          items: <String>[
            'Simple Interest',
            '4 Year',
            '3 Year',
            '2 Year',
            '1 Year',
            '9 Month',
            '8 Month',
            '6 Month',
            '4 Month',
            '3 Month',
            '2 Month',
            '1 Month',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: bloc.changeCompoundPeriod,
          hint: Text('Choose Compounding Period'),
        );
      },
    );
  }

  Widget initialDate(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.initialDate,
      builder: (context, AsyncSnapshot snapshot) {
        return TextField(
          controller: initDateCtl,
          readOnly: true,
          onTap: () async {
            final DateTime picked = await showDatePicker(
              context: context,
              initialDate: nowDate,
              firstDate: DateTime(1950),
              lastDate: DateTime(2099),
              initialEntryMode: DatePickerEntryMode.input,
              helpText: 'Select Initial Date',
              errorFormatText: 'Enter valid date',
              errorInvalidText: 'Enter date in valid range',
              fieldLabelText: 'Initial Date',
              fieldHintText: 'Month/Date/Year',
            );
            if (picked != null) {
              nowDate = picked;
              initDateCtl.text = nowDate.toString().split(' ')[0];
              bloc.changeinitialDate(initDateCtl.text);
            }
          },
          decoration: InputDecoration(
            labelText: 'Initial Date',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget finalDate(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.initialDate,
      builder: (context, AsyncSnapshot snapshot) {
        return TextField(
          controller: finalDateCtl,
          readOnly: true,
          onTap: () async {
            final DateTime picked = await showDatePicker(
              context: context,
              initialDate: nowDate,
              firstDate: DateTime(1950),
              lastDate: DateTime(2099),
              initialEntryMode: DatePickerEntryMode.input,
              helpText: 'Select Final Date',
              errorFormatText: 'Enter valid date',
              errorInvalidText: 'Enter date in valid range',
              fieldLabelText: 'Final Date',
              fieldHintText: 'Month/Date/Year',
            );
            if (picked != null) {
              nowDate = picked;
              finalDateCtl.text = nowDate.toString().split(' ')[0];
              bloc.changefinalDate(finalDateCtl.text);
            }
          },
          decoration: InputDecoration(
            labelText: 'Final Date',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
