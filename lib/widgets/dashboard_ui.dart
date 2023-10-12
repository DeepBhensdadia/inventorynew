import '../inventory.dart';

class DashboardUI extends StatelessWidget {
  final String name;
  final String qantity;

  const DashboardUI({Key? key, required this.name, required this.qantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(1, 1)),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          // height: screenheight(context, dividedby: 10),
          // width: screenwidth(context, dividedby: 2.5),
          child: Padding(
            padding: EdgeInsets.all(screenheight(context, dividedby: 50)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: screenheight(context, dividedby: 50),
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                    maxLines: 2,
                  ),
                  Text(
                    qantity,
                    style: TextStyle(
                        fontSize: screenheight(context, dividedby: 40),
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
