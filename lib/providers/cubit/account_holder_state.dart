part of 'account_holder_cubit.dart';

abstract class AccountHolderState extends Equatable {
  final bool haveAccount;

  const AccountHolderState({required this.haveAccount});

  @override
  List<Object> get props => [];
}

class AccountHolder extends AccountHolderState {
  const AccountHolder() : super(haveAccount: true);
}
class CreateAccountState extends AccountHolderState{
  const CreateAccountState():super(haveAccount: false);
}
