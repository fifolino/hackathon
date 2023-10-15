// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../components/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 1;

  void onPageSelected(int index) {
    setState(() {
      selectedPage = index;
    });
  }

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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: const AssetImage("../../assets/altemed_logo.png"),
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  Column(children: [
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
                      onClick: () => setSelected(-1),
                      isSelected: isSelected(-1),
                    ),
                    FilterButton(
                      icon: Icons.energy_savings_leaf_outlined,
                      text: "Énergétique",
                      onClick: () => setSelected(1),
                      isSelected: isSelected(1),
                    ),
                    FilterButton(
                      icon: Icons.build_circle_outlined,
                      text: "Prestations",
                      onClick: () => setSelected(2),
                      isSelected: isSelected(2),
                    ),
                  ]),
                  InkWell(
                    onTap: () => Navigator.pop(context),
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
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(25)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Liste des rénovations par ordre de priorité',
                      style: TextStyle(
                          color: Color(0xFF1A3C8C),
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    PrioTable(data: data, page: selectedPage),
                    const SizedBox(height: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(
                        onPressed: () {
                          if (selectedPage > 1) {
                            setState(() => selectedPage--);
                          }
                        },
                        style: TextButton.styleFrom(
                            primary: const Color(0xFF1A3C8C)),
                        child: const Text('<', style: TextStyle(fontSize: 16)),
                      ),
                      ChangeIndex(index: 1, onPageSelected: onPageSelected),
                      ChangeIndex(index: 2, onPageSelected: onPageSelected),
                      ChangeIndex(index: 3, onPageSelected: onPageSelected),
                      TextButton(
                        onPressed: () {
                          if (selectedPage < 3) {
                            setState(() => selectedPage++);
                          }
                        },
                        style: TextButton.styleFrom(
                            primary: const Color(0xFF1A3C8C)),
                        child: const Text('>', style: TextStyle(fontSize: 16)),
                      ),
                    ]),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}

var data = [
  {
    "Classement de priorité": "1",
    "Résidence ACM": "0012",
    "Secteur": "Montpellier",
    "Date de construction": "1994",
    "Prestations": "8",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "2",
    "Résidence ACM": "0018",
    "Secteur": "Paris",
    "Date de construction": "2002",
    "Prestations": "8",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "3",
    "Résidence ACM": "0012",
    "Secteur": "Montpellier",
    "Date de construction": "1994",
    "Prestations": "8",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "4",
    "Résidence ACM": "0018",
    "Secteur": "Paris",
    "Date de construction": "2002",
    "Prestations": "8",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "5",
    "Résidence ACM": "0012",
    "Secteur": "Montpellier",
    "Date de construction": "1994",
    "Prestations": "8",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "6",
    "Résidence ACM": "0018",
    "Secteur": "Paris",
    "Date de construction": "2002",
    "Prestations": "8",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "7",
    "Résidence ACM": "0018",
    "Secteur": "Paris",
    "Date de construction": "2002",
    "Prestations": "8",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "8",
    "Résidence ACM": "0012",
    "Secteur": "Montpellier",
    "Date de construction": "1994",
    "Prestations": "8",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "9",
    "Résidence ACM": "0018",
    "Secteur": "Paris",
    "Date de construction": "2002",
    "Prestations": "8",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "10",
    "Résidence ACM": "0012",
    "Secteur": "Montpellier",
    "Date de construction": "1994",
    "Prestations": "8",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "11",
    "Résidence ACM": "JUPITER",
    "Secteur": "Jupiter",
    "Date de construction": "1967",
    "Prestations": "26",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "12",
    "Résidence ACM": "JUSTICE",
    "Secteur": "Vert Bois",
    "Date de construction": "1967",
    "Prestations": "24",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "13",
    "Résidence ACM": "URANUS",
    "Secteur": "Uranus",
    "Date de construction": "1968",
    "Prestations": "22",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "14",
    "Résidence ACM": "SATURNE",
    "Secteur": "Uranus",
    "Date de construction": "1969",
    "Prestations": "21",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "15",
    "Résidence ACM": "URANUS",
    "Secteur": "Uranus",
    "Date de construction": "1968",
    "Prestations": "19",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "16",
    "Résidence ACM": "SATURNE",
    "Secteur": "Uranus",
    "Date de construction": "1969",
    "Prestations": "18",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "17",
    "Résidence ACM": "PLUTON",
    "Secteur": "Gémeaux",
    "Date de construction": "1969",
    "Prestations": "18",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "18",
    "Résidence ACM": "VENUS",
    "Secteur": "Cap dou Mail",
    "Date de construction": "1970",
    "Prestations": "18",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "19",
    "Résidence ACM": "MERCURE",
    "Secteur": "Jupiter",
    "Date de construction": "1970",
    "Prestations": "17",
    "DPE": "D",
    "GES": "E",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "20",
    "Résidence ACM": "NEPTUNE",
    "Secteur": "Gémeaux",
    "Date de construction": "1970",
    "Prestations": "16",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
  {
    "Classement de priorité": "21",
    "Résidence ACM": "P.VALERY",
    "Secteur": "Paul Valéry",
    "Date de construction": "1971",
    "Prestations": "16",
    "DPE": "D",
    "GES": "D",
    "Zone sensible": "QPV",
  },
];
