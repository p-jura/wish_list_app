import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wish_list_app/providers/cubit/account_holder_cubit.dart';

class AuthFormFields extends StatefulWidget {
  const AuthFormFields(
      {required this.isKeybordVisible, required this.haveAccount, Key? key})
      : super(key: key);

  final bool isKeybordVisible;
  final bool haveAccount;
  @override
  State<AuthFormFields> createState() => _AuthFormFieldsState();
}

class _AuthFormFieldsState extends State<AuthFormFields> {
  static const double TXTFD_HORIZONTAL_MARGIN_DEVIDER = 1.2;

  final InputDecoration textFormFieldDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(),
    ),
  );

  final globalKey = GlobalKey<FormState>();

  void validate() {
    globalKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      flex: 8,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(minWidth: deviceSize.width),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF000000),
              blurRadius: 8,
              offset: Offset(0, -3),
            ),
          ],
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(60),
            bottomRight: widget.isKeybordVisible
                ? Radius.zero
                : const Radius.circular(60),
          ),
        ),
        child: Form(
          key: globalKey,
          child: LayoutBuilder(builder: (context, viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.haveAccount
                          ? 'Log in to your account'
                          : 'Create an Account',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      maxLines: 1,
                      decoration: textFormFieldDecoration.copyWith(
                        label: const Text('Email adress'),
                        constraints: BoxConstraints(
                            maxWidth: deviceSize.width /
                                TXTFD_HORIZONTAL_MARGIN_DEVIDER),
                      ),
                      validator: ((value) {
                        if (value != null) {
                          if (value.isEmpty ||
                              !value.contains('@') ||
                              (value.length <= 5)) {
                            return 'Please enter correct email adress';
                          } else {
                            return 'Error during validation';
                          }
                        }
                        return null;
                      }),
                    ),
                    TextFormField(
                      maxLines: 1,
                      decoration: textFormFieldDecoration.copyWith(
                        label: const Text('Password'),
                        constraints: BoxConstraints(
                            maxWidth: deviceSize.width /
                                TXTFD_HORIZONTAL_MARGIN_DEVIDER),
                      ),
                      validator: ((value) {
                        if (value != null) {
                          if (value.isEmpty || (value.length <= 7)) {
                            return 'Password need\'s to be at least 8 characters long';
                          } else {
                            return 'Error during validation';
                          }
                        }
                        return null;
                      }),
                    ),
                    Visibility(
                      visible: !widget.haveAccount,
                      child: TextFormField(
                        maxLines: 1,
                        decoration: textFormFieldDecoration.copyWith(
                          label: const Text('Submit password'),
                          constraints: BoxConstraints(
                              maxWidth: deviceSize.width /
                                  TXTFD_HORIZONTAL_MARGIN_DEVIDER),
                        ),
                        validator: ((value) {
                          if (value != null) {
                            if (value.isEmpty || (value.length <= 7)) {
                              return 'Password need\'s to be at least 8 characters long';
                            } else {
                              return 'Error during validation';
                            }
                          }
                          return null;
                        }),
                      ),
                    ),
                    SizedBox(
                      width: deviceSize.width,
                      child: ElevatedButton(
                        onPressed: () {
                          validate();
                        },
                        child: Text(widget.haveAccount ? 'SIGN IN' : 'SIGN UP'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.haveAccount
                            ? 'You dont have an account?'
                            : 'If you have an account'),
                        ElevatedButton(
                          onPressed: () {
                            widget.haveAccount == true
                                ? context
                                    .read<AccountHolderCubit>()
                                    .changeStateToCreateAccount(true)
                                : context
                                    .read<AccountHolderCubit>()
                                    .changeStateToCreateAccount(false);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            widget.haveAccount ? 'CREATE' : 'SIGN IN',
                            style: TextStyle(
                                color: colorScheme.secondary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
