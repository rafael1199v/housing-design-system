import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/sample_data.dart';

const String _path = '[Patterns]';

class ChatThreadTemplate extends StatefulWidget {
  const ChatThreadTemplate({super.key});

  @override
  State<ChatThreadTemplate> createState() => _ChatThreadTemplateState();
}

class _ChatThreadTemplateState extends State<ChatThreadTemplate> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scroll = ScrollController();
  late final List<SampleMessage> _messages = List.of(sampleThread);

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _send(String text) {
    setState(() {
      _messages.add(SampleMessage(text, true, 'Ahora'));
    });
    _controller.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;

    return AppScaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: cs.surfaceContainerHigh,
              child: Icon(Icons.person_outline, color: cs.outline, size: 20),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Text('María Fernández'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              controller: _scroll,
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: _messages.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, i) {
                final SampleMessage m = _messages[i];
                return AppChatBubble(
                  message: m.text,
                  isMine: m.isMine,
                  timeLabel: m.time,
                  pending: m.pending,
                );
              },
            ),
          ),
          AppMessageComposer(
            controller: _controller,
            hintText: 'Escribe un mensaje…',
            onSend: _send,
          ),
        ],
      ),
    );
  }
}

@UseCase(name: 'Chat thread', type: ChatThreadTemplate, path: _path)
Widget chatThreadTemplate(BuildContext context) {
  return const ChatThreadTemplate();
}
