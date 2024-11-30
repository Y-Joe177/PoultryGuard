import 'package:flutter/material.dart';
class OrangeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color baseColor;
  final Color textColor;
  final void Function()? onClick;
  const OrangeCard({super.key, required this.title, required this.icon, this.baseColor=Colors.orange, this.textColor=Colors.white, this.onClick, });

  @override
  Widget build(BuildContext context) {
    // Calculate lighter and darker shades of the base color
    final Color lighterShade = baseColor.withOpacity(0.8);
    final Color darkerShade = baseColor.withOpacity(1);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange.shade400,
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [lighterShade, darkerShade], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      width: 150,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: textColor, size: 24.0),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontFamily: 'Cursive',
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onClick,
              borderRadius: BorderRadius.circular(500),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: textColor.withOpacity(0.6),
                ),
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: darkerShade,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}