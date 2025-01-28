import 'package:ecommerce/consts/consts.dart';

Widget CustomTextField(String? title, String? hint,controller,isPass) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.yellowAccent).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration:  InputDecoration(
          hintStyle: TextStyle(
            color: Colors.black12
          ),
          hintText: hint,
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellowAccent)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellowAccent))
        ),
      ),
      8.heightBox
    ],
  );
}