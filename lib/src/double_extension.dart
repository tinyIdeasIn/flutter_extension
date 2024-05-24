import 'package:flutter_extension/flutter_extension.dart';

extension DoubleOption on double {

  String string() => "$this";

  /*
  * 加千分号
  * */
  String get thousands {
    List<String> numSub = '$this'.split(".");
    try {
      var result = numSub.first.thousands;
      if(numSub.length > 1){
        result = "$result.${numSub[1]}";
      }
    } catch (e) {
      Future.error(e);
    }
    return '$this';
  }
}
