import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final int index;
  final int? selectedIndex;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    Color? bgColor;
    Color? textColor;
    IconData? icon;

    if (showResult) {
      if (isCorrect) {
        bgColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        icon = Icons.check_circle;
      } else if (isSelected) {
        bgColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        icon = Icons.cancel;
      } else {
        bgColor = Colors.grey.shade100;
        textColor = Colors.grey.shade700;
      }
    } else if (isSelected) {
      bgColor = Colors.blue.shade100;
      textColor = Colors.blue.shade800;
      icon = Icons.radio_button_checked;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: bgColor ?? Colors.grey.shade50,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: showResult ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                if (icon != null)
                  Icon(icon, size: 22, color: textColor)
                else
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Center(
                      child: Text(
                        String.fromCharCode(65 + index),
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor ?? Colors.black87,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
