import 'package:flutter/material.dart';

import '../../providers/colors.dart';
import '../Tickets/tickets.dart';
class Workreport extends StatefulWidget {
  const Workreport({Key? key}) : super(key: key);

  @override
  _WorkreportState createState() => _WorkreportState();
}

class _WorkreportState extends State<Workreport> {

  DateTime selectedDate = DateTime.now();
  TextEditingController details=TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),

    );
    if (selected != null && selected != selectedDate) {
      setState(() {

        selectedDate = selected;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:textcolor,
        centerTitle: true,
        title:const Text(
          'Work report',
          style: TextStyle(
              fontSize: 16
          ),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pick date',
                    style: (
                        TextStyle(
                          fontSize: 12,
                          fontWeight:FontWeight.w500,
                          fontFamily: 'Poppins',
                        )
                    ),
                  ),

                  SizedBox(height:10),

                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 37,
                      decoration: BoxDecoration(
                          color: dropdownColor,
                          borderRadius:
                          BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color:background.withOpacity(1),
                                spreadRadius: 3,
                                blurRadius: 3
                            )
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 37,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: background,
                                  borderRadius:
                                  BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color:background.withOpacity(1),
                                        spreadRadius: 3,
                                        blurRadius: 3
                                    )
                                  ]
                              ),

                              child: const Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: dropdowniconColor,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: dateColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height:25),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter details',
                        style: (
                            TextStyle(
                                fontSize: 12,
                                fontWeight:FontWeight.w500
                            )
                        ),),
                      SizedBox(height: 10,),
                      Container(

                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:dropdownColor,
                            boxShadow: [
                              BoxShadow(
                                  color:background.withOpacity(1),
                                  spreadRadius: 3,
                                  blurRadius: 3
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            maxLines: 5,
                            controller: details,
                            cursorColor:dateColor,
                            decoration: InputDecoration(
                              hintText: 'Enter details',
                              border: InputBorder.none,
                              hintStyle:TextStyle(
                                  color: dropdowniconColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ) ,
                      SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Tickets()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: textcolor
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: dropdownColor,
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
