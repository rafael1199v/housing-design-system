import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../helpers/wrappers.dart';

const String _path = '[Components]/Chat';

@UseCase(name: 'Mine', type: AppChatBubble, path: _path)
Widget chatBubbleMine(BuildContext context) {
  return boxed(
    const AppChatBubble(
      message: 'Claro, a las 16:00 me viene bien.',
      isMine: true,
      timeLabel: '10:27',
    ),
  );
}

@UseCase(name: 'Other', type: AppChatBubble, path: _path)
Widget chatBubbleOther(BuildContext context) {
  return boxed(
    const AppChatBubble(
      message: '¿Podría visitarlo mañana por la tarde?',
      isMine: false,
      timeLabel: '10:26',
    ),
  );
}

@UseCase(name: 'Pending', type: AppChatBubble, path: _path)
Widget chatBubblePending(BuildContext context) {
  return boxed(
    const AppChatBubble(
      message: 'Te comparto la ubicación ahora mismo.',
      isMine: true,
      timeLabel: '10:28',
      pending: true,
    ),
  );
}

@UseCase(name: 'No timestamp', type: AppChatBubble, path: _path)
Widget chatBubbleNoTime(BuildContext context) {
  return boxed(
    const AppChatBubble(message: '¡Hola! 👋', isMine: false),
  );
}

@UseCase(name: 'Long message', type: AppChatBubble, path: _path)
Widget chatBubbleLong(BuildContext context) {
  return boxed(
    const AppChatBubble(
      message:
          'El departamento cuenta con dos dormitorios, cocina equipada, agua '
          'caliente, internet incluido y está a sólo cinco minutos caminando '
          'de la universidad. ¿Te gustaría coordinar una visita?',
      isMine: false,
      timeLabel: '10:24',
    ),
  );
}

@UseCase(name: 'Playground', type: AppChatBubble, path: _path)
Widget chatBubblePlayground(BuildContext context) {
  return boxed(
    AppChatBubble(
      message: context.knobs.string(
        label: 'Message',
        initialValue: 'Perfecto, ahí estaré. ¡Gracias!',
        maxLines: 3,
      ),
      isMine: context.knobs.boolean(label: 'Is mine', initialValue: true),
      pending: context.knobs.boolean(label: 'Pending'),
      timeLabel: context.knobs.boolean(label: 'Show time', initialValue: true)
          ? context.knobs.string(label: 'Time', initialValue: '10:27')
          : null,
    ),
  );
}
