
import 'package:home_iot/constants/app_colors.dart';
import 'package:home_iot/model/smart_home_model.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class ControlDevice extends StatefulWidget {
  const ControlDevice({super.key, required this.roomData});
  final SmartHomeModel roomData;
  @override
  State<ControlDevice> createState() => _ControlDeviceState();
}

class _ControlDeviceState extends State<ControlDevice>{
  var _value = 0.0;
  @override
  Widget build(BuildContext context) {
    final SmartHomeModel roomData = this.widget.roomData;
    final size = MediaQuery.of(context).size;
    final gradient = [AppColor.fgColor,AppColor.white]; 
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(roomData.roomImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            topAppBar(),
            SizedBox(height: 24),
            slider(),
            SizedBox(height: 30),
            Text(
              'Fan speed',
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 5),
            Slider(
              value: _value,
              min: 0.0,
              max: 4.0,
              divisions: 4,
              activeColor: AppColor.white,
              inactiveColor: AppColor.black,
              onChanged: (newValue){
                setState(() {
                  _value = newValue;
                });
              },
              label: _value.toString(),
            ),


            Container(
              padding: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.width*0.4+32,
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: <Widget>[
                  ClayContainer(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: AppColor.fgColor,
                  borderRadius: 12,
                  child: Center(
                    child: Icon(Icons.power_settings_new,
                        color: AppColor.black, size: 70),
                  ),
                ),

                  MenuItem(iconName: Icons.wb_sunny,),
                  MenuItem(iconName: Icons.settings),
                  MenuItem(iconName: Icons.data_usage),
                  MenuItem(iconName: Icons.assessment),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  
  mode(){
    return ClayContainer(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width*0.2,
      color: AppColor.fgColor,
      borderRadius: 30,
      child: Center(
        child: Icon(
          Icons.power_settings_new,
          color: AppColor.white,
          size: 50,
        ),
      ),
    );
  }

  topAppBar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClayContainer(
            height: 40,
            width: 50,
            borderRadius: 10,
            color: AppColor.fgColor,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new,size: 20,),
                  color: AppColor.white,
                  onPressed: () { 
                    Navigator.pop(context);
                  },
                  ),
              ),
            ),
          ),
          listItem(),
          ClayContainer(
          ),
        ],
      ),
    );
  }
  
  listItem() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ClayContainer(
        height: 80,
        width: MediaQuery.of(context).size.width*0.6,
        borderRadius: 20,
        color: AppColor.fgColor,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                AppColor.fgColor,
                AppColor.white
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ListTile(
              leading: Icon(
                Icons.tablet,
                color: AppColor.white,
                size: 34,
                ),
                title: Text(
                  'Air Condittion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
  
  slider() {
    return ClayContainer(
      
      width: 200,
      height: 200,
      color: AppColor.fgColor.withOpacity(0.0002),
      borderRadius: 200,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: SleekCircularSlider(
          initialValue: 10,
          min: 10,
          max: 30,
          
          appearance: CircularSliderAppearance(
            
            customColors: CustomSliderColors(
              progressBarColors: AppColor.gradient,
              hideShadow: true,
              shadowColor: Colors.transparent,
            ),
            infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(
                color: AppColor.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),

              modifier: (double value) {
                final roundedValue = value.ceil().toInt().toString();
                return '$roundedValue \u2103';
              }
            ),
          ),
        onChange: (double value){
          print(value);
        },
        ),
      ),
    );
  }
  
}

class MenuItem extends StatefulWidget {
  final IconData iconName;

  const MenuItem({super.key, required this.iconName});
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: ClayContainer(
        height: MediaQuery.of(context).size.width * 1 / 7,
        width: MediaQuery.of(context).size.width * 1 / 7,
        borderRadius: 10,
        color: AppColor.fgColor,
        surfaceColor: isSelected ? AppColor.black : AppColor.white.withOpacity(0.2),
        child: Icon(widget.iconName, color: Colors.white, size: 20),
      ),
    );
  }
}