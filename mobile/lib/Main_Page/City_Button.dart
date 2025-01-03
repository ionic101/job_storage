import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class City_Button extends StatelessWidget {
  const City_Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 15),
      child: Row(
        children: [
          SizedBox(
            width: 165,
            height: 40,
            child: TextButton(
                onPressed: null,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.placemark,
                      color: Color(0xFF3C3744),
                    ),
                    Text(
                      "Екатеринбург",
                      style: TextStyle(fontSize: 18, color: Color(0xFF3C3744)),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}