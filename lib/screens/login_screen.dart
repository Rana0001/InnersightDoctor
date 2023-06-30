// Create a login screen with a Login with Google button

import 'package:doctor/utils/app_gaps.dart';
import 'package:doctor/widgets/google_card.dart';
import 'package:flutter/material.dart';

import '../component/message.dart';
import '../services/services.dart';
import '../utils/app_page_names.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class _LoginState extends State<Login> {
  bool isLoading = false;
  _loginWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    bool result = await Services().loginWithGoogle(context);
    if (result) {
      setState(() {
        isLoading = false;
        Navigator.pushReplacementNamed(
            context, AppPageNames.homeNavigatorScreen);
        Messages.successMessage("Login Successful", context);
      });
    } else {
      setState(() {
        isLoading = false;
        Messages.errorMessage("Login Failed", context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Collaboration With InnerSight",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppGaps.wGap10,
            SizedBox(
                height: 30, child: Image.asset("assets/images/InnerSight.png")),
          ],
        ),
      ),
      // Create the form
      body: isLoading
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 20),
                  const Text('Please wait...')
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(16.0),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 200,
                      child: Image.asset("assets/images/logo.png")),
                  AppGaps.hGap10,
                  Text("Doctor JI",
                      style: Theme.of(context).textTheme.labelLarge),
                  AppGaps.hGap20,
                  InkWell(
                      onTap: () => _loginWithGoogle(),
                      child: GoogleFacebookCard(name: "Login with Google")),
                ],
              ),
            ),
    );
  }
}
