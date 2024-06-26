import 'package:fluttertoast/fluttertoast.dart';
import 'package:transport_management/util/resources/r.dart';

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: R.colors.white_FFFFFF,
    backgroundColor: R.colors.green_337A34,
  );
}
