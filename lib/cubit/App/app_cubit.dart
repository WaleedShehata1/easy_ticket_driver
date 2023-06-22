import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../network/local/dio_helper.dart';
import '../../network/remote/end_points.dart';
import '../../widget/model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  Bus? bus;
  void getBusList() {
    emit(Loading());
    DioHelper.getDataTicket(url: data_bus).then((value) {
      bus = Bus.fromJson(value.data);
      final Pattern = RegExp(',{1.800}');
      print('busList = ${value.data}');
      emit(BusSuccess(bus));
    }).catchError((error) {
      print('error bus list = ${error.toString()}');
      emit(BusError(error));
    });
  }
}
