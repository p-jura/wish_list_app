import 'package:flutter/material.dart';
import 'package:wish_list_app/models/auth_screen_bloc.dart';
import 'package:wish_list_app/models/auth_scrren_event.dart';
import 'package:wish_list_app/screens/authentication/widgets/text_field.dart';

class AuthFormFields extends StatefulWidget {
  AuthFormFields({required this.isKeybordVisible, Key? key}) : super(key: key);
  final bool isKeybordVisible;
  @override
  State<AuthFormFields> createState() => _AuthFormFieldsState();
}

class _AuthFormFieldsState extends State<AuthFormFields> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final _bloc = SigningInLogingInBloc();

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
                    Text(haveAccount == true
                        ? 'Log in to your account'
                        : 'Create an Account'),
                    TextFormField(
                      decoration: InputDecoration(
                        label: const Text('Email adress'),
                        constraints: const BoxConstraints(maxWidth: 300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(),
                        ),
                        label: const Text('Password'),
                        constraints: const BoxConstraints(maxWidth: 300),
                      ),
                    ),
                    haveAccount
                        ? const SizedBox.shrink()
                        : const CustomTextFormField(
                            textlabel: 'Submit password'),
                    SizedBox(
                      width: deviceSize.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFf97e3e)),
                        onPressed: () {},
                        child:
                            Text(haveAccount == true ? 'SIGN IN' : 'SIGN UP'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(haveAccount == true
                            ? 'You dont have an account?'
                            : 'If you have an account'),
                        ElevatedButton(
                          onPressed: () {
                            _bloc.hasAccountEventSink.add(
                                snapshot.data == true ? SignIn() : SignUp());
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            haveAccount == true ? 'CREATE' : 'SIGN IN',
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
