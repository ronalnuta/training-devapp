part of 'account_bloc.dart';

class AccountState extends Equatable {
  final bool isLoading;
  final String token;
  final InfoAccountModel infoAccount;

  bool get accountNotExist => infoAccount.username.isEmpty;

  bool get isTeacher => infoAccount.type == AccountType.teacher;

  const AccountState({
    this.isLoading = true,
    this.token = "",
    required this.infoAccount,
  });

  factory AccountState.ds() => AccountState(
        isLoading: true,
        token: "",
        infoAccount: InfoAccountModel.empty(),
      );

  factory AccountState.empty() =>
      AccountState(token: "", infoAccount: InfoAccountModel.empty());

  @override
  List<Object?> get props => [
        isLoading,
        token,
        infoAccount,
      ];

  AccountState copyWith({
    bool? isLoading,
    String? token,
    InfoAccountModel? infoAccount,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      infoAccount: infoAccount ?? this.infoAccount,
    );
  }
}
