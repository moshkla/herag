import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../constants/constants.dart';


class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key,
        this.items,
        this.text = '',
        this.fillColor =  Colors.white,
        this.onSave,
        this.borderColor,
        this.validator})
      : super(key: key);
  final List<String>? items;
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _chosenValue;

  // List<String>? categories = widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: (widget.borderColor == null)?Border.all(color: AppColors.primary):Border.all(color: widget.borderColor!),
        color: widget.fillColor!,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.primary, size: 30,),
        iconEnabledColor: const Color.fromRGBO(148, 148, 148, 1),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: _chosenValue,
        items: widget.items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              value,
              style: headingStyle.copyWith(color: AppColors.primary, fontSize: 12),
            ),
          );
        }).toList(),
        hint: Text(
          widget.text,
          style:  headingStyle.copyWith(color: Colors.black, fontSize: 14),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
          });
          _chosenValue=value;
        },
        onSaved: widget.onSave,
        validator: widget.validator,
      ),
    );
  }
}