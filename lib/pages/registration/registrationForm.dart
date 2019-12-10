import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

enum GenderCharacter { male, female }

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  GenderCharacter _character = GenderCharacter.female;
  final requiredValidator =
      RequiredValidator(errorText: 'this field is required');

  String phoneNumber = '';
  bool valid = false;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  String password;

  void onPhoneNumberChanged(String phoneNumber) {
    print(phoneNumber);
    setState(() {
      this.phoneNumber = phoneNumber;
    });
  }

  void onInputChanged(bool value) {
    print(value);
    setState(() {
      valid = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            // onPressed: () => _saveDocument(context),
          ),
          IconButton(
            icon: Icon(Icons.clear_all),
            color: Colors.white,
            onPressed: (){},
            // onPressed: () => _clearDocument(context),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Name of the Farm',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please name of the farm';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InternationalPhoneNumberInput.withCustomDecoration(
                      // onInputChanged: onPhoneNumberChanged,
                      // onInputValidated: onInputChanged,
                      initialCountry2LetterCode: 'KE',
                      inputDecoration: InputDecoration(
                        hintText: 'Enter phone number',
                        errorText: valid ? null : 'Invalid',
                        border: OutlineInputBorder(
                            /*  borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ), */
                            ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Select County Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter email address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: EmailValidator(
                          errorText: 'enter a valid email address')),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: passwordValidator),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (val) =>
                        MatchValidator(errorText: 'passwords do not match')
                            .validateMatch(val, password),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*  Container(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: CountryPickerDropdown(
                        initialValue: 'ke',
                        itemBuilder: _buildDropdownItem,
                        onValuePicked: (Country country) {
                          print("${country.name}");
                        },
                      ),
                    ),
                  ), */

                  Column(
                    children: <Widget>[
                      RadioListTile<GenderCharacter>(
                        title: const Text('Male'),
                        value: GenderCharacter.male,
                        groupValue: _character,
                        onChanged: (GenderCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      RadioListTile<GenderCharacter>(
                        title: const Text('Female'),
                        value: GenderCharacter.female,
                        groupValue: _character,
                        onChanged: (GenderCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
