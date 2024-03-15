import 'package:bloc/bloc.dart';
import 'package:packages_tester_updated/packages/calendar/calendar_remote_data_source.dart';
import 'package:packages_tester_updated/packages/calendar/entities/month.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  static const _months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  final CalendarRemoteDataSource remoteDataSource = CalendarRemoteDataSource();
  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarEvent>((event, emit)async{
      if(event is InitCalendarView){
        _initCalendarView(emit);
      }else if(event is ChangeCalendarView){
        await _changeCalendarView(event, emit);
      }
    });
  }

  void _initCalendarView(Emitter<CalendarState> emit){
    emit(const OnCalendarActive(
      viewInitDate: null,
      viewEndDate: null,
      selectedDate: null,
      specialDaysByMonths: [],
      viewSpecialDays: []
    ));
  }


  Future<void> _changeCalendarView(ChangeCalendarView event, Emitter<CalendarState> emit)async{
    final initState = state as OnCalendarActive;
    final initDate = event.initDate;
    final endDate = event.endDate;
    final lastInitDate = initState.viewInitDate;
    final lastEndDate = initState.viewEndDate;
    final specialDaysByMonths = <Month>[];
    final viewSpecialDays = <DateTime>[];
    final allMonths = _extractMonthsFromLapseOfTime(initDate, endDate);

    if(lastInitDate == null || lastEndDate == null){
      await _generateInitialCurrentViewSpecialDays(specialDaysByMonths, viewSpecialDays, allMonths);
    }else{
      await _generateChangeCurrentViewSpecialDays(specialDaysByMonths, viewSpecialDays, allMonths, initState.specialDaysByMonths);
    }
    
    emit(OnCalendarActive(
      viewInitDate: initDate,
      viewEndDate: endDate,
      selectedDate: initState.selectedDate,
      specialDaysByMonths: specialDaysByMonths,
      viewSpecialDays: viewSpecialDays
    ));
  }

  Future<void> _generateInitialCurrentViewSpecialDays(List<Month> specialDaysByMonths, List<DateTime> viewSpecialDays, List<DateTime> allMonths)async{
    for(final month in allMonths){
      final specialDays = await remoteDataSource.getMonthSpecialDays(month);
      specialDaysByMonths.add(Month(
        index: month.month,
        specialDays: specialDays
      ));
      viewSpecialDays.addAll(specialDays);
    }
  }

  Future<void> _generateChangeCurrentViewSpecialDays(List<Month> specialDaysByMonths, List<DateTime> viewSpecialDays, List<DateTime> allMonths, List<Month> lastSpecialDayByMonths)async{
    for(final month in allMonths){
      final loadedMonthIndex = lastSpecialDayByMonths.indexWhere(
        (m) => m.index == month.month
      );
      late Month currentLoadedMonth;
      if(loadedMonthIndex != -1){
        currentLoadedMonth = lastSpecialDayByMonths[loadedMonthIndex];
      }else{
        final specialDays = await remoteDataSource.getMonthSpecialDays(month);
        currentLoadedMonth = Month(
          index: month.month,
          specialDays: specialDays
        );
      }
      specialDaysByMonths.add(currentLoadedMonth);
      viewSpecialDays.addAll(currentLoadedMonth.specialDays);
    }
  }

  List<DateTime> _extractMonthsFromLapseOfTime(DateTime init, DateTime end){
    int initMonth = init.month;
    final endMonth = end.month;
    final months = <DateTime>[];
    bool endMonthArrived = false;
    for(int y = init.year; !endMonthArrived; y++){
      for(int m = initMonth; m <= _months.length && !endMonthArrived; m++){
        months.add(DateTime(y, m));
        if(m == endMonth){
          endMonthArrived = true;
        }
      }
      initMonth = 1;
    }
    return months;
  }
}
