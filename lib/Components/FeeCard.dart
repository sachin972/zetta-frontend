import 'package:flutter/material.dart';
import '../Models/FeeItem.dart';
// import 'fee_model.dart';

class FeeCard extends StatelessWidget {
  final FeeModel fee;
  final bool isExpanded;
  final VoidCallback onTap;

  const FeeCard({
    super.key,
    required this.fee,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("School Fee for ${fee.month}",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(fee.date),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("₹ ${fee.paidFee.toStringAsFixed(0)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: fee.isPaid ? Colors.green : Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      fee.isPaid ? "Paid" : "Pay Now",
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),

              // Expanded Section
              if (isExpanded) ...[
                const Divider(height: 20),
                _detailRow("Total Fee", fee.totalFee),
                _detailRow("Extra Fee", fee.extraFee),
                _detailRow("Late Charges", fee.lateCharges),
                _detailRow("Discount", -fee.discount),
                const SizedBox(height: 8),
                _detailRow("Paid Fee", fee.paidFee, isBold: true),
                if (!fee.isPaid)
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle payment
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Payment gateway integration")),
                        );
                      },
                      child: const Text("Pay Now"),
                    ),
                  ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            (amount < 0 ? "- ₹" : "₹") + amount.abs().toStringAsFixed(0),
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
