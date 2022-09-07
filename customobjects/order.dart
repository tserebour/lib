import 'package:laundry/customobjects/service_prices.dart';
import 'receipt.dart';


class Order {
  Receipt receipt = new Receipt();
  Service_price service_price = new Service_price();
  int quantity = 0;
  double price = 0;
}