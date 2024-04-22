import 'package:flutter/material.dart';
import 'package:tdd_clean_arch/custom_colors.dart';

class ApodViewButton extends StatelessWidget {

  final IconData? icon;
  final String title;
  final String? description;
  final Function()? onTap;

  const ApodViewButton({ super.key, this.icon, required this.title, this.description, required this.onTap});

   @override
   Widget build(BuildContext context) {
       return GestureDetector(
              onTap: onTap,
              child: Container(
                width: 205,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CustomColors.black, 
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: CustomColors.white.withOpacity(.3)),
                ),
                child: Column(
                  children: [
                    Icon(icon, color: CustomColors.white, size: 50),
                    Text(title, style: TextStyle(color: CustomColors.white, fontSize: 22)),
                    Text(description ?? "", style: TextStyle(color: CustomColors.white, fontSize: 10), textAlign: TextAlign.center),
               ],
           ),
         ),
       );
  }
}