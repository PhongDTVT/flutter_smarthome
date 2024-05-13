import 'package:home_iot/constants/app_colors.dart';
import 'package:home_iot/model/smart_home_model.dart';
import 'package:home_iot/screen/widgets/device_switch.dart';
import 'package:home_iot/screen/widgets/glass_morphism.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomControlScreen extends StatefulWidget {
  const RoomControlScreen({super.key, required this.roomData});
  final SmartHomeModel roomData;

  @override
  State<RoomControlScreen> createState() => _RoomControlScreenState();
}

class _RoomControlScreenState extends State<RoomControlScreen> {
  @override
  Widget build(BuildContext context) {
  final SmartHomeModel roomData = this.widget.roomData;
  final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(roomData.roomImage),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.fgColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.white,
                          ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.fgColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: AppColor.white,
                        ),
                    ),
                  ],
                ),
              ),
            ),
            bottomCard(size,roomData),
          ],
        ),
      ),
    );
  }

  Widget bottomCard(Size size, SmartHomeModel roomData) {
    return GlassMorphism(
      child: Container(
        width: double.infinity,
        height: size.height*0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomData.roomName,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(
                      height: 30,
                      child: FittedBox(
                        child: CupertinoSwitch(
                          value: roomData.roomStatus,
                          activeColor: AppColor.white,
                          trackColor: AppColor.black,
                          thumbColor: AppColor.fgColor,
                          onChanged: (value) {
                            setState(() {
                              roomData.roomStatus = value;
                            });
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 60),
              child: Text.rich(TextSpan(
                text: "Your Room Status",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                ),
                children: [
                  // TextSpan(text: roomData.roomName),
                  // const TextSpan(text: " is connected with "),
                  // TextSpan(text: roomData.devices!.length.toString()),
                  // const TextSpan(text: " \n "),
                  // TextSpan(
                  //   text: '${roomData.userAccess} users ',
                  //   style: TextStyle(
                  //     decoration: TextDecoration.underline,
                  //   ),
                  // ),
                  // const TextSpan(text: " have access for "),
                  // TextSpan(text: roomData.roomName),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    roomData.roomTemperature,
                    style:const TextStyle(
                      fontSize: 30,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.wb_cloudy),
                  SizedBox(width: 20,),

                  Text(
                    roomData.roomHuminity,
                    style:const TextStyle(
                      fontSize: 30,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.wb_sunny),
                ],
              ),
            ),
            Divider(
              color: AppColor.white.withOpacity(0.5),
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  'Devices : 4 devices is on',
                  style:const TextStyle(
                    fontSize: 25,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                
                ],
              ),

            ),
            SizedBox(height: 15,),
            SizedBox(
              height: size.height*0.22,
              child: ListView.builder(
                itemCount: roomData.devices!.length+2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) {
                  if(index == 0 || roomData.devices!.length+1==index){
                    return SizedBox(
                      width: 10,
                    );

                  }
                  final data = roomData.devices![index-1];
                  return DeviceSwitch(data: data,roomData: roomData);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}