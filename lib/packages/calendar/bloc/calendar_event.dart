part of 'calendar_bloc.dart';

sealed class CalendarEvent {
  const CalendarEvent();
}

class InitCalendarView extends CalendarEvent{
  
}

class ChangeCalendarView extends CalendarEvent{
  final DateTime initDate;
  final DateTime endDate;
  ChangeCalendarView({
    required this.initDate,
    required this.endDate
  });
}

class ChooseDay extends CalendarEvent{
  final DateTime day;
  ChooseDay({required this.day});
}
