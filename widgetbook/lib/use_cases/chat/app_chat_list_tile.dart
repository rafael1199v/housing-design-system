import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Chat';

@UseCase(name: 'Unread', type: AppChatListTile, path: _path)
Widget chatListTileUnread(BuildContext context) {
  return boxed(
    AppChatListTile(
      title: 'María Fernández',
      subtitle: 'Perfecto, ahí estaré. ¡Gracias!',
      timeLabel: '10:28',
      unreadCount: 3,
      onTap: () {},
    ),
  );
}

@UseCase(name: 'Read', type: AppChatListTile, path: _path)
Widget chatListTileRead(BuildContext context) {
  return boxed(
    AppChatListTile(
      title: 'Carlos Rojas',
      subtitle: 'Te comparto la ubicación.',
      timeLabel: '09:50',
      onTap: () {},
    ),
  );
}

@UseCase(name: 'No subtitle', type: AppChatListTile, path: _path)
Widget chatListTileNoSubtitle(BuildContext context) {
  return boxed(
    AppChatListTile(title: 'Ana Gutiérrez', timeLabel: 'Lun', onTap: () {}),
  );
}

@UseCase(name: 'Overflow count (99+)', type: AppChatListTile, path: _path)
Widget chatListTileOverflow(BuildContext context) {
  return boxed(
    AppChatListTile(
      title: 'Grupo: Edificio Las Palmas',
      subtitle: 'Mensajes nuevos del administrador',
      timeLabel: 'Ahora',
      unreadCount: 128,
      onTap: () {},
    ),
  );
}

@UseCase(name: 'Playground', type: AppChatListTile, path: _path)
Widget chatListTilePlayground(BuildContext context) {
  final bool hasSubtitle =
      context.knobs.boolean(label: 'Show subtitle', initialValue: true);
  return boxed(
    AppChatListTile(
      title: context.knobs.string(label: 'Title', initialValue: 'María Fernández'),
      subtitle: hasSubtitle
          ? context.knobs.string(
              label: 'Subtitle',
              initialValue: 'Perfecto, ahí estaré.',
            )
          : null,
      timeLabel: context.knobs.boolean(label: 'Show time', initialValue: true)
          ? context.knobs.string(label: 'Time', initialValue: '10:28')
          : null,
      unreadCount: context.knobs.int.slider(
        label: 'Unread count',
        initialValue: 3,
        max: 120,
      ),
      onTap: () {},
    ),
  );
}
