import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seclob_agent/core/utils/converters.dart';
import 'package:seclob_agent/core/utils/debouncer.dart';
import 'package:seclob_agent/core/utils/validators.dart';
import 'package:seclob_agent/services/api_service.dart';
import 'package:seclob_agent/view/providers/colors.dart';
import 'package:seclob_agent/view/screens/home/screen_home.dart';
import 'package:seclob_agent/view/widgets/text_fields/text_field_widget.dart';

final _filterLeadsProvider = StateProvider.autoDispose<String?>((ref) => null);

class ScreenManageLeads extends ConsumerStatefulWidget {
  const ScreenManageLeads({
    required this.title,
    required this.leads,
    Key? key,
  }) : super(key: key);

  final List<Map> leads;
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PendigPageState();
}

class _PendigPageState extends ConsumerState<ScreenManageLeads> {
  TextEditingController search = TextEditingController();
  String dropdownvalue = 'New';

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
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16),
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: search,
                obscureText: false,
                onChanged: (query) {
                  if (query.isEmpty || query.startsWith(' ')) {
                    Debouncer.timer?.cancel();
                    ref.invalidate(_filterLeadsProvider);
                  }

                  final Debouncer debouncer = Debouncer();

                  debouncer.run(() {
                    ref.read(_filterLeadsProvider.notifier).state = query;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 13,
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
              ), //search
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 27,
                    width: 50.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: dropdownColor,
                        boxShadow: [
                          BoxShadow(
                              color: background.withOpacity(1),
                              spreadRadius: 1,
                              blurRadius: 1)
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
                            height: 35,
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: background.withOpacity(1),
                                      spreadRadius: 2,
                                      blurRadius: 2)
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
                                      fontSize: 9),
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
              const SizedBox(height: 10),

              Consumer(
                builder: (context, ref, _) {
                  final String? query = ref.watch(_filterLeadsProvider);

                  List<Map> filteredLeads = [];

                  if (query != null) {
                    filteredLeads = widget.leads.where((lead) {
                      return lead['name']
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList();
                  } else {
                    filteredLeads = widget.leads;
                  }

                  return Expanded(
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredLeads.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        final lead = filteredLeads[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lead['name'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: primaryColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        lead['mobile'],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: listviewtextColor,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      const SizedBox(
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
                                      const SizedBox(height: 1),
                                      SizedBox(
                                        width: 193,
                                        child: Text(
                                          'Service type: ${lead['services']}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: listviewtextColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      SizedBox(
                                        width: 193,
                                        child: Text(
                                          Converter.dateFormat.format(
                                              DateTime.parse(
                                                  lead['created_at'])),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: listviewtextColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Visibility(
                                        visible: widget.title != 'Completed',
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: ticketstatusColor,
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
                                                dropdownColor:
                                                    ticketstatusColor,
                                                iconSize: 15,
                                                value: widget.title,
                                                iconEnabledColor: dropdownColor,
                                                onChanged: (newStatus) async {
                                                  await onStatusChanged(
                                                      newStatus, context, lead);
                                                },
                                                items: [
                                                  'New',
                                                  'Pending',
                                                  'Completed',
                                                  'Cancelled',
                                                  'Not Responding',
                                                  'Deleted',
                                                  'Following',
                                                ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                    return DropdownMenuItem(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      value: value,
                                                      child: Center(
                                                        child: FittedBox(
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                              color:
                                                                  dropdownColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          _callNumber(lead['mobile']);
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: primaryColor,
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 5,
                                                right: 5,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Icon(
                                                    Icons.phone_outlined,
                                                    size: 14.sp,
                                                    color: dropdownColor,
                                                  ),
                                                  const SizedBox(width: 1),
                                                  FittedBox(
                                                    child: Text(
                                                      'Click to Call',
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onStatusChanged(String? newStatus, BuildContext context,
      Map<dynamic, dynamic> lead) async {
    if (newStatus != widget.title) {
      if (newStatus != 'Deleted') {
        if (newStatus == 'Completed') {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount : ',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextFeildWidget(
                          labelText: 'Amount',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          inputBorder: const OutlineInputBorder(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: Validators.digitsOnly,
                          isDense: true,
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(height: 5),
                        MaterialButton(
                            color: primaryColor,
                            onPressed: () async {
                              final bool status =
                                  await ApiService.updateLeadStatus(
                                id: lead['id'].toString(),
                                status: newStatus!,
                              );

                              if (status) {
                                ref.invalidate(_filterLeadsProvider);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const ScreenHome()),
                                );
                              }
                            },
                            child: const Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ));
        } else if (newStatus == 'Following') {
          final date = await _datePicker(context);

          if (date != null) {
            final bool status = await ApiService.updateLeadStatus(
              id: lead['id'].toString(),
              status: newStatus!,
            );

            if (status) {
              ref.invalidate(_filterLeadsProvider);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (ctx) => const ScreenHome()),
              );
            }
          }
        } else {
          final bool status = await ApiService.updateLeadStatus(
            id: lead['id'].toString(),
            status: newStatus!,
          );

          if (status) {
            ref.invalidate(_filterLeadsProvider);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const ScreenHome()),
            );
          }
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete'),
            content: const Text('Are you sure you want to delete this lead?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  final bool status = await ApiService.updateLeadStatus(
                    id: lead['id'].toString(),
                    status: newStatus!,
                  );

                  if (status) {
                    ref.invalidate(_filterLeadsProvider);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (ctx) => const ScreenHome()),
                    );
                  }
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        );
      }
    }
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}

//========== Date Picker ==========
Future<DateTime?> _datePicker(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(
      const Duration(days: 30),
    ),
    lastDate: DateTime.now().add(const Duration(days: 365)),
  );
}
