// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wish_list_app/providers/cubit/account_holder_cubit.dart';
import 'package:wish_list_app/screens/authentication/widgets/auth_form_fields.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  static const MAIN_FLEX_VALUE = 7;
  static const FOCUSED_FIELD_FLEX_VALUE = 1;

  @override
  Widget build(BuildContext context) {
    bool isKeybordVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: const Color(0xFF2f2725),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex:
                  isKeybordVisible ? FOCUSED_FIELD_FLEX_VALUE : MAIN_FLEX_VALUE,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/auth-image.jpg'),
                  ),
                ),
              ),
            ),
            BlocProvider(
              create: (_) => AccountHolderCubit(),
              child: BlocBuilder<AccountHolderCubit, AccountHolderState>(
                builder: (context, state) {
                  return AuthFormFields(
                    isKeybordVisible: isKeybordVisible,
                    haveAccount: state.haveAccount,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
