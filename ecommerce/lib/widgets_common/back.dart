import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget Back({Widget? child}){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(back),fit: BoxFit.fill)
    ),
    child: child,
  );
}