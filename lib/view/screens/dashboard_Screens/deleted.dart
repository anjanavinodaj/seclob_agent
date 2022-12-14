import 'package:flutter/material.dart';
import '../../providers/colors.dart';

class Deleted extends StatefulWidget {
  const Deleted({Key? key}) : super(key: key);

  @override
  _DeletedState createState() => _DeletedState();
}

class _DeletedState extends State<Deleted> {
  TextEditingController search = TextEditingController();
  String dropdownvalue = 'Deleted';
  String filtervalue = 'Pending';

  DateTime selectedDate = DateTime.now();
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
        backgroundColor: textcolor,
        centerTitle: true,
        title: const Text(
          'Deleted',
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
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 25),
          child: Column(
            children: [
              SizedBox(
                width: 350,
                height: 38,
                child: TextFormField(
                  controller: search,
                  obscureText: false,
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 13.5,
                      color: dropdowniconColor,
                    ),
                    labelText: 'Search',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      color: dropdowniconColor,
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: background,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: background,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: dropdowniconColor,
                    fontSize: 12,
                  ),
                ),
              ), //search
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 28,
                    width: 159,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: dropdownColor,
                        boxShadow: [
                          BoxShadow(
                              color: background.withOpacity(1),
                              spreadRadius: 3,
                              blurRadius: 3)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            'filter by status : ',
                            style: TextStyle(
                                color: dropdowniconColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [
                                  BoxShadow(
                                      color: background.withOpacity(1),
                                      spreadRadius: 4,
                                      blurRadius: 3)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: filtervalue,
                                iconSize: 15,
                                iconEnabledColor: textcolor,
                                onChanged: (newValue) {
                                  setState(() {
                                    filtervalue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Pending',
                                  'Completed',
                                  'Rejected',
                                  'Not Reachable',
                                  'Delete',
                                  'Follow up'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem(
                                    alignment: Alignment.centerLeft,
                                    value: value,
                                    child: Center(
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontSize: 9, color: textcolor),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 27,
                    width: 159,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: dropdownColor,
                        boxShadow: [
                          BoxShadow(
                              color: background.withOpacity(1),
                              spreadRadius: 3,
                              blurRadius: 3)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            'filter by date : ',
                            style: TextStyle(
                                color: dropdowniconColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Container(
                            width: 80,
                            height: 37,
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: background.withOpacity(1),
                                      spreadRadius: 1,
                                      blurRadius: 1)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(width: 20),
                                Text(
                                  "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: dateColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), //filter
              Expanded(
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 18, bottom: 18),
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Sample name',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: primaryColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '9745640896',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: listviewtextColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 2),
                                      SizedBox(
                                        width: 193,
                                        child: Text(
                                          'Area name',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: listviewtextColor,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(height: 1),
                                      SizedBox(
                                        width: 193,
                                        child: Text(
                                          'Service type',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: listviewtextColor,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(height: 1),
                                      SizedBox(
                                        width: 193,
                                        child: Text(
                                          '10.09.2022',
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
                                    top: 30, bottom: 18, right: 5),
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 21,
                                        width: 89,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: boxcolor5,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 37,
                                          decoration: BoxDecoration(
                                              color: boxcolor5,
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
                                              dropdownColor: boxcolor5,
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
                                                'Deleted',
                                                'Rescheduled'
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
                                      const SizedBox(height: 3),
                                      Container(
                                        height: 21,
                                        width: 89,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: primaryColor,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(
                                                  Icons.phone_outlined,
                                                  size: 10,
                                                  color: dropdownColor,
                                                ),
                                                Text(
                                                  'Click to Call',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
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
              ), //listview
            ],
          ),
        ),
      ),
    );
  }
}
