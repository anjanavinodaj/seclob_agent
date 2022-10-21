import 'package:flutter/material.dart';
import 'package:seclob_agent/view/providers/colors.dart';
class AlertBox extends StatefulWidget {
  const AlertBox({Key? key}) : super(key: key);

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  TextEditingController notes=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dropdowniconColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: background
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,top: 5),
                child: TextFormField(
                  maxLines: 10,
                  controller: notes,
                  cursorColor:dateColor,
                  decoration: InputDecoration(
                    hintText: 'Add notes',
                    hintStyle:TextStyle(
                        color: dropdowniconColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 43,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: background
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 12
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
