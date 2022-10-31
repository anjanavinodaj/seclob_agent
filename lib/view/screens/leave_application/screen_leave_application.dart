import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seclob_agent/core/utils/converters.dart';
import 'package:seclob_agent/core/utils/validators.dart';
import 'package:seclob_agent/view/providers/colors.dart';
import 'package:seclob_agent/view/widgets/text_fields/text_field_widget.dart';

class ScreenLeaveApplication extends StatelessWidget {
  ScreenLeaveApplication({Key? key}) : super(key: key);

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textcolor,
        centerTitle: true,
        title: const Text(
          'Leave Application',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Column(
            children: [
              //========== Date ==========
              TextFeildWidget(
                labelText: 'Leave From*',
                hintText: 'dd-mm-yyyy',
                controller: _dateController,
                inputBorder: const OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.grey,
                  ),
                  color: Colors.black,
                  onPressed: () {},
                ),
                readOnly: true,
                onTap: () async {
                  final _date = await datePicker(context);

                  if (_date != null) {
                    final parseDate = Converter.dateFormat.format(_date);
                    _dateController.text = parseDate.toString();
                  }
                },
                // validator: (value) => Validators.nullValidator(value),
              ),
              SizedBox(height: 3.h),
              TextFeildWidget(
                labelText: 'No of days*',
                hintText: 'Enter No of days',
                textInputType: TextInputType.number,
                inputFormatters: Validators.digitsOnly,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                inputBorder: const OutlineInputBorder(),
              ),
              SizedBox(height: 3.h),

              const TextFeildWidget(
                labelText: 'Reason*',
                hintText: 'Enter Reason for Leave Application',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                inputBorder: OutlineInputBorder(),
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//========== Date Picker ==========
Future<DateTime?> datePicker(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(
      const Duration(days: 30),
    ),
    lastDate: DateTime.now().add(const Duration(days: 365)),
  );
}
