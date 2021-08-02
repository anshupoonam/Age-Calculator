import 'package:agecalc2/constant/color.dart';
import 'package:agecalc2/controller/age_calculator.dart';
import 'package:agecalc2/global/helper_function.dart';
import 'package:agecalc2/global/utils.dart';
import 'package:agecalc2/views/result.dart';
import 'package:agecalc2/widget/app_name.dart';
import 'package:agecalc2/widget/custom_bottom_paint.dart';
import 'package:agecalc2/widget/custom_large_button.dart';
import 'package:agecalc2/widget/custom_top_paint.dart';
import 'package:agecalc2/widget/date_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(width, (350 * 0.31473214285714285).toDouble()),
                    painter: CustomTopPaint(),
                  ),
                  Positioned(
                    top: 30,
                    child: AppName()
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GradientText(
                'Find your real age, number of days till your next birthday and a buch of fun ... will show you exact number of days left to your nearest Birthday and a few ...',
                style: TextStyle(
                  fontSize: 30.0,
                ),
                gradientType: GradientType.radial,
                radius: 0.8,
                colors: [
                  Colors.red,
                  Colors.pink,
                  Colors.purple,
                  Colors.deepPurple,
                  Colors.deepPurple,
                  Colors.indigo,
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.cyan,
                  Colors.teal,
                  Colors.green,
                  Colors.lightGreen,
                  Colors.lime,
                  Colors.yellow,
                  Colors.amber,
                  Colors.orange,
                  Colors.deepOrange,
                ],
              ),

            ),
            Spacer(),
            Container(
              child: SvgPicture.asset(
                "assets/anshu.svg",
                width: 200,
                height: 200,
               // semanticsLabel: 'Acme Logo'
              ),
            ),
            Spacer(),

             DatePickerField(
              level: 'Select date of birth',
              onTap: ()=> _selectDate(context, selectedBirthDate, "BirthDate" ),
              hintText: "${getFormatedDate(selectedBirthDate)}"+" ("+AgeCalculator.findDayNamewithDate(selectedBirthDate).toString()+")",
            ),
            SizedBox(height: 10,),
            DatePickerField(
              level: 'Select today\'s date',
              onTap: ()=> _selectDate(context, selectedCurrentDate, "CurrentDate"),
              hintText: "${getFormatedDate(selectedCurrentDate)}"+" ("+AgeCalculator.findDayNamewithDate(selectedCurrentDate).toString()+")",
            ),
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: CustomPaint(
                      size: Size(width, (399 * 0.31473214285714285).toDouble()),
                      painter: CustomBottomPaint(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: CustomLargeButton(
                      buttonLevel: "Calculate Age",
                      onPressed: (){
                       if(selectedCurrentDate.isBefore(selectedBirthDate)){
                          Alert(context: context,type: AlertType.warning, title: "Date Alert", desc: "You can't choose the date beyond the current date.").show();
                        }else {
                          Route route = MaterialPageRoute(
                              builder: (context) => ResultPage(),
                          );
                          Navigator.push(context, route);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //This function used for open date picker 
  Future<void> _selectDate(BuildContext context, DateTime initialDate, String from) async {
    if(from == 'BirthDate') {
       final DateTime? pickedBirthDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );
      if (pickedBirthDate != null && pickedBirthDate != selectedBirthDate)
      setState(() {
        selectedBirthDate = pickedBirthDate;
      });
    } 
    if(from == "CurrentDate"){
      final DateTime? pickedCurrentDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (pickedCurrentDate != null && pickedCurrentDate != selectedCurrentDate)
      setState(() {
        selectedCurrentDate = pickedCurrentDate;
      });
    }

  }


}





