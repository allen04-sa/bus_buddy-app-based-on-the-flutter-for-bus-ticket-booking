import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class profilemenuwidget extends StatelessWidget {
  const profilemenuwidget({
    Key? key,
    required this.title,
    required this.onpress,
    required this.icon,
    this.endIcon = true,
    this.textcolor,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onpress;
  final bool endIcon;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.green : Colors.yellow;

    return ListTile(
      onTap: onpress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.blueAccent,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: endIcon
          ? Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:
                    const Color.fromARGB(255, 108, 130, 147).withOpacity(0.1),
              ),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: const Color.fromARGB(255, 116, 131, 156),
              ),
            )
          : null,
    );
  }
}
