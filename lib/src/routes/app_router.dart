
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:patch_task/src/app/product/presentation/pages/product_page.dart';
import 'package:patch_task/src/routes/app_route_name.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: "/",
        path: AppRouteName.root,
        builder: (context, state) => const ProductPage(),

      ),

    ],
    errorBuilder: (context, state) => const SizedBox(),
  );
}
