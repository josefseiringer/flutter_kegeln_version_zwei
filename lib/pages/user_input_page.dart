import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/game_page.dart';
import '../controller/user_controller.dart';

class UserInputPage extends StatelessWidget {
  static const namedRoute = '/User-Input-Page';
  const UserInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    var userCtrl = UserController.to;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Input Page'),
        actions: [
          IconButton(
            onPressed: () => userCtrl.isListOfUserExists() ? Get.offNamed(GamePage.namedRoute) : null,
            icon: const Icon(Icons.home_max_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Input a User Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 190,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.top,
                        controller: userCtrl.userNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (() => userCtrl.addAUser()),
                      icon: const Icon(Icons.add_box_outlined),
                      iconSize: 50,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Obx(
                      () => userCtrl.userList.isEmpty
                          ? const Center(
                              child: Text(
                                'At Time no Data!',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: ((context, index) => ListTile(
                                    title: Text(
                                      userCtrl.userList[index],
                                      style: const TextStyle(fontSize: 28),
                                    ),
                                    leading: const Icon(Icons.person),
                                    trailing: IconButton(
                                        onPressed: () => userCtrl.deleteAUser(index),
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  )),
                              separatorBuilder: ((context, index) => Divider(
                                    color: Colors.blue.shade400,
                                  )),
                              itemCount: userCtrl.userList.length,
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () => userCtrl.saveUsers(),
                icon: const Icon(Icons.save_outlined),
                label: const Text('Save User List'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  fixedSize:
                      Size.fromWidth(MediaQuery.of(context).size.width - 100),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => userCtrl.deleteAllUsersInList(),
                icon: const Icon(Icons.save_outlined),
                label: const Text('Delete User List'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  fixedSize:
                      Size.fromWidth(MediaQuery.of(context).size.width - 100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
