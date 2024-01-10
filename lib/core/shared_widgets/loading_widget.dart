import 'package:finx/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitSpinningLines(
        size: 50,
        controller: _animationController,
        duration: const Duration(milliseconds: 2000),
        color: AppColor.primaryColor,
      ),
    );
  }
}

Future<void> showLoading(BuildContext context) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        contentPadding: const EdgeInsets.all(20),
        backgroundColor: AppColor.whiteColor,
        content: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.whiteColor,
          elevation: 0,
          child: Wrap(
            children: <Widget>[
              SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 15.h,
                        ),
                        child: const LoadingPage(),
                      ),
                      Text(
                        'Loading...',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primaryColor),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
