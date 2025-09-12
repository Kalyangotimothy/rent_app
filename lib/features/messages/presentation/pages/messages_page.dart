import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _mockChats = [
      {
        'name': 'Michael Weber',
        'lastMessage': 'Is the apartment still available?',
        'time': '2:30 PM',
        'unread': 2,
        'avatar': 'https://i.pravatar.cc/150?img=1',
      },
      {
        'name': 'Sarah Miller',
        'lastMessage': 'When can I view the property?',
        'time': '12:45 PM',
        'unread': 0,
        'avatar': 'https://i.pravatar.cc/150?img=2',
      },
      {
        'name': 'David Thompson',
        'lastMessage': 'Thanks for the tour yesterday!',
        'time': '10:15 AM',
        'unread': 1,
        'avatar': 'https://i.pravatar.cc/150?img=4',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: _mockChats.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message_outlined,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No messages yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemCount: _mockChats.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final chat = _mockChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat['avatar']),
                  ),
                  title: Text(
                    chat['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat['lastMessage'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chat['time'],
                        style: TextStyle(
                          color: chat['unread'] > 0
                              ? AppColors.primary
                              : AppColors.textTertiary,
                        ),
                      ),
                      if (chat['unread'] > 0) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat['unread'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  onTap: () {
                    // TODO: Navigate to chat detail
                  },
                );
              },
            ),
    );
  }
}