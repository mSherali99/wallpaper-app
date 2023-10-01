import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/presetation/screens/saved/bloc/saved_bloc.dart';

import '../../../utils/utils.dart';
import '../../widgets/widget_for_homescreen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  final bloc = SavedBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(LoadDataSavedScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
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
            Container(
              height: hg(context) * 0.7867,
              width: wd(context),
              color: Colors.blue.withOpacity(0.2),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.savedItemList.length,
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
                        bloc.add(ClickHeartSavedScreen(productItem: state.savedItemList[i]));
                        setState(() {});
                          },
                      state.savedItemList[i],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
