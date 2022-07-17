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
  FormTextField({
    Key? key,
    required String this.hintText,
    FormFieldValidator? this.validator,
    TextEditingController? this.controller,
    ValueChanged<String>? onChanged,
    FormFieldSetter<String>? onSaved,
    IconData? this.icon,
    bool? this.isObscured,
    bool? this.pwVisible,
  }) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.sp),
      // width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.m_radius)),
      ),
      child: TextFormField(
        controller: widget.controller,
        style: TextStyle(
          color: Colours.tf_text,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        textInputAction: TextInputAction.next,
        obscureText:
            widget.isObscured ?? false ? !(widget.pwVisible ?? false) : false,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          hintStyle: const TextStyle(
            color: Colours.tf_text,
          ),
          border: InputBorder.none,
          hintText: widget.hintText,
          contentPadding: widget.icon == null
              ? EdgeInsets.only(top: 2, left: 12)
              : EdgeInsets.only(top: 13),
          prefixIcon: widget.icon == null
              ? null
              : Icon(
                  widget.icon,
                  color: Colours.tf_icon,
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
                          color: Colours.tf_icon,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Colours.tf_icon,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
