// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tasbix/bloc/theme_cubit/theme_cubit.dart';
import 'package:tasbix/feature/tasbix/domain/model/model.dart';
import 'package:tasbix/feature/tasbix/presentation/cubit/tasbix_cubit.dart';
import 'package:tasbix/feature/tasbix/presentation/pages/pages.dart';
import 'package:tasbix/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _currentIndex = 0;

  final List<TasbihModel> _tasbihList = [
    TasbihModel(arabic: "سبحان الله", cyrillic: "Субханаллах", count: 0),
    TasbihModel(arabic: "الحمد لله", cyrillic: "Альхамдулиллях", count: 0),
    TasbihModel(arabic: "الله أكبر", cyrillic: "Аллаху Акбар", count: 0),
    TasbihModel(arabic: "أستغفر الله", cyrillic: "Астагфируллах", count: 0),
  ];

  @override
  void initState() {
    super.initState();
    loadCountersFromCache();
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', _counter);
    setState(() {
      _counter++;
      _tasbihList[_currentIndex].count = _counter;
    });
  }

  _changeTasbihCard(int index) {
    setState(() {
      _currentIndex = index;
      _counter = _tasbihList[index].count;
    });
  }

  _resetTasbihCounters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var tasbih in _tasbihList) {
        tasbih.count = 0;
        prefs.remove(tasbih.arabic);
      }
    });
    await saveCountersToCache();
  }

  Future<void> loadCountersFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('count') ?? 0;
    for (var tasbih in _tasbihList) {
      setState(() {
        tasbih.count = prefs.getInt(tasbih.arabic) ?? 0;
      });
    }
  }

  Future<void> saveCountersToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var tasbih in _tasbihList) {
      prefs.setInt(tasbih.arabic, tasbih.count);
    }
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isdarkTheme = context.watch<ThemeCubit>().state.isdark;

    return Scaffold(
      backgroundColor: isdarkTheme ? const Color(0xFFFFFFFF) : Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).Tasbih,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: (22),
                  fontWeight: FontWeight.w600,
                )),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
              icon: const Icon(Icons.settings))
        ],
        elevation: 1,
      ),
      body: BlocBuilder<TasbixCubit, TasbixState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: isdarkTheme
                              ? Colors.black87
                              : Colors.grey.shade200,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _tasbihList[_currentIndex].arabic,
                              style: TextStyle(
                                  color:
                                      isdarkTheme ? Colors.white : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              _tasbihList[_currentIndex].cyrillic,
                              style: TextStyle(
                                  color:
                                      isdarkTheme ? Colors.white : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _changeTasbihCard(index);
                              },
                              child: Container(
                                  height: 70,
                                  width: 100,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      color: isdarkTheme
                                          ? Colors.black87
                                          : _currentIndex == index
                                              ? Colors.blue
                                              : Colors.grey.shade200),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _tasbihList[index].arabic,
                                      ),
                                      Text(
                                        _tasbihList[index].count.toString(),
                                      ),
                                    ],
                                  )),
                            );
                          },
                          itemCount: _tasbihList.length),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/Tasbix.png',
                      ),
                    ),
                    Positioned(
                      top: 47,
                      left: 126,
                      child: SizedBox(
                        height: 68,
                        width: 143,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('$_counter ',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 240,
                      top: 130,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: FloatingActionButton(
                          heroTag: 'reset_button', // уникалдуу белги

                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          onPressed: () {
                            _resetTasbihCounters();
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 142,
                      top: 159,
                      child: SizedBox(
                        height: 95,
                        width: 95,
                        child: FloatingActionButton(
                            heroTag: 'increment_button', // уникалдуу белги

                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            onPressed: () {
                              _incrementCounter();
                            }),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: isdarkTheme
                              ? MaterialStateProperty.all(Colors.black)
                              : MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: Text(
                        S.of(context).restore,
                        style: TextStyle(
                          color: isdarkTheme ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        saveCountersToCache();
                      },
                      child: Text(
                        S.of(context).save,
                        style: TextStyle(
                          color: isdarkTheme ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image.png'),
                ),
              ),
              child: Text(''),
            ),
            ListTile(
              title: Text(S.of(context).generalDhikrs),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).eveningDhikrs),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).morningDhikrs),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).selectedDhikrs),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).salavat),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(S.of(context).istighfar),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
              },
              trailing: const Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
