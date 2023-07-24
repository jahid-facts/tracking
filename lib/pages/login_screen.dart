import "package:tracking/utils/importer.dart";

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  final bool hasOccurredError=false;
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passController;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  final double height = getScreenHeight();
  bool isEmailFocused = false;
  bool isPassFocused = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _emailFocusNode.addListener(() {
      setState(() {
        isEmailFocused = _emailFocusNode.hasFocus;
      });
    });
    _passFocusNode.addListener(() {
      setState(() {
        isPassFocused = _passFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void hide() {
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Container is used for Background Image
        child: Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(ImagesUtils.loginImages),
                alignment: Alignment.bottomLeft),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(height: 0.2),
              Center(child: Image.asset(ImagesUtils.logoImages)),
              verticalSpace(),
              Text(
                "Log In",
                style: Theme.of(context).textTheme.titleLarge,
                // style: const TextTheme().titleLarge,
              ),
              verticalSpace(),
              Text(
                "Email :",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              // verticalSpace(),
              TextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: textFieldDecoration(
                  prefixIcon: const Icon(Icons.email_sharp),
                  hint: 'example@gmail.com',
                  isFocused: isEmailFocused,
                ),
              ),
              verticalSpace(),
              Text(
                "Password :",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              // verticalSpace(),
              TextField(
                controller: _passController,
                focusNode: _passFocusNode,
                decoration: textFieldDecoration(
                  prefixIcon: const Icon(Icons.lock_sharp),
                  hint: '******',
                  isFocused: isPassFocused,
                ),
                obscureText: true,
              ),
              verticalSpace(),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<UserBloc>(context).add(FetchUserEvent(
                    email: _emailController.text,
                    password: _passController.text,
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.primary),
                  foregroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.onPrimary),
                  // overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).colorScheme.primary)
                  surfaceTintColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.primary),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(vertical: 12.0),
                  child: Center(
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: whitePrimaryColor),
                    ),
                  ),
                ),
              ),
              verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("If you forget your password, click "),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "here",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
