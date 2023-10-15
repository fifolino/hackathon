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
                      onClick: () {
                        setSelected(-1);
                      },
                      isSelected: isSelected(-1),
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
                  ]),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    const PrioTable(data: [
                      {
                        "Classement de priorité": "1",
                        "Code résidence ACM": "0012",
                        "Ville": "Montpellier",
                        "Date de construction": "1994",
                        "Prestations": "8",
                        "DPE": "D",
                        "GES": "E",
                        "Zone sensible": "QPV",
                      },
                      {
                        "Classement de priorité": "2",
                        "Code résidence ACM": "0018",
                        "Ville": "Paris",
                        "Date de construction": "2002",
                        "Prestations": "8",
                        "DPE": "C",
                        "GES": "C",
                        "Zone sensible": "Hors QPV",
                      },
                      {
                        "Classement de priorité": "3",
                        "Code résidence ACM": "0012",
                        "Ville": "Montpellier",
                        "Date de construction": "1994",
                        "Prestations": "8",
                        "DPE": "D",
                        "GES": "E",
                        "Zone sensible": "QPV",
                      },
                      {
                        "Classement de priorité": "4",
                        "Code résidence ACM": "0018",
                        "Ville": "Paris",
                        "Date de construction": "2002",
                        "Prestations": "8",
                        "DPE": "C",
                        "GES": "C",
                        "Zone sensible": "Hors QPV",
                      },
                      {
                        "Classement de priorité": "5",
                        "Code résidence ACM": "0012",
                        "Ville": "Montpellier",
                        "Date de construction": "1994",
                        "Prestations": "8",
                        "DPE": "D",
                        "GES": "E",
                        "Zone sensible": "QPV",
                      },
                      {
                        "Classement de priorité": "6",
                        "Code résidence ACM": "0018",
                        "Ville": "Paris",
                        "Date de construction": "2002",
                        "Prestations": "8",
                        "DPE": "C",
                        "GES": "C",
                        "Zone sensible": "Hors QPV",
                      },
                      {
                        "Classement de priorité": "7",
                        "Code résidence ACM": "0012",
                        "Ville": "Montpellier",
                        "Date de construction": "1994",
                        "Prestations": "8",
                        "DPE": "D",
                        "GES": "E",
                        "Zone sensible": "QPV",
                      },
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (selectedPage > 1) {
                              setState(() {
                                selectedPage--;
                              });
                            }
                          },
                          child: Text('<', style: TextStyle(fontSize: 16)),
                          style:
                              TextButton.styleFrom(primary: Color(0xFF1A3C8C)),
                        ),
                        ChangeIndex(index: 1, onPageSelected: onPageSelected),
                        ChangeIndex(index: 2, onPageSelected: onPageSelected),
                        ChangeIndex(index: 3, onPageSelected: onPageSelected),
                        TextButton(
                          onPressed: () {
                            if (selectedPage < 3) {
                              setState(() {
                                selectedPage++;
                              });
                            }
                          },
                          child: Text('>', style: TextStyle(fontSize: 16)),
                          style:
                              TextButton.styleFrom(primary: Color(0xFF1A3C8C)),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
