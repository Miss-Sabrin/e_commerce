import 'package:e_commerce/model/peoduct.dart';
import 'package:flutter/material.dart';

class AvailbleSize extends StatefulWidget {
  final String size;
  const AvailbleSize({super.key,required this.size});

  @override
  State<AvailbleSize> createState() => _AvailbleSizeState();
}

class _AvailbleSizeState extends State<AvailbleSize> {
  bool isSelected=false;
  @override
  Widget build(BuildContext context)  =>GestureDetector(
    onTap: () {
      setState(() {
        isSelected=!isSelected;
      });
    },



    child: Container(
      margin: EdgeInsets.only(right: 16.0),
      height: 30,
      width: 40,
      decoration: BoxDecoration(
        //todo changible color whentap size 
        color: isSelected ? Colors.red:Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.red),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          widget.size,
          style: TextStyle(fontWeight: FontWeight.bold),),
      ),
  
    ),
  );
  

}