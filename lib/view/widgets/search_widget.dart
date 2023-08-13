import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.onChanged});
  final String textHelper = "Write at least 4 characters";
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.045,
          fontWeight: FontWeight.w700,
        ),
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffix: const Icon(Icons.search),
          errorText: textHelper.length < 4 ? textHelper : null,
          filled: true,
          hintText: "at least 4 characters",
          fillColor: Colors.white70,          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
                color: Colors.white60,
                width: MediaQuery.of(context).size.width * 0.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
                color: const Color.fromARGB(203, 255, 255, 255),
                width: MediaQuery.of(context).size.width * .008),
          ),
        ),
      ),
    );
  }
}