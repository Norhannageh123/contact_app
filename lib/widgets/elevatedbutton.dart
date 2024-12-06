import 'package:flutter/material.dart';

class ElevatedbuttonCard extends StatelessWidget {
  const ElevatedbuttonCard({super.key});
  
  @override
  Widget build(BuildContext context) {
     final double fieldWidth = MediaQuery.of(context).size.width - 32; //
    return SizedBox(
        width: fieldWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFF1D4), 
      foregroundColor: const Color(0xFF29384D), 
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400, 
      ),
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
        ),
        onPressed: () {
      
        },
        child: const Text(
      'Enter User',
      textAlign: TextAlign.center,
        ),
      ),
    );
  }
}