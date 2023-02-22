import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  const UserImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: Text(
          'F',
          style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
        ),
      ),
    );
  }
}
