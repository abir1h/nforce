import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final XFile? pickedImage = await picker.pickImage(
    source: source,
    preferredCameraDevice: CameraDevice.front,
  );
  return pickedImage;
}
