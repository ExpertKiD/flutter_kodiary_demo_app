part of 'home.dart';

class HomeMobileWidget extends StatelessWidget {
  const HomeMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobile")),
      body: BlocBuilder<ProjectsBloc, ProjectsState>(
        builder: (builderContext, state) {
          return state.maybeMap(
            loaded: (value) {
              return const Center(
                child: Text('Data loaded'),
              );
            },
            loadFailure: (value) {
              return FailedToLoadData(
                onPressed: () {
                  builderContext
                      .read<ProjectsBloc>()
                      .add(ProjectsEvent.getProjectsByCompanyDailyRequests());
                },
                description: value.failure.message,
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
