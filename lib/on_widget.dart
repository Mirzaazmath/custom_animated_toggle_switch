import "package:flutter/material.dart";
class OnToggleWidget extends StatefulWidget {
  const OnToggleWidget({super.key});

  @override
  State<OnToggleWidget> createState() => _OnToggleWidgetState();
}

class _OnToggleWidgetState extends State<OnToggleWidget>
    with SingleTickerProviderStateMixin {
  /// Using Animation Controller for Animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  /// Initializing the Animation and type of animation
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0,0.2),
    end:Offset.zero,
    /// Adding curve in the animation
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
  ));
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// Starting the Animation
    _controller.forward();

  }
  @override
  void dispose() {
    /// Disposing the Controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Using SlideTransition Widget to Slide the Widget in vertical direction
    return SlideTransition(
      position: _offsetAnimation,
      child: Row(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30,left: 10),
                  child: Text("ON",style: TextStyle(color: Colors.green.shade300,fontWeight: FontWeight.w700,fontSize: 20),),
                ),
              ),
            ),
            Image.asset("assets/tree.png"),

          ],
        ),

    );
  }
}