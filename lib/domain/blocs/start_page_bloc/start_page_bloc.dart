import 'package:bloc/bloc.dart';
import 'package:fier/ui/resources/app_images.dart';
import 'package:meta/meta.dart';

part 'start_page_event.dart';
part 'start_page_state.dart';

class StartPageBloc extends Bloc<StartPageEvent, StartPageState> {
  StartPageBloc() : super(StartPageInitial()) {
    on<StartPageLoadedEvent>((event, emit) {
      emit(StartPageLoadedState());
    });
  }
}
