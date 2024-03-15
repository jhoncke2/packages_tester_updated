const specialDaysForYear = <int, List<int>>{
  1: [1, 2, 5, 10, 20],
  2: [2, 3, 11, 21],
  3: [1, 3, 15, 16, 17],
  4: [1, 20, 21, 22, 28],
  5: [2, 12, 15, 20, 22],
  6: [3, 4, 5, 10, 15],
  7: [1, 8, 9, 10, 18],
  8: [2, 3, 5, 12, 20],
  9: [3, 4, 6, 10, 21],
  10: [1, 5, 8, 12, 22],
  11: [1, 5, 12, 13, 28],
  12: [8, 9, 12, 14, 29]
};

class CalendarRemoteDataSource{
  Future<List<DateTime>> getMonthSpecialDays(DateTime date)async{
    await Future.delayed(const Duration(milliseconds: 200));
    final days = specialDaysForYear[date.month]!;
    return days.map<DateTime>(
      (d) => DateTime(date.year, date.month, d)
    ).toList();
  }
}