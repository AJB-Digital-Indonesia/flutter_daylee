import 'package:flutter/material.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_daylee/widgets/title_widget.dart';
import 'package:flutter_daylee/widgets/search_field.dart';

class ServiceScreen extends StatelessWidget {
  final String service;
  const ServiceScreen({Key? key,
    required this.service
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leading: IconButton(
          icon: const Icon(IconData(0xe094, fontFamily: 'MaterialIcons'),
            color: AppColors.mainColor2,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0.0,
        title: TitleText(text: service,),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
            child: SearchField(hintText: service.substring(0, service.length-2)+"...",),
          ),
        ),
      ),
    );
  }
}
