import 'package:flutter/material.dart';
import 'package:task_app/presentation/widgets/background_waves.dart';
import 'package:task_app/presentation/widgets/input_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          BackgroundWaves(),
          _HeaderText(),
          _BottomText(),
          Center(
            child: _LoginForm()
          )
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {

    final customTextStyles = Theme.of(context).textTheme;

    return Positioned(
      top: 64,
      left: 32,
      child: SizedBox(
        width: 180,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Welcome Back,', style: customTextStyles.headlineSmall),
            Text('Sign in!', style: customTextStyles.displayMedium),
          ]
        ),
      )
    );
  }
}

class _BottomText extends StatelessWidget {
  const _BottomText();

  @override
  Widget build(BuildContext context) {

    final customTextStyles = Theme.of(context).textTheme;
    final customColorTheme = Theme.of(context).colorScheme;

    return Positioned(
      bottom: 10,
      left: 32,
      child: SizedBox(
        width: 180,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Do not have an account?', style: customTextStyles.labelMedium!.copyWith( fontWeight: FontWeight.bold,)),
            Text('Register now', style: customTextStyles.labelLarge!.copyWith(color: customColorTheme.primary, fontStyle: FontStyle.italic)),
          ]
        ),
      )
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      // color: Colors.amber.withOpacity(0.2),
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20,),
            InputText( 
              label: 'Username', 
              validationFunction: validateUsername, 
            ),
            const SizedBox( height: 18,),
            InputText( 
              label: 'Password', 
              validationFunction: validatePassword,
              hideInput: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: _SubmitButton(loginFormKey: _loginFormKey),
            )
          ],
        )
      ),
    );
  }

  String? validateUsername( String? input ){

    if( input == null || input.isEmpty ) return 'Please enter a username';
    if( input.length <= 3 ) return 'Username must be greater than 3';
    if( input.length >= 15 ) return 'Username must be smaller than 15';

    return null;
  }

  String? validatePassword( String? input ){

    if( input == null || input.isEmpty ) return 'Please enter ypur password';
    if( input.length <= 4 ) return 'The password must be greater than 4';

    return null;
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    super.key,
    required GlobalKey<FormState> loginFormKey,
  }) : _loginFormKey = loginFormKey;

  final GlobalKey<FormState> _loginFormKey;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll( colorScheme.onPrimaryContainer ),
        padding: const MaterialStatePropertyAll( EdgeInsets.symmetric(horizontal: 100, vertical: 12))
      ),
      onPressed: () {
        FocusScope.of(context).unfocus();
        if( _loginFormKey.currentState!.validate() ){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('creadentials are ok!'))
          );
        }
      },
      child: Text('Sign in', style: textStyle.bodyLarge!.copyWith(color: colorScheme.onPrimary),),
    );
  }
}


