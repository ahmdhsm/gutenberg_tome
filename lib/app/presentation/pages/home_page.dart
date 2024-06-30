import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg_tome/app/presentation/fragments/book_list_content.dart';
import 'package:gutenberg_tome/app/presentation/fragments/favorite_book_content.dart';
import 'package:gutenberg_tome/core/style/app_color.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  int currentIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (wantKeepAlive) {
      super.build(context);
    }

    return Scaffold(
      backgroundColor: AppColor.background,
      body: TabBarView(
        controller: _tabController,
        children: const [
          BookListContent(),
          FavoriteBookContent(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.buttonBackground,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: AppColor.buttonText,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColor.buttonText,
        ),
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          if (value != _tabController.index) {
            _tabController.animateTo(value);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: '',
            activeIcon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
