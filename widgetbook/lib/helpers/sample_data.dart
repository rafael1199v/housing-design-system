import 'package:flutter/material.dart';
import 'package:housing_design_system/housing_design_system.dart';

ImageProvider get sampleRoomImage =>
    const NetworkImage('https://picsum.photos/seed/housing-room/640/420');

const List<AppDropdownItem<String>> sampleCityItems = [
  AppDropdownItem(value: 'cbba', label: 'Cochabamba'),
  AppDropdownItem(value: 'lpz', label: 'La Paz'),
  AppDropdownItem(value: 'scz', label: 'Santa Cruz'),
  AppDropdownItem(value: 'sre', label: 'Sucre'),
];

class SampleMessage {
  const SampleMessage(
    this.text,
    this.isMine,
    this.time, {
    this.pending = false,
  });

  final String text;
  final bool isMine;
  final String time;
  final bool pending;
}

const List<SampleMessage> sampleThread = [
  SampleMessage('Hola, ¿el departamento sigue disponible?', false, '10:24'),
  SampleMessage('¡Hola! Sí, sigue disponible 😊', true, '10:25'),
  SampleMessage('¿Podría visitarlo mañana por la tarde?', false, '10:26'),
  SampleMessage('Claro, a las 16:00 me viene bien.', true, '10:27'),
  SampleMessage('Perfecto, ahí estaré. ¡Muchas gracias!', false, '10:28'),
  SampleMessage('Te comparto la ubicación ahora mismo.', true, '10:28',
      pending: true),
];

class SampleChat {
  const SampleChat(this.name, this.lastMessage, this.time, this.unread);

  final String name;
  final String lastMessage;
  final String time;
  final int unread;
}

const List<SampleChat> sampleInbox = [
  SampleChat('María Fernández', 'Perfecto, ahí estaré. ¡Gracias!', '10:28', 2),
  SampleChat('Carlos Rojas', 'Te comparto la ubicación.', '09:50', 0),
  SampleChat('Depto. Av. América', '¿Sigue disponible?', 'Ayer', 5),
  SampleChat('Ana Gutiérrez', 'Nos vemos el lunes.', 'Lun', 0),
];

const List<AppBottomNavDestination> sampleNavDestinations = [
  AppBottomNavDestination(
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
    label: 'Inicio',
  ),
  AppBottomNavDestination(
    icon: Icons.search_outlined,
    selectedIcon: Icons.search_rounded,
    label: 'Buscar',
  ),
  AppBottomNavDestination(
    icon: Icons.chat_bubble_outline,
    selectedIcon: Icons.chat_bubble_rounded,
    label: 'Mensajes',
  ),
  AppBottomNavDestination(
    icon: Icons.person_outline,
    selectedIcon: Icons.person_rounded,
    label: 'Perfil',
  ),
];
