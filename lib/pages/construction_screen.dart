import 'package:tracking/utils/importer.dart';

class ConstructionPage extends StatelessWidget {
  const ConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<UsersBloc>(context),
        builder: (contex, state) {
          if (state is UsersInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_,index) {
                return Card(
                  child: ListTile(
                    title: Text(state.users[index].name),
                    subtitle: Text(state.users[index].email),
                  ),
                );
              },
            );
          }else if(state is UsersErrorState){
            return Center(child: Text(state.errorMassege),);
          }
          return ListView();
        },
      ),
    );
  }
}
