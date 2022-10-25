import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seclob_agent/view/providers/colors.dart';
import 'package:seclob_agent/view/providers/path.dart';

import '../home_Page/home_page.dart';
import 'add_expenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  int pageIndex = 0;
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textcolor,
        centerTitle: true,
        title: const Text(
          'Expenses',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        background: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            height: 80,
                            width: 320,
                            decoration: BoxDecoration(
                              color: boxcolor5,
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            height: 80,
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Car',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: primaryColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '22kms',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: listviewtextColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '10.09.2022',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: listviewtextColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 18, bottom: 18),
                                  child: Column(
                                    children: [
                                      const Text(
                                        '\u{20B9}200',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: primaryColor,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 2),
                                      Container(
                                        height: 19,
                                        width: 52,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: statustextColor,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Completed',
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddExpenses()),
                        );
                      },
                      child: SvgPicture.asset(
                        adexIcon,
                        width: 49,
                        height: 49,
                      ),
                    )
                  ]),
                ),
                const SizedBox(height: 20),
                const BottomNavBar(pageIndex: 0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
