import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/app_sharedPreferences.dart';

String AVATARKEY = "avatar";

class PersonalHomepageController extends GetxController {
  RxBool isHaveLocalAvatar = false.obs; //目前没有后台网络数据，临时用的
  RxString avatarPath = "".obs;

  final ImagePicker picker = ImagePicker();
  // XFile? xFile;

  @override
  void onInit() {
    super.onInit();
    judgeLocalAvatarInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///判断并取
  void judgeLocalAvatarInfo() async {
    String str = await getAvatarInfo();
    isHaveLocalAvatar.value = str != "" ? true : false;
    avatarPath.value = str;
    update();
  }

  ///存path
  void savePhotoToLocal(String path) async {
    await setAvatarInfo(path);
    avatarPath.value = path;
    isHaveLocalAvatar.value = true;
    update();
  }

  ///----本地存储
  ///存储头像信息
  static setAvatarInfo(String avatarInfo) async {
    await DoSharedPreferences.setData(AVATARKEY, avatarInfo);
  }

  ///获取本地的头像信息
  static Future<String> getAvatarInfo() async {
    var data = await DoSharedPreferences.getData(AVATARKEY);
    if (data != null && data != "") {
      return data;
    } else {
      return "";
    }
  }

  ///移除头像信息
  static removeAvatarInfo() async {
    await DoSharedPreferences.removeData(AVATARKEY);
  }
}
