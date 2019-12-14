import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

enum GenderCharacter { male, female }
enum NatureOfTheDisease { acute, sub_acute, chronic }
enum DiseaseDiagnosis { clinicalsigns, labaratory }
enum DiseaseNotifiable { yes, no }
enum TreatedAnimalDie { yes, no }
enum Postmorterm { yes, no }
enum Relapse {yes, no}
enum LabarotoryReport{yes, no}
enum Zoonotic{yes, no}

class SickAnimals extends StatefulWidget {
  SickAnimals({Key key}) : super(key: key);

  @override
  _SickAnimalsState createState() => _SickAnimalsState();
}

class _SickAnimalsState extends State<SickAnimals> {
  final _formKey = GlobalKey<FormState>();
  GenderCharacter _character = GenderCharacter.female;
  NatureOfTheDisease _disease = NatureOfTheDisease.acute;
  DiseaseDiagnosis _diagnosis = DiseaseDiagnosis.clinicalsigns;
  DiseaseNotifiable _notifiable = DiseaseNotifiable.yes;
  TreatedAnimalDie _treatedAnimalDie = TreatedAnimalDie.yes;
  Postmorterm _postmorterm = Postmorterm.no;
  Relapse _relapse = Relapse.yes;
  LabarotoryReport _labarotoryReport = LabarotoryReport.no;
  Zoonotic _zoonotic = Zoonotic.yes;

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
  List<String> progrosis = <String>['Good', 'Fair', 'Poor', 'Grave'];
  List<String> reports = <String>['Early', 'Late'];

  _SickAnimalsState() {
    formData = {
      'Animals': 'cattle',
      'Progrosis': 'Good',
      'Report': 'Early'
    };
  }
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sick Animals Form'),
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
                      labelText: 'If Others Specify',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
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
                    decoration: InputDecoration(
                      labelText: 'Number of animals affected',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please number of the affected animals';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                  ListTile(
                    title: Text('Thesis'),
                  ),
                  ListTile(
                    title: Text('Nature of the disease'),
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      RadioListTile<NatureOfTheDisease>(
                        title: const Text('Acute'),
                        value: NatureOfTheDisease.acute,
                        groupValue: _disease,
                        onChanged: (NatureOfTheDisease value) {
                          setState(() {
                            _disease = value;
                          });
                        },
                      ),
                      RadioListTile<NatureOfTheDisease>(
                        title: const Text('Sub Acute'),
                        value: NatureOfTheDisease.sub_acute,
                        groupValue: _disease,
                        onChanged: (NatureOfTheDisease value) {
                          setState(() {
                            _disease = value;
                          });
                        },
                      ),
                      RadioListTile<NatureOfTheDisease>(
                        title: const Text('Chronic'),
                        value: NatureOfTheDisease.chronic,
                        groupValue: _disease,
                        onChanged: (NatureOfTheDisease value) {
                          setState(() {
                            _disease = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Clinical signs',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter clinical signs';
                      }
                      return null;
                    },
                  ),
                  ListTile(
                    title: Text('Disease Diagnosis'),
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      RadioListTile<DiseaseDiagnosis>(
                        title: const Text('Clinical Signs'),
                        value: DiseaseDiagnosis.clinicalsigns,
                        groupValue: _diagnosis,
                        onChanged: (DiseaseDiagnosis value) {
                          setState(() {
                            _diagnosis = value;
                          });
                        },
                      ),
                      RadioListTile<DiseaseDiagnosis>(
                        title: const Text('Labaratory'),
                        value: DiseaseDiagnosis.labaratory,
                        groupValue: _diagnosis,
                        onChanged: (DiseaseDiagnosis value) {
                          setState(() {
                            _diagnosis = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Differential diognosis',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter differential diognosis';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Duration of sickness',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter duaration of sickness';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'History of sickness',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter history of sickness';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Drug of choice',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter drug of choice';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Duration of treatment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter duration of treatment';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text('Set date'),
                  ),
                  Container(
                    /*  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.green

                    ), */
                    child: Card(
                      child: ListTile(
                        title: Text('${selectedDate.toLocal()}'),
                        trailing: RaisedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select date'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropDownField(
                      value: formData['Progrosis'],
                      // icon: Icon(Icons.location_city),
                      required: true,
                      hintText: 'Select Progrosis',
                      labelText: 'Progrosis *',
                      items: progrosis,
                      strict: false,
                      setter: (dynamic newValue) {
                        formData['Progrosis'] = newValue;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      ListTile(
                        title: Text('Is the disease notifiable?'),
                      ),
                      RadioListTile<DiseaseNotifiable>(
                        title: const Text('Yes'),
                        value: DiseaseNotifiable.yes,
                        groupValue: _notifiable,
                        onChanged: (DiseaseNotifiable value) {
                          setState(() {
                            _notifiable = value;
                          });
                        },
                      ),
                      RadioListTile<DiseaseNotifiable>(
                        title: const Text('No'),
                        value: DiseaseNotifiable.no,
                        groupValue: _notifiable,
                        onChanged: (DiseaseNotifiable value) {
                          setState(() {
                            _notifiable = value;
                          });
                        },
                      ),
                      ListTile(
                        title: Text(
                          'If Yes, Send message to relevant authority',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      ListTile(
                        title: Text('Did the treated animal die'),
                      ),
                      RadioListTile<TreatedAnimalDie>(
                        title: const Text('Yes'),
                        value: TreatedAnimalDie.yes,
                        groupValue: _treatedAnimalDie,
                        onChanged: (TreatedAnimalDie value) {
                          setState(() {
                            _treatedAnimalDie = value;
                          });
                        },
                      ),
                      RadioListTile<TreatedAnimalDie>(
                        title: const Text('No'),
                        value: TreatedAnimalDie.no,
                        groupValue: _treatedAnimalDie,
                        onChanged: (TreatedAnimalDie value) {
                          setState(() {
                            _treatedAnimalDie = value;
                          });
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Did you perform Postmorterm',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      RadioListTile<Postmorterm>(
                        title: const Text('Yes'),
                        value: Postmorterm.yes,
                        groupValue: _postmorterm,
                        onChanged: (Postmorterm value) {
                          setState(() {
                            _postmorterm = value;
                          });
                        },
                      ),
                      RadioListTile<Postmorterm>(
                        title: const Text('No'),
                        value: Postmorterm.no,
                        groupValue: _postmorterm,
                        onChanged: (Postmorterm value) {
                          setState(() {
                            _postmorterm = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Pathological condtions',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the pathological condition of carcass';
                          }
                          return null;
                        },
                      ),
                      ////////////////////////////////////////////////////////////////////////////////////////
                      ////////////////////////////////////////////////////////////////////////////////////////
                      ListTile(
                        title: Text(
                          'Did you perform Postmorterm',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      RadioListTile<LabarotoryReport>(
                        title: const Text('Yes'),
                        value: LabarotoryReport.yes,
                        groupValue: _labarotoryReport,
                        onChanged: (LabarotoryReport value) {
                          setState(() {
                            _labarotoryReport = value;
                          });
                        },
                      ),
                      RadioListTile<LabarotoryReport>(
                        title: const Text('No'),
                        value: LabarotoryReport.no,
                        groupValue: _labarotoryReport,
                        onChanged: (LabarotoryReport value) {
                          setState(() {
                            _labarotoryReport = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Cause of the death',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter cause of the death';
                          }
                          return null;
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Is the disease one of the zoonotic',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      RadioListTile<Zoonotic>(
                        title: const Text('Yes'),
                        value: Zoonotic.yes,
                        groupValue: _zoonotic,
                        onChanged: (Zoonotic value) {
                          setState(() {
                            _zoonotic = value;
                          });
                        },
                      ),
                      RadioListTile<Zoonotic>(
                        title: const Text('No'),
                        value: Zoonotic.no,
                        groupValue: _zoonotic,
                        onChanged: (Zoonotic value) {
                          setState(() {
                            _zoonotic = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Advice',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter advice';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  DropDownField(
                      value: formData['Report'],
                      // icon: Icon(Icons.location_city),
                      required: true,
                      hintText: 'When was the sick animal reported',
                      labelText: 'When was the sick animal reported *',
                      items: reports,
                      strict: false,
                      setter: (dynamic newValue) {
                        formData['Report'] = newValue;
                      }),
                  ListTile(
                    title: Text(
                      'Did you perform Postmorterm',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  RadioListTile<Relapse>(
                    title: const Text('Yes'),
                    value: Relapse.yes,
                    groupValue: _relapse,
                    onChanged: (Relapse value) {
                      setState(() {
                        _relapse = value;
                      });
                    },
                  ),
                  RadioListTile<Relapse>(
                    title: const Text('No'),
                    value: Relapse.no,
                    groupValue: _relapse,
                    onChanged: (Relapse value) {
                      setState(() {
                        _relapse = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(title: Text('If yes, what might be the cause'),),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cause of relapse',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the cause';
                      }
                      return null;
                    },
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
