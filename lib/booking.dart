import 'package:bookingapp/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';

const List<String> list = <String>['Manglore', 'Banglore', 'Goa', 'Hell'];

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = list.first;
  String _name = '';
  String _email = '';
  String _date ='';
  String _start ='';
  String _stop ='';


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        backgroundColor: CupertinoColors.systemGrey2,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "Book your Ticket",
            style: TextStyle(
                //ill comeback to this shit
                ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your Full Name',
                  labelText: 'Full Name',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Full Name';
                  }
                  return null;
                },
                onSaved: (value){
                  _name = value!;
                },

              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email_outlined),
                  hintText: 'Enter your Email Address',
                  labelText: 'Email Address',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if(value!.isEmail() == false)
                    {
                      return 'Please enter a valid email address';
                    }
                  return null;
                },
                onSaved: (value){
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Day Month Year',
                  labelText: 'Date of Travel',
                ),
                validator: (value) {
                  if (value!.isDateTime() == false) {
                    return 'Please enter valid date';
                  }
                  return null;
                },
                onSaved: (value){
                  _date = value!;
                },
              ),
              Row(
                children: [
                   Icon(Icons.directions_train_sharp,color: Colors.grey[700]),
                  DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blueAccent),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                        _start =value;
                      });

                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: Colors.blueAccent),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                        _stop = value;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      _formKey.currentState!.save();
                      tickets.add(Tickets(name: _name, email: _email, date: _date, start: _start, stop: _stop));
                      _formKey.currentState!.reset();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TicketsPage()));
                      //navigate to different page
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
