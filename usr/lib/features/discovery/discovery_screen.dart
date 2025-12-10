import 'package:flutter/material.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Peers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: const Center(
                child: Icon(Icons.radar, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Scanning for nearby devices...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              'Ensure Bluetooth and Wi-Fi are on',
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildPeerTile('Alice\'s iPhone', 'Strong Signal', true),
                  _buildPeerTile('Bob\'s Pixel', 'Medium Signal', true),
                  _buildPeerTile('Unknown Device', 'Weak Signal', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeerTile(String name, String signal, bool trusted) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          Icons.phone_android,
          color: trusted ? Colors.green : Colors.grey,
        ),
        title: Text(name),
        subtitle: Text(signal),
        trailing: trusted
            ? const Icon(Icons.check_circle, color: Colors.green, size: 16)
            : ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(60, 30),
                  padding: EdgeInsets.zero,
                ),
                child: const Text('Connect'),
              ),
      ),
    );
  }
}
