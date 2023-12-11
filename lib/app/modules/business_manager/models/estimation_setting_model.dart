class EstimationSettingModel {
  String expirationPeriod;
  String advancePayment;
  String cancellationFee;
  String taxExempt;
  String lockEstimation;
  String issue;
  List<dynamic> commonPolices;

  EstimationSettingModel({
    required this.expirationPeriod,
    required this.advancePayment,
    required this.cancellationFee,
    required this.taxExempt,
    required this.lockEstimation,
    required this.issue,
    required this.commonPolices,
  });
}
