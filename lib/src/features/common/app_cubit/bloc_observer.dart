import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class XBlocObserver extends BlocObserver {
  @override
  void onEvent(
    Bloc bloc,
    Object? event,
  ) {
    LoggerHelper.eventBloc('$event');
    super.onEvent(
      bloc,
      event,
    );
  }

  @override
  void onTransition(
    Bloc bloc,
    Transition transition,
  ) {
    LoggerHelper.transitionBloc('$transition');
    super.onTransition(
      bloc,
      transition,
    );
  }

  @override
  void onChange(
    BlocBase bloc,
    Change change,
  ) {
    LoggerHelper.changedBloc(
      text: '${bloc.runtimeType}',
      current: '${change.currentState}',
      next: '${change.nextState}',
    );
    super.onChange(
      bloc,
      change,
    );
  }

  @override
  void onClose(BlocBase bloc) {
    LoggerHelper.closeBloc('${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    LoggerHelper.createBloc('${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    LoggerHelper.errorBloc(
      '${bloc.runtimeType}',
      error,
      stackTrace,
    );
    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }
}
