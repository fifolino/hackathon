// ignore_for_file: use_build_context_synchronously

import 'package:app/API/request.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({Key? key}) : super(key: key);

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool _obscureText = true;
  bool error = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x001a3c8c),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.49, -0.87),
                end: Alignment(-0.49, 0.87),
                colors: [
                  Color.fromARGB(255, 26, 60, 140),
                  Color.fromARGB(155, 26, 60, 140),
                ]),
          ),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 179),
              child: const Image(
                image: AssetImage('../../assets/altemed_logo.png'),
                width: 533,
                height: 203,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              margin: const EdgeInsets.only(top: 100),
              child: TextField(
                controller: email,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    fontSize: 20,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              margin: const EdgeInsets.only(top: 24),
              child: TextField(
                controller: password,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    fontSize: 20,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white),
                    onPressed: () {
                      setState(() => _obscureText = !_obscureText);
                    },
                  ),
                ),
                obscureText: _obscureText,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: 308,
              height: 62,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999)),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF1A3C8C)),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color.fromARGB(255, 178, 200, 255);
                      }
                      return null;
                    },
                  ),
                ),
                onPressed: () async {
                  if (email.text.isEmpty || password.text.isEmpty) {
                    setState(() {
                      error = true;
                      errorMessage = 'Veuillez entrer un email et un mot de passe valide.';
                    });
                    return;
                  }
                  bool isLogin = await Request().login(email.text, password.text);
                  if (isLogin) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                    setState(() {
                      error = false;
                      errorMessage = '';
                    });
                  } else {
                    setState(() {
                      error = true;
                      errorMessage = 'Veuillez entrer un email et un mot de passe valide.';
                    });
                  }
                },
                child: const Text(
                  'Se connecter',
                  style: TextStyle(
                      color: Color(0xFF1A3C8C),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            if (error) Container(
              margin: const EdgeInsets.only(top: 20), // Add a top margin
              child: const Text(
                'Veuillez entrer un email et un mot de passe valide.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 184, 179),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ]),
        ),
      ),
    );
  }
}
