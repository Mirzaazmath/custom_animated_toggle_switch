import 'package:flutter/material.dart';
import 'off_widget.dart';
import 'on_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Create a boolean to handle toggle
  bool isToggle=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// BackGround Color is Light green color
      backgroundColor: Colors.green.shade50,
      /// Covering the Entire Screen body with Stack to change the background color when toggle
      body: Stack(
        children: [
          /// In Center There is an AnimatedContainer which change it size and radius when toggle
          /// that color is dark green and this widget hides behind the toggle Switch.it wont be visible
         Center(
           child: AnimatedContainer(
               height:isToggle?MediaQuery.sizeOf(context).height:20,
               width:isToggle?MediaQuery.sizeOf(context).width:20,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(isToggle?0:100),
                 color: Colors.green
               ),
               /// Duration
               duration:const  Duration(milliseconds: 150)),
         ),
          ///  This is the Toggle Switch with fixed height and width at center of the screen
          Center(
            child: SizedBox(
              height: 90,
              width: 150,
              /// here using stack for tree
              child: Stack(
                children: [
                  Column(
                    children: [
                    const Spacer(),
                      /// Actual Switch
                      GestureDetector(
                        /// Changing the boolean value
                        onTap: (){
                          setState(() {
                            isToggle=!isToggle;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            color:isToggle?Colors.green.shade900: Colors.green.shade200,
                            border: Border.all(color: Colors.green,width: 2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          /// Off toggle Widget or Initial Widget
                          child:!isToggle?const OffToggleWidget() :const SizedBox()
                        ),
                      ),
                    ],
                  ),
                  isToggle?    GestureDetector(
                    onTap: (){
                      setState(() {
                        isToggle=!isToggle;
                      });
                    },
                      /// On toggle Widget or Second Widget
                    child: const OnToggleWidget()): const SizedBox()


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
