
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/order_view/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    OrderController controller=Get.find<OrderController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("order details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _orderHeader(),
            const SizedBox(height: 16),
            _customerInfo(),
            const SizedBox(height: 16),
            _orderItems(),
            const SizedBox(height: 16),
            _orderSummary(),
            const SizedBox(height: 16),
            _paymentInfo(),
            const SizedBox(height: 24),
           
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _orderHeader() {
    OrderController controller=Get.find<OrderController>();
    return Card(
      child: ListTile(
        title:  Text(
          'order num: ${controller.orders[index].id}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle:  Text(controller.formatDate(controller.orders[index]["createdAt"])),
        trailing: Chip(
          label:  Text(
            controller.orders[index]["status"],
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: controller.getOrderColor( controller.orders[index]["status"]),
        ),
      ),
    );
  }

  // ================= CUSTOMER INFO =================
  Widget _customerInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "user info",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            _InfoRow(icon: Icons.person, text: 'رغد عمور'),
            _InfoRow(icon: Icons.phone, text: '0938xxxxxx'),
            _InfoRow(icon: Icons.location_on, text: 'حمص - بابا عمرو'),
          ],
        ),
      ),
    );
  }

  // ================= ORDER ITEMS =================
  Widget _orderItems() {
    OrderController controller=Get.find<OrderController>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'products',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(),
          SizedBox(
            height: screenWidth(3),
            child: ListView.builder(
              itemCount:controller.orders[index]["items"].length,
              itemBuilder: (context, index1) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                   controller.orders[index]["items"][index1]["name"] ,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('price: ${controller.orders[index]["items"][index1]["price"]}\$'),
                  Text('quantity:${controller.orders[index]["items"][index1]["quantity"]} '),
                ],
              ),
            ),
             Text(
              '${controller.orders[index]["items"][index1]["quantity"]*controller.orders[index]["items"][index1]["price"]} \$',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
                  ],
                ),
              ),),
          )
          ],
        ),
      ),
    );
  }


  // ================= SUMMARY =================
  Widget _orderSummary() {
        OrderController controller=Get.find<OrderController>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(

'order summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            _SummaryRow(label: 'sum', value: '${controller.orders[index]["total"]}\$'),
            _SummaryRow(label: 'deliver', value: '50\$'),
            Divider(),
            _SummaryRow(
              label: 'total',
              value: '${controller.orders[index]["total"]+50}\$',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  // ================= PAYMENT =================
  Widget _paymentInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'الدفع والتوصيل',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            _InfoRow(icon: Icons.payment, text: 'الدفع عند الاستلام'),
            _InfoRow(icon: Icons.local_shipping, text: 'توصيل عادي'),
          ],
        ),
      ),
    );
  }

  // ================= ACTIONS =================
 
}

// ================= SMALL WIDGETS =================
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
} 

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

   _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }
}