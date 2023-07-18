import 'package:tracking/utils/all_files.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/bg_login.png"),
            alignment: Alignment.bottomLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceV(size.height * 0.2),
            Center(child: Image.asset('assets/logo.png')),
            spaceV(size.height * 0.02),
            const Text(
              "Log In",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            spaceV(size.height * 0.02),
            const Text("Your Email :"),
            spaceV(10.0),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_sharp),
                hintText: 'example@gmail.com',
              ),
            ),
            spaceV(size.height * 0.02),
            const Text("Your Password :"),
            spaceV(10.0),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_sharp),
                hintText: '........',
              ),
              obscureText: true,
            ),
            spaceV(size.height * 0.02 + 10.0),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 12.0),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
            spaceV(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("If you forget your password, click "),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "here",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
