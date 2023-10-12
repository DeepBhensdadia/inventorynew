import '../inventory.dart';

class Drawer_Widget extends StatelessWidget {
  final String name;

  final onTap;

  const Drawer_Widget({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.shade600.withOpacity(0.2),
          //       blurRadius: 5,
          //       spreadRadius: 0.5,
          //       offset: Offset(1, 1)),
          // ],
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
        ),
        // height: screenheight(context, dividedby: 10),
        // width: screenwidth(context, dividedby: 2.5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenheight(context, dividedby: 40),
                  vertical: screenheight(context, dividedby: 50)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 40),
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      maxLines: 2,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )
                  ]),
            ),
            const Divider(
              indent: 18,
              endIndent: 18,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
