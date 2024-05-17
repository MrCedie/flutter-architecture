import 'package:flutter/material.dart';
import 'package:flutter_architectures/mvvm/repository/user_repository.dart';
import 'package:flutter_architectures/mvvm/view-model/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserViewcreen extends StatelessWidget {
  const UserViewcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(UserRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text('User')),
        body: Consumer<UserViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.isError != null) {
              return Center(child: Text('${viewModel.isError}'));
            }

            if (viewModel.user != null) {
              return Center(
                  child: Column(
                children: [
                  Text('Name: ${viewModel.user!.name}'),
                  Text('Username: ${viewModel.user!.username}'),
                  Text('Email: ${viewModel.user!.email}'),
                  Text('Phone: ${viewModel.user!.phone}'),
                  Text('Website: ${viewModel.user!.website}'),
                ],
              ));
            }

            return Center(
              child: ElevatedButton(
                onPressed: () {
                  viewModel.fetchUser();
                },
                child: const Text('Fetch User'),
              ),
            );
          },
        ),
      ),
    );
  }
}
