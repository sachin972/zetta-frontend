import 'package:flutter/material.dart';
import '../Components/FeeCard.dart';
import '../Models/FeeItem.dart';
// import 'fee_card.dart';
// import 'fee_model.dart';

class FeeDetailsPage extends StatefulWidget {
  const FeeDetailsPage({super.key});

  @override
  State<FeeDetailsPage> createState() => _FeeDetailsPageState();
}

class _FeeDetailsPageState extends State<FeeDetailsPage> {
  int? expandedIndex;

  final List<FeeModel> fees = [
    FeeModel(month: "January", date: "06 May", totalFee: 14500, extraFee: 2000, lateCharges: 600, discount: 500, isPaid: true),
    FeeModel(month: "December", date: "06 May", totalFee: 14500, extraFee: 0, lateCharges: 0, discount: 0, isPaid: true),
    FeeModel(month: "November", date: "06 May", totalFee: 16500, extraFee: 0, lateCharges: 0, discount: 0, isPaid: true),
    FeeModel(month: "October", date: "06 May", totalFee: 14500, extraFee: 0, lateCharges: 0, discount: 0, isPaid: true),
    FeeModel(month: "September", date: "06 May", totalFee: 14500, extraFee: 0, lateCharges: 0, discount: 0, isPaid: true),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fee Details"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "School Fee"),
              Tab(text: "Exam Fee"),
              Tab(text: "Activity Fee"),
              Tab(text: "Other Fee"),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(4, (tabIndex) {
            return ListView.builder(
              itemCount: fees.length,
              itemBuilder: (context, index) {
                return FeeCard(
                  fee: fees[index],
                  isExpanded: expandedIndex == index,
                  onTap: () {
                    setState(() {
                      if (expandedIndex == index) {
                        expandedIndex = null; // collapse if already expanded
                      } else {
                        expandedIndex = index; // expand selected
                      }
                    });
                  },
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
