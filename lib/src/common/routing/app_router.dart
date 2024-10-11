// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../feature/home/arena_details_page.dart';
// import '../../feature/otp/otp_input_page.dart';
// import '../../setup.dart';
// import 'app_route_name.dart';
//
// @immutable
// class AppRouter {
//   factory AppRouter() => _router;
//
//   const AppRouter._internal();
//
//   static const AppRouter _router = AppRouter._internal();
//
//   static final GoRouter router = GoRouter(
//     initialLocation: token == null ? AppRouteName.splashPage : AppRouteName.homePage,
//     // initialLocation: AppRouteName.splashPage,
//     debugLogDiagnostics: true,
//     routes: <RouteBase>[
//       GoRoute(
//         name: "InitialPage",
//         path: AppRouteName.splashPage,
//         builder: (BuildContext context, GoRouterState state) {
//           return const SplashScreen();
//         },
//       ),
//       ShellRoute(
//         builder: (BuildContext context, GoRouterState state, Widget child) {
//           return MainWrapper(child: child);
//         },
//         routes: <RouteBase>[
//           GoRoute(
//             name: "HomePage",
//             path: AppRouteName.homePage,
//             builder: (BuildContext context, GoRouterState state) {
//               return const HomePage();
//             },
//             routes: [
//               GoRoute(
//                 name: "ArenaDetailsPage",
//                 path: AppRouteName.arenaDetailsPage,
//                 builder: (BuildContext context, GoRouterState state) {
//                   final Arena? arena = state.extra as Arena?;
//                   if (arena != null) {
//                     log('Navigating to ArenaDetailsPage with arena: ${arena.name}');
//                   } else {
//                     log('Arena object is null');
//                   }
//                   return ArenaDetailsPage(currentArena: arena!);
//                 },
//               ),
//             ],
//           ),
//           GoRoute(
//             name: "FavPage",
//             path: AppRouteName.favPage,
//             builder: (BuildContext context, GoRouterState state) {
//               return const FavouritesPage();
//             },
//           ),
//           GoRoute(
//             name: "ProfilePage",
//             path: AppRouteName.profilePage,
//             builder: (BuildContext context, GoRouterState state) {
//               return const ProfilePage();
//             },
//           ),
//         ],
//       ),
//       GoRoute(
//         name: "OtpPage",
//         path: AppRouteName.otpPage,
//         builder: (BuildContext context, GoRouterState state) {
//           return const OtpPage();
//         },
//         routes: [
//           GoRoute(
//             name: "OtpInputPage",
//             path: AppRouteName.otpInputPage,
//             builder: (BuildContext context, GoRouterState state) {
//               return const OtpInputPage();
//             },
//           ),
//         ],
//       ),
//     ],
//   );
// }
//
// //
// // @immutable
// // final class BlockedRouter {
// //   factory BlockedRouter() => _router;
// //
// //   const BlockedRouter._internal();
// //
// //   static const BlockedRouter _router = BlockedRouter._internal();
// //
// //   static final GoRouter router = GoRouter(
// //     initialLocation: AppRouteName.blockedPage,
// //     debugLogDiagnostics: true,
// //     routes: <RouteBase>[
// //       GoRoute(
// //         name: "BlockedPage",
// //         path: AppRouteName.blockedPage,
// //         builder: (BuildContext context, GoRouterState state) {
// //           return const Scaffold(
// //             body: Center(
// //               child: Text("App is permanently blocked !!!"),
// //             ),
// //           );
// //         },
// //       ),
// //     ],
// //   );
// // }
