import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white))),
      actions: [
        IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/wish_list');
            })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
