

import 'package:agecalc2/constant/color.dart';
import 'package:agecalc2/controller/age_calculator.dart';
import 'package:agecalc2/global/helper_function.dart';
import 'package:agecalc2/global/utils.dart';
import 'package:agecalc2/widget/app_name.dart';
import 'package:agecalc2/widget/custom_bottom_paint.dart';
import 'package:agecalc2/widget/custom_divider.dart';
import 'package:agecalc2/widget/custom_large_button.dart';
import 'package:agecalc2/widget/custom_list_tile.dart';
import 'package:agecalc2/widget/custom_top_paint.dart';
import 'package:agecalc2/widget/summary_card_builder.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({ Key? key }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(width, (350*0.31473214285714285).toDouble()), 
                    painter: CustomTopPaint(),
                  ),
                  Positioned(
                    top: 30,
                    child: AppName(),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomListTile(
                    leading: "Date of birth",
                    trailing: getFormatedDate(selectedBirthDate),
                  ),
                  SizedBox(height: 20,),
                  CustomListTile(
                    leading: "Todays",
                    trailing: getFormatedDate(selectedCurrentDate),
                  ),
                ],
              )
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xffa8c66c),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Age"),
                          Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: AgeCalculator.age(selectedBirthDate, today: selectedCurrentDate).years.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                              TextSpan(
                                text: ' Years',
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ],
                           ),
                          ),
                          Text("${AgeCalculator.age(selectedBirthDate, today: selectedCurrentDate).months.toString()} Months | ${AgeCalculator.age(selectedBirthDate, today: selectedCurrentDate).days.toString()} Days"),
                        ],
                      ),
                    ),
                  ),
                  CustomDivider(),
                  Expanded(
                   child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Next Birthday"),
                          Text(AgeCalculator.findDayName().toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                          Text("${AgeCalculator.timeToNextBirthday(selectedBirthDate, fromDate: selectedCurrentDate).months} Months | ${AgeCalculator.timeToNextBirthday(selectedBirthDate, fromDate: selectedCurrentDate).days} Days"),
                        ],
                      ),
                    ),
                 )
                ],
              )
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffa8c66c),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Text("Age in", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w700),),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SummaryCardBuilder(
                                title: "Years",
                                subTitle: AgeCalculator.age(selectedBirthDate, today: selectedCurrentDate).years.toString(),
                              ),
                              SizedBox(height: 20,),
                              SummaryCardBuilder(
                                title: "Weeks",
                                subTitle: (AgeCalculator.age(selectedBirthDate, today: selectedCurrentDate).years * 52).toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SummaryCardBuilder(
                                title: "Months",
                                subTitle: (AgeCalculator.age(selectedBirthDate, today: selectedCurrentDate).years * 12).toString(),
                              ),
                              SizedBox(height: 20,),
                              SummaryCardBuilder(
                                title: "Hours",
                                subTitle: AgeCalculator.hoursBetween(selectedBirthDate, selectedCurrentDate).toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                         Container(
                          child: Column(
                            children: [
                              SummaryCardBuilder(
                                title: "Days",
                                subTitle: AgeCalculator.daysBetween(selectedBirthDate, selectedCurrentDate).toString(),
                              ),
                              SizedBox(height: 20,),
                              SummaryCardBuilder(
                                title: "Minutes",
                                subTitle: AgeCalculator.minutesBetween(selectedBirthDate, selectedCurrentDate).toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: CustomPaint(
                      size: Size(width, (399*0.31473214285714285).toDouble()), 
                      painter: CustomBottomPaint(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: CustomLargeButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      buttonLevel: "Re-Calculate",
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
}







