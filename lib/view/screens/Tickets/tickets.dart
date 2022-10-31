import 'package:flutter/material.dart';

import '../../providers/colors.dart';
import '../home/screen_home.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  String dropdownvalue = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textcolor,
        centerTitle: true,
        title: const Text(
          'Tickets',
          style: TextStyle(fontSize: 16),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 150,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: listviewColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 18, bottom: 18),
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Subject',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: primaryColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 1),
                                      Text(
                                        '10.09.2022',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: listviewtextColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 7),
                                      SizedBox(
                                        width: 193,
                                        child: Text(
                                          'Lorem Ipsum has been the industry\n'
                                          ' standard dummy text ever since the 1500s,'
                                          'when an unknown printer took a galley of type '
                                          ''
                                          'and scrambled it to make a type specimen book.\n',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: listviewtextColor,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, top: 30, bottom: 18),
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: statustextColor,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 37,
                                          decoration: BoxDecoration(
                                              color: ticketstatusColor,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: background
                                                        .withOpacity(1),
                                                    spreadRadius: 3,
                                                    blurRadius: 3)
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              underline: const SizedBox(),
                                              dropdownColor: ticketstatusColor,
                                              value: dropdownvalue,
                                              iconSize: 15,
                                              iconEnabledColor: dropdownColor,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                              items: <String>[
                                                'Pending',
                                                'Completed',
                                                'Rejected',
                                                'Not Reachable',
                                                'Delete',
                                                'Follow up'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  value: value,
                                                  child: Center(
                                                    child: Text(
                                                      value,
                                                      style: const TextStyle(
                                                          fontSize: 9,
                                                          color: dropdownColor),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 20,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: ticketbuttonColor,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'High Priority',
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const BottomNavBar(pageIndex: 0),
          ],
        ),
      ),
    );
  }
}
