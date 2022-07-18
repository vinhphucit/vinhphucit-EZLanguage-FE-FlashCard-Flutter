import 'package:fe_ezlang_flashcard/app/config/resources/colours.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  bool? isObscured;
  bool? pwVisible;
  IconData? icon;
  String hintText;
  FormFieldValidator? validator;
  TextEditingController? controller;
  FormFieldSetter<String>? onSaved;
  ValueChanged<String>? onChanged;
  bool? defaultFocus;
  bool? disabled;
  FormTextField({
    Key? key,
    required this.hintText,
    this.validator,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.defaultFocus,
    this.icon,
    this.isObscured,
    this.pwVisible,
    this.disabled,
  }) : super(key: key);

  @override
  State<FormTextField> createState() {
    return _FormTextFieldState();
  }
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: Dimens.sp),
        // width: size.width * 0.9,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.mRadius)),
        ),
      ),
      TextFormField(
        controller: widget.controller,
        style: const TextStyle(
          color: Colours.tfText,
        ),
        autofocus: widget.defaultFocus ?? false,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        enabled: !(widget.disabled ?? false),
        validator: widget.validator,
        textInputAction: TextInputAction.next,
        obscureText:
            widget.isObscured ?? false ? !(widget.pwVisible ?? false) : false,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          hintStyle: const TextStyle(
            color: Colours.tfText,
          ),
          border: InputBorder.none,
          hintText: widget.hintText,
          // contentPadding: widget.icon == null
          //     ? const EdgeInsets.only(top: 2, left: 12)
          //     : const EdgeInsets.only(top: 13),
          prefixIcon: widget.icon == null
              ? null
              : Icon(
                  widget.icon,
                  color: Colours.tfIcon,
                ),
          suffixIcon: widget.isObscured ?? false
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.pwVisible = !(widget.pwVisible ?? false);
                    });
                  },
                  child: widget.pwVisible ?? false
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Colours.tfIcon,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Colours.tfIcon,
                        ),
                )
              : null,
        ),
      ),
    ]);
  }
}
