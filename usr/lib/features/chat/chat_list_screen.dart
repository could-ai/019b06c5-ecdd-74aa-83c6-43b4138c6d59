import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direct Messages'),
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text('Peer Friend ${index + 1}'),
            subtitle: const Text('Hey, did you get the video?'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '10:3${index} AM',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (index == 0)
                  Container(
                    margin: const EdgeInsets.top: 5,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // Navigate to chat detail
            },
          );
        },
      ),
    );
  }
}
