import 'package:flutter/material.dart';


class Deworming extends StatefulWidget {
  Deworming({Key key}) : super(key: key);


  @override
  _DewormingState createState() => _DewormingState();
}

class _DewormingState extends State<Deworming> {
final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Deworming Form'),
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
                      hintText: 'If Others Specify',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Number of adults',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'number of adults';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Number of young ones',
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
                      hintText: 'Name of the animal/ registration number',
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
                      hintText: 'Body condition of the animal',
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
                      hintText: 'Date of Deworming',
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
                      hintText: 'Drug of choice',
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
                      hintText: 'Withdral period',
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
                      hintText: 'Any side effects seens',
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
                      hintText: 'Next date of deworming',
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
                      hintText: 'Target parasites',
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
                      hintText: 'Name of the farmer',
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
                      hintText: 'Mobile number',
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
                      hintText: 'Name of the veterinary officer',
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
                      hintText: 'Mobile number',
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
                      hintText: 'Comments',
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
                
                
                
                
                
                
                
                
                
                
                
                
                
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}