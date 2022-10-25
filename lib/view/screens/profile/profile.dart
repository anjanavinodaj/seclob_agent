import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../providers/colors.dart';
import '../../providers/path.dart';
import '../home_Page/home_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textcolor,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Expanded(
                child: Column(children: [
                  Container(
                    height: 101,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: background,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sharan',
                          style: TextStyle(
                              color: textcolor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Email:',
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'sample@123',
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Phone number:',
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '9739737023',
                              style: TextStyle(
                                  color: textcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: dropdowniconColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                aboutIcon,
                                width: 29,
                                height: 29,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'About us',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: textcolor),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                notifiIcon,
                                width: 29,
                                height: 29,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Notifications',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: textcolor),
                              ),
                            ],
                          ),
                          Container(
                            height: 21,
                            width: 51,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: textcolor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '4 New',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                      color: dropdownColor),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 7,
                                  color: dropdownColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                privacyIcon,
                                width: 29,
                                height: 29,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Privacy',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: textcolor),
                              ),
                            ],
                          ),
                          Container(
                            height: 21,
                            width: 83,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: notReachableStatuscolor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Action needed',
                                  style: TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.w500,
                                      color: dropdownColor),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 7,
                                  color: dropdownColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                supportIcon,
                                width: 29,
                                height: 29,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: textcolor),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: textcolor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                tandcIcon,
                                width: 29,
                                height: 29,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Support',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: textcolor),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: textcolor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'My Account',
                        style: TextStyle(
                            color: dropdowniconColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Change Password',
                        style: TextStyle(
                            color: notReachableStatuscolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Logout',
                        style: TextStyle(
                            color: notReachableStatuscolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            const Expanded(
              child: BottomNavBar(pageIndex: 0),
            ),
          ],
        ),
      ),
    );
  }
}
