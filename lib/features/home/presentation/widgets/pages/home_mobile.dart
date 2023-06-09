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
              final projects = value.response.projects;

              return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  itemBuilder: (context, index) {
                    return ProjectTile(project: projects[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: projects.length);
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
