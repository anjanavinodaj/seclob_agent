import 'package:flutter/material.dart';
import 'package:seclob_agent/view/screens/Expenses/expenses.dart';

import '../../providers/colors.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({Key? key}) : super(key: key);

  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  DateTime selectedDate = DateTime.now();
  TextEditingController kms = TextEditingController();
  TextEditingController totalAmount = TextEditingController();

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

  String dropdownvalue = 'Bike';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textcolor,
        centerTitle: true,
        title: const Text(
          'Add Expenses',
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
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pick date',
                style: (TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                )),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 37,
                  decoration: BoxDecoration(
                      color: dropdownColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: background.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 3)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 37,
                          width: 40,
                          decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: background.withOpacity(1),
                                    spreadRadius: 3,
                                    blurRadius: 3)
                              ]),
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
                              fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Vehicle type',
                style: (TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 37,
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: background.withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 3)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 23),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: background,
                    underline: const SizedBox(),
                    hint: const Text('Select your vehicle type'),
                    value: dropdownvalue,
                    iconSize: 15,
                    iconEnabledColor: dropdowniconColor,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: <String>['Bike', 'Car', 'Bus', 'Flight']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: value,
                        child: Text(
                          value,
                          style:
                              const TextStyle(fontSize: 11, color: dateColor),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kilometers',
                          style: (TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 37,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: dropdownColor,
                              boxShadow: [
                                BoxShadow(
                                    color: background.withOpacity(1),
                                    spreadRadius: 3,
                                    blurRadius: 3)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: kms,
                              cursorColor: dateColor,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(5, 15, 10, 10),
                                hintText: 'Enter total kilometeres',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: dropdowniconColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total amount',
                          style: (TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 37,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: dropdownColor,
                              boxShadow: [
                                BoxShadow(
                                    color: background.withOpacity(1),
                                    spreadRadius: 3,
                                    blurRadius: 3)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: totalAmount,
                              cursorColor: dateColor,
                              decoration: const InputDecoration(
                                hintText: 'Enter total amount',
                                contentPadding:
                                    EdgeInsets.fromLTRB(5, 15, 10, 10),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: dropdowniconColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Expenses()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textcolor),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: dropdownColor, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
