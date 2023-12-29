import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/location_page_cubit/location_cubit.dart';
import 'package:e_commerce/controllers/payment_cubit/payment_cubit.dart';
import 'package:e_commerce/controllers/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/controllers/search_page_cubit/search_cubit.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/views/pages/custom_bottom_navbar.dart';
import 'package:e_commerce/views/pages/location_chooes_page.dart';
import 'package:e_commerce/views/pages/my_orders_page.dart';
import 'package:e_commerce/views/pages/payment_page.dart';
import 'package:e_commerce/views/pages/product_details_page.dart';
import 'package:e_commerce/views/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );
      case AppRoutes.details:
        final ProductItemModel productItem =
            settings.arguments as ProductItemModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(productItem);
              return cubit;
            },
            child: ProductDetailsPage(),
          ),
          settings: settings,
        );
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final searchCubit = SearchCubit();
              searchCubit.getSearchPageData();
              return searchCubit;
            },
            child: const SearchPage(),
          ),
          settings: settings,
        );
      case AppRoutes.ordersPage:
        return MaterialPageRoute(
          builder: (_) => const MyOrderPage(),
          settings: settings,
        );
      case AppRoutes.paymentPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = PaymentCubit();
              cubit.getPaymentData();
              return cubit;
            },
            child: const PaymentPage(),
          ),
          settings: settings,
        );
      case AppRoutes.locationPage:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) {
              final cubit=LocationCubit();
              cubit.getLocationData();
              return cubit;
            },
            child:const LocationChoosePage(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );
    }
  }
}
