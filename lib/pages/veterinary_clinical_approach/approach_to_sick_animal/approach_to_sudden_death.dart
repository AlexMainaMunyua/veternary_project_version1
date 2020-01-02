import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

enum GenderCharacter { male, female }

class SuddenDeath extends StatefulWidget {
  SuddenDeath({Key key}) : super(key: key);

  @override
  _SuddenDeathState createState() => _SuddenDeathState();
}

class _SuddenDeathState extends State<SuddenDeath> {
  final _formKey = GlobalKey<FormState>();
  GenderCharacter _character = GenderCharacter.female;
  Map<String, dynamic> formData;
  List<String> options = <String>[
    'Cattle',
    'Dogs',
    'Poultry',
    'Horses',
    'Donkey',
    'Cat',
    'Sheep',
    'Goats',
    'Others'
  ];
  String dropdownValue = 'Cattle';

  _SuddenDeathState() {
    formData = {
      'Animals': 'cattle',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudden death Form'),
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
            onPressed: () {},
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
                  ListTile(
                      title: Text(
                    'Animal Details',
                    style: TextStyle(color: Colors.green),
                  )),
                  DropDownField(
                      value: formData['Animals'],
                      icon: Icon(Icons.location_city),
                      required: true,
                      hintText: 'Choose animal',
                      labelText: 'Animal *',
                      items: options,
                      strict: false,
                      setter: (dynamic newValue) {
                        formData['Animals'] = newValue;
                      }),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name of the animal or ID number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the name of the animal or ID number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.baseline,

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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Number of the animal dead',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      title: Text(
                    'Thesis',
                    style: TextStyle(color: Colors.green),
                  )),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'When was the case reported',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please number of young ones';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'What was the history of the case',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'State the mortality rate of the case',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'At what time the animal/s died',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText:
                          'What are the sign of the cadaver on the ground',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(title: Text('Did you open up the car case for PM')),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText:
                          'If yes, what were the signs of the pathological condition',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'If no what could have been the reason',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText:
                          'Did you send any sample to the laboratory yes/no',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'What was the laboaratory report',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'is the cause of death notifiable',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Body condition of the animal';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'If yes , send message to the relevant body',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'What was the neccessary intervention in regard to the cause of the death';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
