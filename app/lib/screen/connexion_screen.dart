import 'package:flutter/material.dart';
import 'home_screen.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      margin: const EdgeInsets.only(top: 24),
      child: TextField(
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
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
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.white),
            onPressed: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
        ),
        obscureText: _obscureText,
      ),
    );
  }
}

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({Key? key}) : super(key: key);

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
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
              child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w100,
                ),
                decoration: InputDecoration(
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
            const PasswordTextField(),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
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