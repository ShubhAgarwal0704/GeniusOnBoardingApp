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
    Key? key,
  }) : super(key: key);

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  late TextInputType _keyboardType;
  late String? Function(String?) _validator;

  @override
  void initState() {
    super.initState();
    _setKeyboardType();
    _setValidator();
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

  void _setValidator() {
    _validator = (value) {
      if (!widget.isOptional && (value == null || value.isEmpty)) {
        return 'Please enter ${widget.label}';
      }

      // Brand Name and POC Name should be more than 3 characters long
      if ((widget.label == 'Brand Name' || widget.label == 'POC Name') && (value?.length ?? 0) <= 3) {
        return '${widget.label} should be more than 3 characters long';
      }

      // Email validation
      if (widget.label == 'Email' && !isValidEmail(value)) {
        return 'Please enter a valid email address';
      }

      // Phone number validation
      if (widget.label == 'Number') {
        if (value!.length != 10 || !isNumeric(value)) {
          return 'Please enter a valid 10-digit phone number';
        }
      }

      // Website link validation
      if (widget.label == 'Website Link (Optional)') {
        if (value!.contains(' ')) {
          return 'Website link should not contain any spaces';
        }
        // You can add more complex website link validation logic here if needed
      }

      return null;
    };
  }

  bool isValidEmail(String? value) {
    // Simple email validation regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value ?? '');
  }

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
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
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Colors.purple.withOpacity(0.2),
            //     Colors.purple.withOpacity(0.4),
            //     Colors.purple.withOpacity(0.5),
            //     Colors.purple.withOpacity(0.6),
            //   ],
            // ),
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
                    validator: _validator,
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
