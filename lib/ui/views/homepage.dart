import 'package:flutter/material.dart';
import 'package:users_flutterapp/data/entity/users.dart';
import 'package:users_flutterapp/ui/views/details.dart';
import 'package:users_flutterapp/ui/views/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInSearch = false;

  Future<void> search(String searchWord) async {
    print("Searched : $searchWord");
  }

  Future<void> delete(int id) async {
    print("delete : $id");
  }

  Future<List<Users>> userLoad() async {
    var userList = <Users>[];
    var k1 = Users(user_id: 1, user_phone: "532654852", user_name: "Aysel");
    var k2 = Users(user_id: 2, user_phone: "524528526", user_name: "Hamide");
    var k3 = Users(user_id: 3, user_phone: "2568596", user_name: "Saka Su");
    userList.add(k1);
    userList.add(k2);
    userList.add(k3);

    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isInSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (searchResult) {
                  search(searchResult);
                },
              )
            : const Text("USERS"),
        actions: [
          isInSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isInSearch = false;
                    });
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isInSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<Users>>(
        future: userLoad(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userList = snapshot.data;
            return ListView.builder(
                itemCount: userList!.length,
                itemBuilder: (context, i) {
                  var k = userList[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(user: k)))
                          .then((value) => print("NOW : HomePage"));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    k.user_name,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Text(k.user_phone),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                    "${k.user_name} 'll delete u want continue?",
                                  ),
                                    action: SnackBarAction(
                                      label: "Continue",
                                      onPressed: (){
                                        delete((k.user_id));
                                      },
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.delete_forever),
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()))
              .then(
            (value) => print("NOW : Homepage"),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
