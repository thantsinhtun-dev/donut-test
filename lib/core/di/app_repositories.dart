import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../hive/hive_service.dart';
import '../../features/auth/data/datasources/auth_user_data_source.dart';
import '../../features/auth/data/repositories/fake_auth_repository.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/home/data/datasources/home_local_datasource.dart';
import '../../features/home/data/datasources/home_remote_datasource.dart';
import '../../features/home/data/repositories/local_home_repository.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../hive/datasources/app_local_datasource.dart';

class AppRepositories extends StatefulWidget {
  const AppRepositories({required this.child, super.key});

  final Widget child;

  @override
  State<AppRepositories> createState() => _AppRepositoriesState();
}

class _AppRepositoriesState extends State<AppRepositories> {
  late final Future<void> _initialization = _initialize();
  late final HomeRepository _homeRepository = LocalHomeRepository(
    HomeLocalDatasource(),
    HomeRemoteDatasource(),
  );
  late final AuthRepository _repository = FakeAuthRepository(
    AuthUserDataSource(),
    AppLocalDatasource(),
  );

  Future<void> _initialize() async {
    await HiveService.init();
    await _homeRepository.seedIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) return ErrorWidget(snapshot.error!);
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        }
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AuthRepository>.value(value: _repository),
            RepositoryProvider<HomeRepository>.value(value: _homeRepository),
          ],
          child: widget.child,
        );
      },
    );
  }
}
