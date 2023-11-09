import 'package:tracking/utils/importer.dart';

Widget verticalSpace({double height = 0.025}) {
  return SizedBox(
    height: getScreenHeight() * height,
  );
}

Widget horizontalSpace({double width = 0.2}) {
  return SizedBox(
    width: getScreenWidth() * width,
  );
}
