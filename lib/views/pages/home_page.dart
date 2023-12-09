import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/category_tab_view/category_cubit.dart';
import 'package:e_commerce/controllers/home_tab_view_cubit/home_cubit.dart';
import 'package:e_commerce/views/widgets/category_tab_view.dart';
import 'package:e_commerce/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/myphotocopy.jpg'),
                      ),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Mohammad',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Let\'s start shopping!',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.grey,
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            AppRoutes.search,
                          );
                        },
                        icon: const Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              TabBar(
                controller: _tabController,
                unselectedLabelColor: AppColor.grey,
                tabs: const [
                  Tab(text: 'Home'),
                  Tab(text: 'Category'),
                ],
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    BlocProvider(
                      create: (context) {
                        final homeCubit = HomeCubit();
                        homeCubit.getHomeData();
                        return homeCubit;
                      },
                      child: const HomeTabView(),
                    ),
                    BlocProvider(
                      create: (context) {
                        final categoryCubit = CategoryCubit();
                        categoryCubit.getCategoryData();
                        return categoryCubit;
                      },
                      child: const CategoryTabView(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
