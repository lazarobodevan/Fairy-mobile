import 'package:flutter/material.dart';
import 'package:mobile/models/order.dart';
import 'package:mobile/shared/components/order_card.dart';

class OrdersTab extends StatelessWidget {
  final List<OrderModel> orders;
  const OrdersTab({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: orders.isNotEmpty ? ListView.separated(
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index],);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: orders.length,
      ) : Center(child: Text("Nada por aqui..."),),
    );
  }
}
