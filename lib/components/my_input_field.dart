import 'package:flutter/material.dart';

class InputFormField extends StatefulWidget {
  final bool isOptional;
  final String label;
  final String? hint;
  final TextEditingController controller;
  final IconData? icon;

  const InputFormField({
    required this.isOptional,
    this.hint,
    required this.label,
    required this.controller,
    this.icon,
    super.key,
  });

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  late TextInputType _keyboardType;

  @override
  void initState() {
    super.initState();
    _setKeyboardType();
  }

  void _setKeyboardType() {
    if (widget.label == 'Number') {
      _keyboardType = TextInputType.phone;
    } else if (widget.label == 'Email') {
      _keyboardType = TextInputType.emailAddress;
    } else {
      _keyboardType = TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final horizontalPadding = screenSize.width * 0.04;
    final verticalPadding = screenSize.height * 0.006;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.0,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.6),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Row(
              children: [
                if (widget.icon != null)
                  Padding(
                    padding: EdgeInsets.only(right: horizontalPadding),
                    child: Icon(widget.icon, color: Colors.white),
                  ),
                Container(
                  width: 1.0,
                  height: MediaQuery.of(context).size.height * 0.04,
                  color: Colors.white,
                ),
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    validator: (value) {
                      if (!widget.isOptional && (value == null || value.isEmpty)) {
                        return 'Please enter ${widget.label}';
                      }
                      return null;
                    },
                    keyboardType: _keyboardType,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: widget.hint,
                      labelText: widget.label,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
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
