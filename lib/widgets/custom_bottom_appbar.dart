import 'package:flutter/material.dart';

class Custom_BottomAppBar extends StatelessWidget {
  const Custom_BottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.black,
        child: SizedBox(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: const Icon(Icons.home, color: Colors.white)),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white)),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    icon: const Icon(Icons.person, color: Colors.white)),
              ],
            )));
  }
}
