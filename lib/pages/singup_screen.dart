import "package:tracking/utils/importer.dart";

class SingUpScreen extends StatelessWidget {
  static const route = '/sing_up';
  SingUpScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // spaceV(size.height * 0.1),
                verticalSpace(),
                Center(child: Image.asset(ImagesUtils.logoImages)),
                // spaceV(size.height * 0.02),
                verticalSpace(),
                Text(
                  "Add User",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                // spaceV(size.height * 0.02),
                verticalSpace(),
                Text("Number :",
                    style: Theme.of(context).textTheme.labelMedium),
                // spaceV(10.0),
                // verticalSpace(),
                TextField(
                  decoration: textFieldDecoration(
                    prefixIcon: const Icon(Icons.call_sharp),
                    hint: '1234567890',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                // spaceV(size.height * 0.02),
                verticalSpace(),
                Text("Email :", style: Theme.of(context).textTheme.labelMedium),
                // spaceV(10.0),
                // verticalSpace(),
                TextField(
                  decoration: textFieldDecoration(
                    prefixIcon: const Icon(Icons.email_sharp),
                    hint: 'example@gmail.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                // spaceV(size.height * 0.02),
                verticalSpace(),
                Text("Password :",
                    style: Theme.of(context).textTheme.labelMedium),
                // spaceV(10.0),
                // verticalSpace(),
                TextField(
                  decoration: textFieldDecoration(
                    prefixIcon: const Icon(Icons.lock_sharp),
                    hint: '........',
                  ),
                  obscureText: true,
                ),
                // spaceV(size.height * 0.02),
                verticalSpace(),
                Text("Confirm Password :",
                    style: Theme.of(context).textTheme.labelMedium),
                // spaceV(10.0),
                // verticalSpace(),
                TextField(
                  decoration: textFieldDecoration(
                    prefixIcon: const Icon(Icons.lock_sharp),
                    hint: '........',
                  ),
                  obscureText: true,
                ),
                // spaceV(size.height * 0.02 + 10.0),
                verticalSpace(),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(vertical: 12.0),
                    child: Center(
                      child: Text("Create user",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: whitePrimaryColor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
