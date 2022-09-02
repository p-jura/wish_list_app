import 'package:flutter/material.dart';
import 'package:wish_list_app/models/auth_screen_bloc.dart';
import 'package:wish_list_app/models/auth_scrren_event.dart';

class AuthFormFields extends StatefulWidget {
  AuthFormFields({required this.isKeybordVisible, Key? key}) : super(key: key);

  final bool isKeybordVisible;

  @override
  State<AuthFormFields> createState() => _AuthFormFieldsState();
}

class _AuthFormFieldsState extends State<AuthFormFields> {
  
  final InputDecoration textFormFieldDecoration = InputDecoration(
    constraints: const BoxConstraints(maxWidth: 300),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(),
    ),
  );

  final _bloc = SigningInLogingInBloc();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      flex: 5,
      child: StreamBuilder<bool>(
        stream: _bloc.hasAccount,
        initialData: false,
        builder: (ctx, snapshot) {
          bool haveAccount = snapshot.data!;
          return Container(
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    haveAccount
                        ? 'Log in to your account'
                        : 'Create an Account',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: textFormFieldDecoration.copyWith(
                      label: const Text('Email adress'),
                    ),
                  ),
                  TextFormField(
                    decoration: textFormFieldDecoration.copyWith(
                      label: const Text('Password'),
                    ),
                  ),
                  Visibility(
                    visible: !haveAccount,
                    child: TextFormField(
                      decoration: textFormFieldDecoration.copyWith(
                        label: const Text('Submit password'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceSize.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(haveAccount ? 'SIGN IN' : 'SIGN UP'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(haveAccount
                          ? 'You dont have an account?'
                          : 'If you have an account'),
                      ElevatedButton(
                        onPressed: () {
                          _bloc.hasAccountEventSink.add(
                            snapshot.data == true ? SignIn() : SignUp(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: Text(
                          haveAccount ? 'CREATE' : 'SIGN IN',
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
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
