import 'package:flutter/material.dart';

class PickerDescription extends StatefulWidget {
  final IconData icon;
  String title;
  String text;
  final String holderText;
  final Function onClick;

  PickerDescription(
      {this.icon, this.title, this.text, this.holderText = "", this.onClick});

  @override
  _PickerDescriptionState createState() => _PickerDescriptionState();
}

class _PickerDescriptionState extends State<PickerDescription> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  widget.icon,
                  color: Colors.indigo[700],
                  size: 20,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.indigo[700],
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.text == null ? widget.holderText : widget.text,
                      style: TextStyle(
                        fontSize: 16,
                        color: widget.text == null ? Colors.grey[400] : Colors.grey[800],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 0, color: Colors.grey),
        ],
      ),
    );
  }
}
