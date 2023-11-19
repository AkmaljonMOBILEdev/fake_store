import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(const TabState(index: 0));

  void changeIndex(int newIndex){
    emit(TabState(index: newIndex));
  }
}
