import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:seclob_agent/core/colors.dart';
import 'package:seclob_agent/services/api_service.dart';

import '../../providers/colors.dart';

class AddNumber extends StatefulWidget {
  const AddNumber({Key? key}) : super(key: key);

  @override
  _AddNumberState createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  TextEditingController companyName = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController serviceTypes = TextEditingController();
  TextEditingController districtController = TextEditingController();

  String dropdownvalue = 'Calicut';

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
          'Add number',
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
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Company name',
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
                          controller: companyName,
                          cursorColor: dateColor,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 15, 10, 10),
                            border: InputBorder.none,
                            hintText: 'Enter company name',
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
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact number',
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
                          controller: contactNo,
                          keyboardType: TextInputType.phone,
                          cursorColor: dateColor,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 15, 10, 10),
                            border: InputBorder.none,
                            hintText: 'Enter contact number',
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
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'District',
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
                              child: TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: districtController,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(5, 15, 10, 10),
                                      border: InputBorder.none,
                                      hintText: 'Enter district name',
                                      hintStyle: TextStyle(
                                          color: dropdowniconColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    )),
                                itemBuilder: (contex, values) {
                                  final districts = values as Map;
                                  return ListTile(
                                    title: Text(
                                      districts['label'],
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  );
                                },
                                noItemsFoundBuilder: (_) {
                                  return const ListTile(
                                    dense: true,
                                    title: Text(
                                      'No district found!',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: kColorDim,
                                      ),
                                    ),
                                  );
                                },
                                onSuggestionSelected: (selected) {
                                  final district = selected as Map;
                                  districtController.text = district['label'];
                                },
                                suggestionsCallback: (query) async {
                                  return await ApiService.districts(
                                    query: query,
                                  );
                                },
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
                            'Place',
                            style: (TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
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
                                controller: place,
                                cursorColor: dateColor,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 15, 10, 10),
                                  border: InputBorder.none,
                                  hintText: 'Enter place name',
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
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Service type',
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
                          controller: serviceTypes,
                          cursorColor: dateColor,
                          decoration: const InputDecoration(
                            hintText:
                                'Enter service type (eg : service,rent a car )',
                            contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 10),
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
                Padding(
                  padding: const EdgeInsets.only(top: 37),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
          ]),
        ),
      ),
    );
  }
}
