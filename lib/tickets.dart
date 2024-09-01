import 'package:bookingapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tickets {
  const Tickets(
      {required this.name,
      required this.email,
      required this.date,
      required this.start,
      required this.stop});

  final String name;
  final String email;
  final String date;
  final String start;
  final String stop;
}

final List<Tickets> tickets = [];

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPagestate();
}

class _TicketsPagestate extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.activeBlue,
        title: const Text(
          "Your Tickets",
          style: TextStyle(
              //ill comeback to this shit
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: tickets.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.grey,
                height: 100,
                child: Center(
                    child: Column(children: [
                  Text('Travel ${tickets[index].name}'),
                  Text('Travel ${tickets[index].email}'),
                  Text('Travel ${tickets[index].date}'),
                  Text('Travel ${tickets[index].start}'),
                  Text('Travel ${tickets[index].stop}'),
                ])),
              );
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 20,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
