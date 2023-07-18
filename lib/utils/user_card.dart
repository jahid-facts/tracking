import 'package:tracking/utils/all_files.dart';


class UserCard extends StatelessWidget {
  final String name;
  final String address;
  final int userCode;
  final bool isActive;
  final String imagePath;
  const UserCard({
    super.key,
    required this.name,
    required this.address,
    required this.userCode,
    required this.isActive,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
            color: Theme.of(context).colorScheme.primary, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          right: 8.0,
          bottom: 8.0,
          left: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: 34.0,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                spaceV(10.0),
                Text(address),
                Text("Code: $userCode"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 75.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "view",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                spaceV(10.0),
                Container(
                  width: 75.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                        : Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          // horizontal: 18.0,
                          // vertical: 4.0
                          ),
                      child: Center(
                        child: Text(
                          isActive ? "Active" : "De-active",
                          style: TextStyle(
                            color: isActive
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
