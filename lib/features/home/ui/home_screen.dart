import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/home/cubit/home_cubit.dart';
import 'package:gaza_tech/features/home/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          loggedOut: () => Navigator.pushNamedAndRemoveUntil(
            context,
            MyRoutes.signIn,
            (route) => false,
          ),
          error: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.red),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Tick It!"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => context.read<HomeCubit>().logout(),
            ),
          ],
        ),

        body: const Center(child: Text("Home Screen Content Goes Here")),
      ),
    );
  }
}
