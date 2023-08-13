import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.onChanged});
  final textHelper = "Write at least 4 characters";
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
          suffix: Icon(Icons.search),
          errorText: textHelper.length < 4 ? textHelper : null,
          filled: true,
          hintText: "Mayor a 4",
          fillColor: Colors.white70,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
                color: Colors.white60,
                width: MediaQuery.of(context).size.width * 0.1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
                color: Colors.white60,
                width: MediaQuery.of(context).size.width * 0.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
                color: Color.fromARGB(203, 255, 255, 255),
                width: MediaQuery.of(context).size.width * .008),
          ),
        ),
      ),
    );
  }
}