part of 'calendar_bloc.dart';

sealed class CalendarState {
  const CalendarState();
}

final class CalendarInitial extends CalendarState {}

class OnLoadingCalendar extends CalendarState {

}

class OnCalendarActive extends CalendarState {
  final DateTime? viewInitDate;
  final DateTime? viewEndDate;
  final DateTime? selectedDate;
  final List<Month> specialDaysByMonths;
  final List<DateTime> viewSpecialDays;
  const OnCalendarActive({
    required this.selectedDate,
    required this.viewSpecialDays,
    required this.viewInitDate,
    required this.specialDaysByMonths,
    required this.viewEndDate
  });
}