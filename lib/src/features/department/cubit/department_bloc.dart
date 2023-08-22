import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/department/department_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'department_state.dart';

class DepartmentBloc extends Cubit<DepartmentState> {
  DepartmentBloc() : super(DepartmentState.ds()) {
    getListDepartment();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getListDepartment() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    final value = await _domain.departmentRepository.getListDepartment(token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(list: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(DepartmentState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
