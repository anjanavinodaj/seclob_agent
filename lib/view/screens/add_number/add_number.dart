// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:seclob_agent/services/api_service.dart';
import 'package:seclob_agent/view/providers/colors.dart';

class AddNumber extends StatefulWidget {
  const AddNumber({Key? key}) : super(key: key);

  @override
  _AddNumberState createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController contactNo = TextEditingController();
  final TextEditingController place = TextEditingController();
  final TextEditingController servicesController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final ValueNotifier<List<Map>> servicesNotifier = ValueNotifier([]);

  String stateId = '';
  String districtId = '';
  List<int> servicesIds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textcolor,
        centerTitle: true,
        title: const Text(
          'Create Leads',
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
                      'Name',
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
                          controller: nameController,
                          cursorColor: dateColor,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 15, 10, 10),
                            border: InputBorder.none,
                            hintText: 'Enter your name',
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
                            'State',
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
                                    controller: stateController,
                                    style: const TextStyle(fontSize: 11),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      hintText: 'Select state name',
                                      hintStyle: TextStyle(
                                          color: dropdowniconColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    )),
                                itemBuilder: (contex, values) {
                                  final states = values as Map;
                                  return ListTile(
                                    title: Text(
                                      states['label'],
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  );
                                },
                                noItemsFoundBuilder: (_) {
                                  return const ListTile(
                                    dense: true,
                                    title: Text(
                                      'No state found!',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: kColorDim,
                                      ),
                                    ),
                                  );
                                },
                                onSuggestionSelected: (selected) {
                                  final state = selected as Map;
                                  stateController.text = state['label'];
                                  stateId = state['id'];
                                },
                                suggestionsCallback: (query) async {
                                  return await ApiService.states(
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
                            'District',
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
                              child: TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: districtController,
                                    style: const TextStyle(fontSize: 11),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      hintText: 'Select district name',
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
                                  districtId = district['id'];
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
                              blurRadius: 3,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: servicesController,
                              style: const TextStyle(fontSize: 11),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                                hintText:
                                    'Select service type (eg : service, rent a car)',
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
                                'No services found!',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: kColorDim,
                                ),
                              ),
                            );
                          },
                          onSuggestionSelected: (selected) {
                            servicesController.clear();
                            final service = selected as Map;

                            for (Map element in servicesNotifier.value) {
                              if (element['id'] == service['id']) {
                                return;
                              }
                            }

                            servicesNotifier.value = [
                              ...servicesNotifier.value,
                              service
                            ];

                            servicesIds.add(service['id']);
                          },
                          suggestionsCallback: (query) async {
                            return await ApiService.services(
                              query: query,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                  child: ValueListenableBuilder(
                    valueListenable: servicesNotifier,
                    builder: (context, services, _) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final service = servicesNotifier.value[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FittedBox(child: Text(service['label'])),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      servicesNotifier.value.remove(service);
                                      servicesNotifier.notifyListeners();
                                      servicesIds.remove(service['id']);
                                    },
                                    child: const FittedBox(
                                      child: Icon(
                                        Icons.close,
                                        color: Color(0xFF757575),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: servicesNotifier.value.length,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 37),
                  child: InkWell(
                    onTap: () async {
                      await ApiService.createLeads(
                        name: nameController.text,
                        companyName: companyName.text,
                        number: contactNo.text,
                        services: servicesIds,
                        stateId: stateId,
                        districtId: districtId,
                      );

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
