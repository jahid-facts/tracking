import 'package:tracking/utils/importer.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  final bool hasOccurredError;
  const LoginScreen({
    this.hasOccurredError = false,
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
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    // Delay the execution to wait until the first frame is built
    Future.delayed(Duration.zero, () {
      // Show SnackBar here
      if (widget.hasOccurredError) {
        showToastMessage(context, 'Login: Wrong Information');
      }
    });
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

  Icon _setPasswordIcon() {
    if (_isObscure) {
      return const Icon(Icons.visibility);
    }
    return const Icon(Icons.visibility_off);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              // Logo
              Center(child: Image.asset(ImagesUtils.logoImages)),
              verticalSpace(),
              Text(
                'Log In',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              verticalSpace(),
              Text(
                'Email :',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              verticalSpace(height: 0.015),
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
                'Password :',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              verticalSpace(height: 0.015),
              SizedBox(
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    TextField(
                      controller: _passController,
                      focusNode: _passFocusNode,
                      decoration: textFieldDecoration(
                        prefixIcon: const Icon(Icons.lock_sharp),
                        hint: '******',
                        isFocused: isPassFocused,
                      ),
                      obscureText: _isObscure,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: _setPasswordIcon(),
                      ),
                    ),
                  ],
                ),
              ),

              verticalSpace(),
              if (BlocProvider.of<UserBloc>(context).state is UserLoadingState)
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary),
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.onPrimary),
                    surfaceTintColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary),
                  ),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 12.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              else
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
                    surfaceTintColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(vertical: 12.0),
                    child: Center(
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: whitePrimaryColor),
                      ),
                    ),
                  ),
                ),
              verticalSpace(),
            ],
          ),
        ),
      ),
    );
  }
}
