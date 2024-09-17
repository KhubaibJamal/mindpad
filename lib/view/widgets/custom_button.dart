import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final Color? color;
  final bool loading;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height,
      required this.loading,
      this.color});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height ?? 30,
      width: loading ? 50 : width,
      decoration: BoxDecoration(
        color: !loading ? null : color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: loading
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              textColor: Colors.white,
              color: color ?? Theme.of(context).primaryColor,
              onPressed: onTap,
              child: Text(title),
            ),
    );
  }
}
