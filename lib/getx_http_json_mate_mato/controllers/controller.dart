import 'package:get/state_manager.dart';
import 'package:getx_app/getx_http_json_mate_mato/models/model.dart';
import 'package:getx_app/getx_http_json_mate_mato/services/api_service.dart';

class AlbumController extends GetxController {
  var isLoading = true.obs;
  var albumList = <Album>[].obs;

  @override
  void onInit() {
    fetchAlbum();
    super.onInit();
  }

  void fetchAlbum() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchAlbum();
      if (products != null) {
        albumList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
