import 'package:e_commerce/controllers/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Center(
      child: TextButton(
        onPressed: () async {
          await authCubit.logout();
        },
        child: const Text('Logout'),
      ),
    );
  }
}
