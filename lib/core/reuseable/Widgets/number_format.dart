import 'package:intl/intl.dart';

String formatAmount(amount) {
  var numberFormat = '';
  NumberFormat formatter = NumberFormat('#,##0');
 if(amount.runtimeType == int){
  numberFormat = formatter.format(amount);
 } else if(amount.runtimeType == String){
   int newNumber = int.parse(amount);
   numberFormat = formatter.format(newNumber);
 }
  return numberFormat;
}