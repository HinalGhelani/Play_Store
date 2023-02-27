import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_store/Global.dart';

import 'detail_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyApp(),
        'detail_page': (context) => const DetailPage(),
        'forYou': (context) => const forYouPage(),
        'topCharts': (context) => const topCharts(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndx = 0;
  final pages = [const forYouPage(), const topCharts()];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, bool) {
            return [
              SliverAppBar(
                elevation: 0,
                toolbarHeight: 15,
                backgroundColor: Colors.white,
                expandedHeight: 120,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pageIndx = 0;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "For you",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: (pageIndx == 0)
                                                ? Colors.teal
                                                : Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      (pageIndx == 0)
                                          ? const Divider(
                                              thickness: 2,
                                              height: 3,
                                              color: Colors.teal,
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 40),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pageIndx = 1;
                                    });
                                  },
                                  child: Text(
                                    "Top charts",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: (pageIndx == 1)
                                            ? Colors.teal
                                            : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 40),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Kids",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 40),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Events",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 40),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Premium",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 40),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Categories",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          width: w,
                          decoration: BoxDecoration(
                            color: const Color(0xffFDFDFD),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 1.9,
                                blurRadius: 1.4,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.menu,
                                color: Colors.black,
                              ),
                              suffixIcon: Icon(
                                Icons.mic_none,
                                color: Colors.black,
                              ),
                              border: InputBorder.none,
                              hintText: "Search for apps & games",
                            ),
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: pages[pageIndx],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.games,
                  color: Colors.teal,
                  size: 20,
                ),
                Text(
                  "Games",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.apps,
                  size: 20,
                  color: Colors.grey.shade800,
                ),
                Text(
                  "Apps",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.movie_sharp,
                  size: 20,
                  color: Colors.grey.shade800,
                ),
                Text(
                  "Movies",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.library_books,
                  color: Colors.grey.shade800,
                  size: 20,
                ),
                Text(
                  "Books",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
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

class forYouPage extends StatefulWidget {
  const forYouPage({Key? key}) : super(key: key);

  @override
  State<forYouPage> createState() => _forYouPageState();
}

class _forYouPageState extends State<forYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recommended for you",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: GlobalVar.recommended.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context)
                                  .pushNamed('detail_page', arguments: e);
                            });
                          },
                          child: Hero(
                            tag: e['name'],
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: Image.network(
                                    "${e['img']}",
                                    fit: BoxFit.cover,
                                  ).image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          e['name'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(e['rate']),
                            Icon(
                              Icons.star,
                              color: Colors.grey.shade700,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }).toList()),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "News & updated apps",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: GlobalVar.update.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context)
                                  .pushNamed('detail_page', arguments: e);
                            });
                          },
                          child: Hero(
                            tag: e['name'],
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: Image.network(
                                        "${e['img']}",
                                        fit: BoxFit.cover,
                                      ).image,
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          e['name'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e['rate']),
                            Icon(
                              Icons.star,
                              color: Colors.grey.shade700,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }).toList()),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Suggested for you",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: GlobalVar.suggested.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushNamed(
                                'detail_page',
                                arguments: e,
                              );
                            });
                          },
                          child: Hero(
                            tag: e['name'],
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: Image.network(
                                        "${e['img']}",
                                        fit: BoxFit.cover,
                                      ).image,
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          e['name'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e['rate']),
                            Icon(
                              Icons.star,
                              color: Colors.grey.shade700,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }).toList()),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}

class topCharts extends StatefulWidget {
  const topCharts({Key? key}) : super(key: key);

  @override
  State<topCharts> createState() => _topChartsState();
}

class _topChartsState extends State<topCharts> {
  bool value = true;
  String tap = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Show installed apps",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Switch(
                          activeColor: Colors.teal,
                          value: value,
                          onChanged: (val) {
                            setState(() {
                              value = !value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tap = "forYou";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 14),
                            decoration: (tap == "forYou")
                                ? BoxDecoration(
                                    color: Colors.teal.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2,
                                    ),
                                  ),
                            child: Text(
                              "For You",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: (tap == "forYou")
                                    ? Colors.teal
                                    : Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tap = "categories";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 14),
                            decoration: (tap == "categories")
                                ? BoxDecoration(
                                    color: Colors.teal.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2,
                                    ),
                                  ),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: (tap == "categories")
                                    ? Colors.teal
                                    : Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tap = "new";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 14),
                            decoration: (tap == "new")
                                ? BoxDecoration(
                                    color: Colors.teal.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2,
                                    ),
                                  ),
                            child: Text(
                              "New",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: (tap == "new")
                                    ? Colors.teal
                                    : Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children: GlobalVar.update.map((e) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Text("${e['id']}"),
                          const SizedBox(width: 15),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: Image.network(
                                  "${e['img']}",
                                  fit: BoxFit.cover,
                                ).image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${e['dName']}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${e['des']}",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${e['fRate']}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.grey.shade600,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
