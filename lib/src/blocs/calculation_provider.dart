class CalculationProvider {
  int _differenceInMonths;
  int _differenceInDays;
  int _differenceInYears;
  double _totalInterest;
  double _amount;

  int _year2;
  int _month2;
  int _day2;
  int _year1;
  int _month1;
  int _day1;

  int _days;
  int _months;
  int _years;

  String get exposedCalculatedTotalIntererest =>
      _totalInterest.floor().toString();
  String get exposedCalculatedAmount => _amount.floor().toString();

  String get exposedTimePassed => '$_years Year  $_months Month  $_days Day';

  calculation(
      String validPrinciple,
      String validInterestRate,
      String validCompoundPeriod,
      String validInitialDate,
      String validfinalDate) {
    var tdate = validInitialDate.split("-");
    var gdate = validfinalDate.split("-");

    _day1 = int.parse(tdate[2]);
    _month1 = int.parse(tdate[1]);
    _year1 = int.parse(tdate[0]);
    _day2 = int.parse(gdate[2]);
    _month2 = int.parse(gdate[1]);
    _year2 = int.parse(gdate[0]);

    if (_day2 >= _day1) {
      _days = _day2 - _day1;
    } else {
      _day2 = _day2 + 30;
      _days = _day2 - _day1;

      _month2 = _month2 - 1;
    }

    if (_month2 >= _month1) {
      _months = _month2 - _month1;
    } else {
      _month2 = _month2 + 12;
      _months = _month2 - _month1;

      _year2 = _year2 - 1;
    }

    _years = _year2 - _year1;

    _differenceInDays = _days;
    _differenceInMonths = _months;
    _differenceInYears = _years;

    print('time: $_differenceInDays $_differenceInMonths $_differenceInYears');

    fcalculation(
        _differenceInYears,
        _differenceInMonths,
        _differenceInDays,
        double.parse(validPrinciple),
        double.parse(validInterestRate),
        int.parse(validCompoundPeriod));
    print('////////////////////');
  }

  fcalculation(int fyear, int fmonth, int fday, double fprinciple, double frate,
      int fperiod) {
    _totalInterest = 0;
    double principle = fprinciple;
    double rate = frate;
    int day = fday;
    int month = fmonth;
    int year = fyear;
    double yinterest = 0;
    double minterest = 0;
    double dinterest = 0;
    int n = fperiod; //n=period
    int totalMonth = 0;
    totalMonth = (12 * year) + month;
    //System.out.println(totalMonth);

    year = (totalMonth / n).toInt();
    month = totalMonth % n;
    for (int i = 1; i <= year; i++) {
      yinterest = (principle * rate * n) / 100;
      principle += yinterest;

      _totalInterest += yinterest;
      //System.out.println(yinterest);
    }

    minterest = (principle * rate * month) / 100;
    //System.out.println(minterest);

    dinterest = ((principle * rate * 1) / (100 * 30)) * day;
    //System.out.println(dinterest);

    _amount = principle + minterest + dinterest;

    _totalInterest = _totalInterest + minterest + dinterest;

    print('f: $_amount');
    print('f: $_totalInterest');
  }
}
