class FormValidators {

  static String? validateEmail( String? email ){
    
    final emailRegExp = RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b');
    
    if( email == null || email.isEmpty ) return 'Please enter an email';
    if( !emailRegExp.hasMatch(email) ) return 'Invalid email';

    return null;
  }
  
  static String? validatePassword( String? password ){

    // final hasNumber = RegExp(r'^(?=.*[0-9])');
    final hasSpecialCharacter = RegExp(r'^(?=.*[!@#$%^&*])');

    if( password == null || password.isEmpty ) return 'Please enter your password';
    if( password.length <= 4 ) return 'The password must be greater than 4';
    
    // if ( !hasNumber.hasMatch(password) ) return 'The password must include at least one number';
    if ( !hasSpecialCharacter.hasMatch(password) ) return 'The password must include at least one especial character';

    return null;
  }

  static String? validateUsername( String? username ){

    final usernameRegex = RegExp(r'^[^\s]+$');

    if( username == null || username.isEmpty ) return 'Please enter an username';
    if( username.length <= 3 ) return 'Username must be greater than 3';
    if( username.length >= 15 ) return 'Username must be smaller than 15';

    if ( !usernameRegex.hasMatch(username) ) return 'Username must not contain spaces';
    
    return null;
  }

  static String? validateName( String? name ){

    final nameRegExp = RegExp(r"^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s'-]+$");

    if( name == null || name.isEmpty ) return 'Please enter a name';
    if( name.length <= 3 ) return 'Name must be greater than 3';

    if( !nameRegExp.hasMatch(name) ) return 'Name must not contain special characters';

    return null;
  }

  static String? validateSurname( String? surname ){

    if( surname == null || surname.isEmpty ) return null;

    final nameRegExp = RegExp(r"^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s'-]+$");
    if( !nameRegExp.hasMatch(surname) ) return 'Surname must not contain special characters';

    return null;
  }

}