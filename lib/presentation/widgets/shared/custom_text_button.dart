import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {

  final Color? textColor1;
  final Color? textColor2;
  final String text;

  const CustomTextButton({
    super.key,
    required this.text,
    this.textColor1 = Colors.blueAccent, 
    this.textColor2 = Colors.blue, 
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {

   late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.textColor1!;
  }

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTapDown: (_) => _toggleColor(true),
      onTapUp: (_) => _toggleColor(false),
      onTapCancel: () => _toggleColor(false),
      child: Row(
        children: [
          Text(widget.text, style: textStyles.bodyMedium!.copyWith(color: _currentColor)),
          Icon(Icons.arrow_forward_ios_outlined, size: 16, color: _currentColor)
        ],
      ),
    );
  }

  void _toggleColor(bool isPressedDown) {
    if ( isPressedDown ) {
      return setState(() {
        _currentColor = widget.textColor2!;
      });
    }

    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) {
        return setState(() {
          _currentColor = widget.textColor1!;
        });
      }
    });
  }

}



