import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_holder_state.dart';

class AccountHolderCubit extends Cubit<AccountHolderState> {
  AccountHolderCubit() : super(const AccountHolder());

  void changeStateToCreateAccount(bool haveAccount) {
    if (haveAccount) {
      emit(const CreateAccountState());
    } else {
      emit(const AccountHolder());
    }
  }
}
