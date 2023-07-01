import 'package:flutter/material.dart';
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.textEditingController,
    this.keyBoardType, this.suffixIcon, this.obscureText=false, this.validation,
  });

  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? textEditingController;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      validator: (value){
        if(validation!=null){
         return validation!(value);
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
