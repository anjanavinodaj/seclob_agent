import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seclob_agent/view/components/menu_box.dart';
import 'package:seclob_agent/view/providers/path.dart';
import 'package:seclob_agent/view/screens/dashboard_Screens/rescheduled.dart';

import '../../providers/colors.dart';
import '../Expenses/expenses.dart';
import '../Tickets/tickets.dart';
import '../add_number/add_number.dart';
import '../dashboard_Screens/completed.dart';
import '../dashboard_Screens/deleted.dart';
import '../dashboard_Screens/not_reachable.dart';
import '../dashboard_Screens/pending.dart';
import '../dashboard_Screens/rejected.dart';
import '../profile/profile.dart';
import '../work_report/work_reports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  // final pages = [
  //   const Page1(),
  //   const Page2(),
  //   const Page3(),
  //   const Page4(),
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome...',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: textcolor,
                      ),
                    ),
                    const Text(
                      'Sharan',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: textcolor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PendingPage()),
                              );
                            },
                            child: const MenuBox(
                              count: "2",
                              title: "Pending",
                              bgColor: boxcolor1,
                              textColor: boxSecondaryColor1,
                              titleColor: boxSecondaryColor3,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Completed()),
                              );
                            },
                            child: const MenuBox(
                              count: "2",
                              title: "Completed",
                              bgColor: boxcolor2,
                              textColor: boxSecondaryColor1,
                              titleColor: boxSecondaryColor2,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Rejected()),
                              );
                            },
                            child: const MenuBox(
                              count: "2",
                              title: "Rejected",
                              bgColor: boxcolor3,
                              textColor: boxSecondaryColor1,
                              titleColor: boxSecondaryColor3,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotReachable()));
                            },
                            child: const MenuBox(
                              count: "2",
                              title: "Not Reachable",
                              bgColor: boxcolor4,
                              textColor: boxSecondaryColor1,
                              titleColor: boxSecondaryColor4,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Deleted()));
                            },
                            child: const MenuBox(
                              count: "2",
                              title: "Deleted",
                              bgColor: boxcolor5,
                              textColor: boxSecondaryColor1,
                              titleColor: boxSecondaryColor1,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Rescheduled()));
                            },
                            child: const MenuBox(
                              count: "2",
                              title: "Rescheduled",
                              bgColor: boxcolor6,
                              textColor: boxSecondaryColor1,
                              titleColor: boxSecondaryColor1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 73,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    atteIcon,
                                    color: dropdownColor,
                                    width: 24,
                                    height: 35,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Mark your',
                                        style: TextStyle(
                                            color: dropdownColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'attendance',
                                        style: TextStyle(
                                            color: dropdownColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 32,
                                width: 77,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: dropdownColor,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Check in',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 73,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    repoIcon,
                                    color: dropdownColor,
                                    width: 24,
                                    height: 35,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Add your work',
                                        style: TextStyle(
                                            color: dropdownColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'report',
                                        style: TextStyle(
                                            color: dropdownColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Workreport()));
                                },
                                child: Container(
                                  height: 32,
                                  width: 77,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: dropdownColor,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ]),
            ),
          ),
        ),

        const BottomNavBar(pageIndex: 0), // bottom navigationbar
      ],
    )));
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      sdashIcon,
                      color: dropdownColor,
                      width: 19,
                      height: 19,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Dashboard',
                      style: TextStyle(color: dropdownColor, fontSize: 8),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Expenses()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      exIcon,
                      color: dropdownColor,
                      width: 19,
                      height: 19,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Expense',
                      style: TextStyle(color: dropdownColor, fontSize: 8),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddNumber()));
                },
                child: Center(
                  child: SvgPicture.asset(
                    addIcon,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Tickets()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      tickIcon,
                      color: dropdownColor,
                      width: 22,
                      height: 21,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Tickets',
                      style: TextStyle(color: dropdownColor, fontSize: 8),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      proIcon,
                      color: dropdownColor,
                      width: 22,
                      height: 21,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(color: dropdownColor, fontSize: 8),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// class Page1 extends StatelessWidget {
//   const Page1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 1",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 2",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page3 extends StatelessWidget {
//   const Page3({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 3",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 4",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//
//   }}
