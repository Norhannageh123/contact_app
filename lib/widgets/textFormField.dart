import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  const Textformfield({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
  cursorColor: const Color(0xFFFFF1D4),
  style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  decoration: InputDecoration(
    fillColor: const Color(0xff29384D),
    filled: true,
    hintText: text,
    hintStyle: const TextStyle(
      color: Color(0xFFE2F4F6),
      fontSize: 16,
    ),
    contentPadding: const EdgeInsets.all(16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFFFF1D4),
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFFFF1D4),
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFFFF1D4),
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFEE403D),
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xFFEE403D),
        width: 2,
      ),
    ),
  ),
);
  }
}