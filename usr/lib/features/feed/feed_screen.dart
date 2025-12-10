import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aura Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.wifi_tethering),
            onPressed: () {
              // Show connection status
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connected to 3 peers nearby')),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildPostItem(context, index);
        },
      ),
    );
  }

  Widget _buildPostItem(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Peer User ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2 mins ago • 50m away',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        // Media Placeholder
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.grey[900],
          child: Center(
            child: Icon(
              index % 2 == 0 ? Icons.image : Icons.videocam,
              size: 64,
              color: Colors.grey[700],
            ),
          ),
        ),
        // Actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.favorite_border),
              const SizedBox(width: 16),
              const Icon(Icons.comment_outlined),
              const SizedBox(width: 16),
              const Icon(Icons.share_outlined), // P2P Share
              const Spacer(),
              const Icon(Icons.bookmark_border),
            ],
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white),
              children: [
                const TextSpan(
                  text: 'Peer User ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Enjoying the offline vibes! #mesh #p2p #offline ${index + 1}',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
