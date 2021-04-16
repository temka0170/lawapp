import 'package:intl/intl.dart';

//formula of calculator
class CalculatePrice {
  String result;
  double placehold;
  String tomyo(String val) {
    int value = int.parse(val.replaceAll((new RegExp(r",")), ''));
    if (value == 0) {
      result = '0.00';
    } else if (value <= 130000) {
      result = '4,550';
    } else if (value <= 650000 && value > 130000) {
      placehold = 4550 + (value - 130000) * 0.03;
      result = NumberFormat("#,##0.##").format(placehold);
    } else if (value <= 1300000 && value > 650000) {
      placehold = 20150 + (value - 650000) * 0.024;
      result = NumberFormat("#,##0.##").format(placehold);
    } else if (value <= 13000000 && value > 1300000) {
      placehold = 35750 + (value - 1300000) * 0.016;
      result = NumberFormat("#,##0.##").format(placehold);
    } else if (value > 13000000) {
      placehold = 222950 + (value - 13000000) * 0.005;
      result = NumberFormat("#,##0.##").format(placehold);
    }
    return result;
  }

  String printResult() {
    return result;
  }
}
