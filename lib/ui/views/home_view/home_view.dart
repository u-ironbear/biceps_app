import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:biceps_app/ui/views/home_view/home_viewmodel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.currentTitle),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: kPrimaryDarkGrey,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      verticalSpaceExtraLarge,
                      GestureDetector(
                        onTap: model.setUserAvatar,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(model.user.avatar),
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        model.user.name,
                        style: kDrawerText,
                      ),
                      verticalSpaceTiny,
                      Text(
                        model.user.email,
                        style: kDrawerText,
                      ),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 40,
                    left: 15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(MdiIcons.tapeMeasure),
                        title: Text('Добавить замеры'),
                        onTap: null,
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.armFlexOutline),
                        title: Text('Добавить результаты'),
                        onTap: null,
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.fileChartOutline),
                        title: Text('Смотреть статистику'),
                        onTap: null,
                      ),
                      spacedDividerSmall,
                      ListTile(
                        leading: Icon(MdiIcons.cogOutline),
                        title: Text('Настройки'),
                        onTap: null,
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.informationOutline),
                        title: Text('О приложении'),
                        onTap: null,
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.creditCardOutline),
                        title: Text('Купить PRO-версию'),
                        onTap: null,
                      ),
                      spacedDividerMedium,
                      ListTile(
                        leading: Icon(MdiIcons.logoutVariant),
                        title: Text(
                          'Выйти',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: model.logOut,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: model.currentView,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryAccent,
          unselectedItemColor: Colors.black38,
          onTap: model.setCurrentView,
          items: [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.textBoxOutline),
              title: Text('Читать'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.calculator),
              title: Text('Считать'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.calendarEdit),
              title: Text('Дневник'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.weightLifter),
              title: Text('Упражнения'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.fileMultipleOutline),
              title: Text('Программы'),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getCurrentUser(),
    );
  }
}
