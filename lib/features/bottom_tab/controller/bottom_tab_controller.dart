import 'package:finx/core/global_controller.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomTabController extends GetxController {
  late PersistentTabController tabController;

  var globalCtr = Get.find<GlobalController>();

  RxInt tabIndex = 0.obs;

  initDependencies() {
    tabController = PersistentTabController(initialIndex: 0);
  }

  @override
  void onInit() {
    super.onInit();

    initDependencies();
  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }

  @override
  void onReady() {
    globalCtr.getUserInfo();
    globalCtr.getAccountInfo();
    globalCtr.fetchBalance();
    super.onReady();
  }
}
