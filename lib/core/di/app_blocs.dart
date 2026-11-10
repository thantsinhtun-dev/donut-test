import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/cubit/auth_state.dart';

class AppBlocs extends StatelessWidget {
  const AppBlocs({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) {
            final repository = context.read<AuthRepository>();
            return AuthCubit(
              repository,
              initialState: AuthState(isLoggedIn: repository.isLoggedIn),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
