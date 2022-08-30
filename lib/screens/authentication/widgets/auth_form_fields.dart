import 'package:flutter/material.dart';
import 'package:wish_list_app/models/auth_screen_bloc.dart';
import 'package:wish_list_app/models/auth_scrren_event.dart';

class AuthFormFields extends StatelessWidget {
  const AuthFormFields({
    Key? key,
  }) : super(key: key);

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
            return !snapshot.hasData
                ? const CircularProgressIndicator()
                : Container(
                    constraints: BoxConstraints(minWidth: deviceSize.width),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF000000),
                          blurRadius: 8,
                          offset: Offset(0, -3),
                        ),
                      ],
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(snapshot.data == true
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
                          SizedBox(
                            width: deviceSize.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFf97e3e)),
                              onPressed: () {},
                              child: const Text('SIGN IN'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('You dont have an account?'),
                              ElevatedButton(
                                onPressed: () {
                                  _bloc.hasAccountEventSink.add(SignUp());
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: const Text(
                                  'CREATE',
                                  style: TextStyle(color: Colors.black),
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
