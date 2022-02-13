import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tasq/widgets/stacked_avatar.dart';

class TaskCard extends StatefulWidget {
  TaskCard({Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              // offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Checkbox(
              checkColor: const Color(0xFF61C877),
              fillColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)),
              side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(
                    width: 1.5,
                    color: !isChecked ? Colors.black : const Color(0xFF61C877)),
              ),
            ),
            <Widget>[
              Text(
                "Finding Nemo",
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ).alignment(Alignment.centerLeft),
              const LinearProgressIndicator(
                backgroundColor: Color(0xFF3C3056),
                color: Color(0xFFFFCE93),
                value: 0.69,
              ),
            ]
                .toColumn(mainAxisAlignment: MainAxisAlignment.center)
                .width(constraints.maxWidth * .5),
            buildStackedImages(direction: TextDirection.rtl)
                .height(32)
                .width(constraints.maxWidth * .36)
          ],
        ),
      ),
    );
  }

  Widget buildStackedImages({
    TextDirection direction = TextDirection.rtl,
  }) {
    final double size = 32;
    final double xShift = 9.5;
    final urlImages = [
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ];

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

    return StackedAvatar(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    ).alignment(Alignment.centerRight).padding(right: 15);
  }

  Widget buildImage(String urlImage) {
    final double borderSize = .5;

    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
