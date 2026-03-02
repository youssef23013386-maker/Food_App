import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpSection extends StatefulWidget {
  final Function(String)? onCompleted;

  const OtpSection({super.key, this.onCompleted});

  @override
  State<OtpSection> createState() => _OtpSectionState();
}

class _OtpSectionState extends State<OtpSection> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
      List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
        _submitCode();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  void _submitCode() {
    String code = controllers.map((e) => e.text).join();
    if (code.length == 4) {
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title + Resend
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "CODE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Resend in 50s",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// OTP Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            4,
            (index) => _otpBox(index),
          ),
        ),
      ],
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) => _onChanged(value, index),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}