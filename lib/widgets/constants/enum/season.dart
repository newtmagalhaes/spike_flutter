enum AnimeSeason {
  winter(months: ['January', 'February', 'March']);
  
  final List<String> months;

  const AnimeSeason({
    required this.months,
  });

  static AnimeSeason seasonFromMonth(String month) {
    if (winter.months.contains(month)) return winter;

    throw FormatException('invalid month');
  }
}
