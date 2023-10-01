import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/data/source/api/my_api.dart';
import 'package:wallpaper/di/di.dart';
import 'package:wallpaper/presetation/screens/home/bloc/home_bloc.dart';
import 'package:wallpaper/presetation/shimmer/shimmer_component.dart';
import 'package:wallpaper/presetation/widgets/widget_for_homescreen.dart';
import 'package:wallpaper/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc(MyApi());

  @override
  void initState() {
    bloc.add(LoadDataHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          children: [
            AppBar(
              toolbarHeight: hg(context) * 0.1,
              backgroundColor: Colors.blue,
              title: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Wallpaper",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: wd(context) * 0.08,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.30,
                    ),
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                if (state.resultList.isEmpty) {
                  return const ShimmerComponent();
                }
                return Container(
                  height: hg(context) * 0.7867,
                  width: wd(context),
                  color: Colors.blue.withOpacity(0.2),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.resultList.length,
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: i == 0 ? wd(context) * 0.06 : wd(context) * 0.04,
                            top: wd(context) * 0.04,
                          bottom: wd(context) * 0.04,
                        ),
                        child: widgetForHomeScreen(
                          context,
                              () {
                            bloc.add(ClickHeartHomeScreen(productItem: state.resultList[i]));
                            setState(() {});
                          },
                          state.resultList[i],
                        ),
                      );
                    },
                  ),
                );
              }
            ),
          ],
        );
      },
    );
  }
}
