import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg_tome/app/domain/entities/book_entity.dart';
import 'package:gutenberg_tome/app/presentation/pages/bloc_provider_page.dart';
import 'package:gutenberg_tome/app/presentation/pages/detail_page.dart';
import 'package:gutenberg_tome/app/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: BlocProviderRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: DetailRoute.page),
          ],
        ),
      ];
}
