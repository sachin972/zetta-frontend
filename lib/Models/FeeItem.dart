class FeeModel {
  final String month;
  final String date;
  final double totalFee;
  final double extraFee;
  final double lateCharges;
  final double discount;
  final bool isPaid;

  FeeModel({
    required this.month,
    required this.date,
    required this.totalFee,
    required this.extraFee,
    required this.lateCharges,
    required this.discount,
    required this.isPaid,
  });

  double get paidFee =>
      totalFee + extraFee + lateCharges - discount;
}
