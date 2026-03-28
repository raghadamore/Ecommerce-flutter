
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.label, required this.colors, this.onTap, required this.textColor,
  });
final String label;
final List<Color> colors;
final Function()? onTap;
final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
     width: screenWidth(1.4),
     height: screenWidth(8),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors:colors, // الألوان المتدرجة
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(30), // الأطراف الدائرية
  ),
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        onTap;
      },
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: textColor, fontSize: screenWidth(26)),
        ),
      ),
    ),
  ),
);
  }
}
