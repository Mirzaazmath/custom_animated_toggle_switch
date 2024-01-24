import "package:flutter/material.dart";
class OffToggleWidget extends StatefulWidget {
  const OffToggleWidget({super.key});

  @override
  State<OffToggleWidget> createState() => _OffToggleWidgetState();
}

class _OffToggleWidgetState extends State<OffToggleWidget>
    with SingleTickerProviderStateMixin {
  /// Using Animation Controller for Animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  /// Initializing the Animation and type of animation
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-0,-1.0),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/ball.png"),
          const  SizedBox(width: 15,),
          Center(child: Text("OFF",style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.w700,fontSize: 20),))
        ],
      ),

    );
  }
}