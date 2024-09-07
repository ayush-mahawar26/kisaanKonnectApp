import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/constants/size.config.dart';
import 'package:kisaan_konnect/utils/shared_pref.dart';
import 'package:kisaan_konnect/utils/snackbar.dart';
import 'package:kisaan_konnect/view/auth_view/signup.view.dart';
import 'package:kisaan_konnect/view/home/aboutus.view.dart';
import 'package:kisaan_konnect/view/home/awareness.view.dart';
import 'package:kisaan_konnect/view/home/market.place.dart';
import 'package:kisaan_konnect/view/home/services.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () async {
                bool removed = await SharedPrefService().removeKey('token');
                if (removed) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const SignupView()),
                      (Route<dynamic> route) => false);
                } else {
                  ShowSnackBar(context, 'Error in logout', Colors.red);
                }
              },
              child: const Icon(
                Icons.exit_to_app,
                color: AppColors.white,
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/hamburger.svg",
            color: AppColors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Text(
          "Kissan Konnect",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.accentMain,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Header Menu,
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      child: Icon(
                        Icons.person,
                        size: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: AppSizeConfig.screenWidth / 2,
                          child: Text(
                            "Ayush Mahawar",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(),
                          ),
                        ),
                        Text(
                          "ayushm@gmail.com",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ListTile(
                title: Text(
                  'Services',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                onTap: () {
                  _onItemSelect(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'About us',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                selected: (selectedIndex == 1),
                selectedColor: AppColors.accentMain,
                onTap: () {
                  _onItemSelect(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Awareness',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                selected: (selectedIndex == 2),
                selectedColor: AppColors.accentMain,
                onTap: () {
                  _onItemSelect(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Market Place',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                selected: (selectedIndex == 3),
                selectedColor: AppColors.accentMain,
                onTap: () {
                  _onItemSelect(3);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: (selectedIndex == 0)
          ? const ServiceView()
          : (selectedIndex == 1)
              ? const AboutUsView()
              : (selectedIndex == 2)
                  ? const AwarenessView()
                  : MarketPlaceView(),
    );
  }
}
