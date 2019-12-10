import 'package:flutter/material.dart';

class SickAnimals extends StatefulWidget {
  SickAnimals({Key key}) : super(key: key);

  @override
  _SickAnimalsState createState() => _SickAnimalsState();
}

class _SickAnimalsState extends State<SickAnimals> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(
        title: Text('Animal Sugical operation Form'),
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
                      hintText: 'Sex of the animal',
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
                      hintText: 'Age of animals affected',
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
                      hintText: 'Number of the animal',
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
                      hintText: 'Name of the animal/Identification number',
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
                      hintText: 'Nature of the operation',
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
                      hintText: 'If other specify',
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
                      hintText: 'Date of operation',
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
                      hintText: 'Post operation management',
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
                      hintText: 'Progrosis',
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
                      hintText: 'Name of the farm',
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
                      hintText: 'Name of the owner',
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
                      hintText: 'Location',
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
                      hintText: 'Name of the veterinay officer',
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