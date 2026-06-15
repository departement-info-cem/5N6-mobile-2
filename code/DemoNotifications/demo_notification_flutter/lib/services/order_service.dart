import 'package:demo_notification/env.dart';
import 'package:demo_notification/models/dtos/order_request.dart';
import 'package:dio/dio.dart';

Future<void> order(OrderRequest order) async {
  await Dio().post('$apiUrl/api/Notification/SendOrder', data: order.toJson());
}
