// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../components/HomeWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = -1;

  isSelected(int index) {
    if (select == index) return true;
    return false;
  }

  setSelected(int index) {
    setState(() => select = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 26, 60, 140),
                Color.fromARGB(155, 26, 60, 140),
              ]),
        ),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Image(
                image: const AssetImage("../../assets/altemed_logo.png"),
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.17),
              const Row(children: [
                SizedBox(width: 10),
                Icon(Icons.filter_alt, color: Colors.white),
                SizedBox(width: 5),
                Text("Filtres",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ]),
              const Divider(
                indent: 30,
                endIndent: 30,
                color: Colors.white,
                thickness: 0.3,
              ),
              FilterButton(
                icon: Icons.stacked_bar_chart,
                text: "Général",
                onClick: () {
                  setSelected(-1);
                },
                isSelected: isSelected(-1),
              ),
              FilterButton(
                icon: Icons.report_problem_outlined,
                text: "Réclamations",
                onClick: () {
                  setSelected(0);
                },
                isSelected: isSelected(0),
              ),
              FilterButton(
                icon: Icons.energy_savings_leaf_outlined,
                text: "Énergétique",
                onClick: () {
                  setSelected(1);
                },
                isSelected: isSelected(1),
              ),
              FilterButton(
                icon: Icons.build_circle_outlined,
                text: "Prestations",
                onClick: () {
                  setSelected(2);
                },
                isSelected: isSelected(2),
              ),
              FilterButton(
                icon: Icons.cell_tower,
                text: "Zones sensibles",
                onClick: () {
                  setSelected(3);
                },
                isSelected: isSelected(3),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.27),
              InkWell(
                // TODO: déconnecte
                onTap: () {},
                child: const Row(children: [
                  SizedBox(width: 10),
                  Icon(Icons.logout_outlined, color: Colors.white),
                  SizedBox(width: 5),
                  Text("Se déconnecter",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ]),
              ),
            ]),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.06),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(25)),
              ),
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Liste des rénovations par ordre de priorité',
                      style: TextStyle(
                        color: Color(0xFF1A3C8C),
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
