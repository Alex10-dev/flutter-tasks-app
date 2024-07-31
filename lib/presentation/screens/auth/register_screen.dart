import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/domain/entities/auth.entity.dart';
import 'package:task_app/presentation/providers/auth/auth_provider.dart';
import 'package:task_app/presentation/providers/auth/register_form_state.dart';
import 'package:task_app/presentation/utils/form_validators.dart';
import 'package:task_app/presentation/widgets/background_waves.dart';
import 'package:task_app/presentation/widgets/input_text_field.dart';
import 'package:task_app/presentation/widgets/shared/custom_text_button.dart';

class RegisterScreen extends StatelessWidget {

  static const String name = 'register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundWaves(),
          _HeaderText(),
          _BottomText(),
          Center(
            child: _RegisterForm(),
          )

        ]
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
      top: 66,
      left: 32,
      child: SizedBox(
        width: 180,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hey! Welcome.', style: customTextStyles.headlineSmall),
            Text('Sign Up!', style: customTextStyles.displayMedium),
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
            Text('Already have an account?', style: customTextStyles.labelMedium!.copyWith( fontWeight: FontWeight.bold,)),
            // Text('Register now', style: customTextStyles.labelLarge!.copyWith(color: customColorTheme.primary, fontStyle: FontStyle.italic)),
            CustomTextButton(
              onTap: () {
                GoRouter.of(context).go('/');
              },
              text: 'Sign In', 
              textColor1: Colors.blue, 
              textColor2: customColorTheme.primary,
            ),
          ]
        ),
      )
    );
  }
}

class _RegisterForm extends ConsumerStatefulWidget {
  const _RegisterForm();

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<_RegisterForm> {

  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    ref.read( registerFormProvider.notifier );
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<Auth>(authProvider, (_, authState) {
      if (authState.isActive) {
        GoRouter.of(context).go('/home');
      }
    });

    final colorScheme = Theme.of(context).colorScheme;
    final formNotifier = ref.read( registerFormProvider.notifier );
    final authNotifier = ref.watch( authProvider.notifier );


    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      // color: Colors.amber.withOpacity(0.2),
      child: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 80,),
              InputText( 
                onChange: formNotifier.setName,
                inputIcon: const Icon( Icons.drive_file_rename_outline_sharp ),
                inputIconColor: colorScheme.primary,
                label: 'Name', 
                validationFunction: FormValidators.validateName, 
              ),
              const SizedBox( height: 10),
              InputText( 
                onChange: formNotifier.setSurname,
                inputIcon: const Icon( Icons.drive_file_rename_outline_sharp ),
                inputIconColor: colorScheme.primary,
                label: 'Surname', 
                validationFunction: FormValidators.validateSurname, 
              ),
              const SizedBox( height: 10),
              InputText( 
                onChange: formNotifier.setUsername,
                inputIcon: const Icon( Icons.person ),
                inputIconColor: colorScheme.primary,
                label: 'Username', 
                validationFunction: FormValidators.validateUsername, 
              ),
              const SizedBox( height: 10),
              InputText( 
                onChange: formNotifier.setPassword,
                inputIcon: const Icon( Icons.key_outlined ),
                inputIconColor: colorScheme.primary,
                label: 'Password', 
                validationFunction: FormValidators.validatePassword,
                hideInput: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _SubmitButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if( _loginFormKey.currentState!.validate() ){
                      authNotifier.login( formNotifier.getUsername, formNotifier.getPassword );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('creadentials are ok!'))
                      );
                    }
                  }
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {

  final VoidCallback onTap;

  const _SubmitButton({
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 6.0,
      shadowColor: colorScheme.shadow,
      child: InkWell(
        borderRadius: BorderRadius.circular(14.0),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.1, 1],
              colors: [colorScheme.primary, colorScheme.onPrimaryContainer], // Cambia los colores según sea necesario
            ),
            borderRadius: BorderRadius.circular(14.0), // Ajusta el radio de borde según sea necesario
          ),
          child: Text('Sign in', style: textStyle.bodyLarge!.copyWith(color: colorScheme.onPrimary)),
        ),
      ),
    );
  }
}