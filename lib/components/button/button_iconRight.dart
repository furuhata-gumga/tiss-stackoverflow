import 'package:flutter/material.dart';

class IconButtonRight extends StatelessWidget {
  final Function onClick;
  final String title;
  final Widget icon;
  final Color buttonColor;
  final Color textColor;
  const IconButtonRight({Key? key, required this.onClick, required this.title, required this.icon, required this.buttonColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onClick(),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )
            )
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  )
              ),
              WidgetSpan(
                child: icon,
              )
            ],
          ),
        )
    );
  }
}
