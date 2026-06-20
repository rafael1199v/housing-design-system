import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';

const String _path = '[Patterns]';

class ChatListTemplate extends StatefulWidget {
  const ChatListTemplate({super.key});

  @override
  State<ChatListTemplate> createState() => _ChatListTemplateState();
}

class _ChatListTemplateState extends State<ChatListTemplate> {
  int _navIndex = 2; // Mensajes

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('Mensajes')),
      bottomNavigationBar: AppBottomNavBar(
        destinations: sampleNavDestinations,
        selectedIndex: _navIndex,
        onDestinationSelected: (i) => setState(() => _navIndex = i),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: AppSearchBar(hintText: 'Buscar conversaciones…'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: AppSectionHeader(
              title: 'Recientes',
              actionLabel: 'Editar',
              onActionPressed: () {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: sampleInbox.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, i) {
                final SampleChat chat = sampleInbox[i];
                return AppChatListTile(
                  title: chat.name,
                  subtitle: chat.lastMessage,
                  timeLabel: chat.time,
                  unreadCount: chat.unread,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

@UseCase(name: 'Chat list', type: ChatListTemplate, path: _path)
Widget chatListTemplate(BuildContext context) {
  return const ChatListTemplate();
}
