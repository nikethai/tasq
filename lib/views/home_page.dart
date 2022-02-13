import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tasq/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final now = DateTime.now();
    var formatter = DateFormat.yMMMd("vi_VN");

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: screenWidth,
                height: screenHeight * .2,
                // alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28))),
                child: LayoutBuilder(
                  builder: (context, constraints) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: constraints.maxHeight * .5,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: formatter.format(now),
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF8B8C91)),
                              ),
                              WidgetSpan(
                                  child: const Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFF8B8C91),
                                size: 20,
                              ).padding(left: 5, bottom: 2))
                            ])).padding(left: 10),
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: constraints.maxHeight * .5,
                              child: const Icon(
                                Icons.search_rounded,
                                color: Color(0xFF8B8C91),
                              ).padding(right: 10))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          <Widget>[
                            SizedBox(
                              // width: screenWidth,
                              child: Text(
                                "Công việc",
                                style: GoogleFonts.nunito(
                                  fontSize: 33,
                                  fontWeight: FontWeight.w800,
                                ),
                              ).padding(left: 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("YO");
                              },
                              child: const Image(
                                image:
                                    AssetImage("assets/png/plus-rounded.png"),
                                width: 25,
                              ).padding(left: 8, top: 2),
                            ),
                          ].toRow(),
                          DropdownButton<String>(
                            value: "Tất cả",
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            items: <String>['Tất cả', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ).padding(right: 10)
                        ],
                      ).padding(bottom: 10)
                    ],
                  ),
                )),
            Container(
              width: screenWidth,
              height: screenHeight * .765, // Dunno why not .8 weird
              color: const Color(0xFFF5F6FB),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return <Widget>[TaskCard().padding(top: 31)].toColumn();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
