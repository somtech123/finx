import 'package:intl/intl.dart';

class CurrencyUtils {
  static final formatCurrency = NumberFormat.currency(
    locale: "en_US",
    symbol: "NGN",
  );
}
