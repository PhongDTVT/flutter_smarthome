import 'package:home_iot/constants/app_colors.dart';
import 'package:home_iot/model/smart_home_model.dart';
import 'package:home_iot/screen/widgets/control_device/control_device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeviceSwitch extends StatefulWidget{
  const DeviceSwitch({super.key, required this.data, required this.roomData});
  final DeviceInRoom data;
  final SmartHomeModel roomData;
  @override
  State<DeviceSwitch> createState() => _DeviceSwitchSate();
}
class _DeviceSwitchSate extends State<DeviceSwitch> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceInRoom data = this.widget.data;
    final SmartHomeModel roomData = this.widget.roomData;
    final Duration _duration = Duration(milliseconds: 300);
    return GestureDetector(
      onTap: () {
        setState(() {
          data.deviceStatus = !data.deviceStatus;
        });
      },
      child: Container(
        width: size.width*0.42,
        margin:const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.black.withOpacity(.4),
          borderRadius: BorderRadius.circular(30),
        ),
        
        child: Row(
          children: [
            Expanded(

              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  AnimatedPositioned(
                    top: !data.deviceStatus ? 0 : -size.height*0.22/2,
                    duration: _duration,
                    child: Column(
                      children: [
                        _deviceStatus(data),
                        _deviceName(size, data),
                      ],
                    ),
                  ),
                    
                  AnimatedPositioned(
                    bottom: data.deviceStatus ? 0 : -size.height*0.22/2,
                    duration: _duration,
                    child: Column(
                      children: [
                        _deviceStatus(data),
                        _deviceName(size, data),
                      ],
                    ),
                  ),
                    
                  AnimatedPositioned(
                    top: data.deviceStatus ? 0 : (size.height*0.22/2)-10,
                    duration: _duration,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.black,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.black.withOpacity(.2),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Icon(
                        data.deviceStatus ? data.iconOn : data.iconOff,
                        color: AppColor.fgColor,
                        ),
                    ),
                  ),
                    
                ],
              ),
            ),
            Expanded(
              
              child: Container(  
                
                decoration: BoxDecoration(
                  color: AppColor.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ControlDevice(roomData: roomData),
                          ),
                        );
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: AppColor.fgColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _deviceName(Size size, DeviceInRoom data) {
    return Container(
          margin: EdgeInsets.all(8.0),
          width: size.width*0.22-16,
          child: Text(
            data.deviceName,
            textAlign: TextAlign.left,
            maxLines: 2,
            style:const TextStyle(
              color: AppColor.white,
              overflow: TextOverflow.ellipsis,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        );
  }

  Padding _deviceStatus(DeviceInRoom data) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Text(
            data.deviceStatus?"On":"Off",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColor.white,              
              fontWeight: FontWeight.w300,
            ),
            ),
        );
  }
  
}