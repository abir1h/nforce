// import 'dart:async';
//
// // import 'package:ably_flutter/ably_flutter.dart' as ably;
// import 'package:get/get.dart';
// import 'dart:developer' as developer show log;
//
// import 'package:nuforce/app/utils/app_states.dart';
// import 'package:nuforce/app/utils/colors.dart';
//
// class AblyConfig {
//   final clientOptions = ably.ClientOptions(key: 'g-NUhQ.Gf2RXw:dGXWAt4k92bfT7weBpVhIEakemBhWo8T_A3HUtP9SCY');
//   Future<void> connect() async {
//     ably.Realtime realtime = ably.Realtime(options: clientOptions);
//
//     realtime.connection.on(ably.ConnectionEvent.connected).listen(
//       (ably.ConnectionStateChange stateChange) async {
//         developer.log('Connected to Ably. Current State: ${stateChange.current}', name: 'ably');
//       },
//     );
//
//     late final AppState appState;
//     if (Get.isRegistered<AppState>()) {
//       appState = Get.find<AppState>();
//     } else {
//       throw Exception('No AppState found. Please register AppState before using AblyConfig.');
//     }
//
//     final businessId = appState.user?.businessId;
//     if (businessId == null) {
//       throw Exception('No businessId found in AppState. Please set businessId before using AblyConfig.');
//     }
//
//     final businessChannelId = 'business:${appState.user?.businessId}';
//     developer.log('Connecting to channel: $businessChannelId', name: 'ably');
//
//     ably.RealtimeChannel channel = realtime.channels.get(businessChannelId);
//     await channel.attach();
//     channel.on().listen((ably.ChannelStateChange stateChange) {
//       developer.log('Event received: ${stateChange.event.name}', name: 'ably');
//     });
//
//     channel.subscribe().listen((ably.Message message) {
//       developer.log('Message received: ${message.data}', name: 'ably');
//       Get.snackbar(
//         'Message Received',
//         message.data.toString(),
//         backgroundColor: AppColors.primaryBlue1.withOpacity(0.6),
//         colorText: AppColors.white1,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     });
//   }
//
//   Future<void> disconnect() async {
//     ably.Realtime realtime = ably.Realtime(options: clientOptions);
//     await realtime.close();
//   }
// }
