import '../inventory.dart';

class Company_Deshboard extends StatelessWidget {
  final String categoryname;
  final String verifytag;
  final String tagnumber;
  final String auditedname;

  const Company_Deshboard(
      {Key? key,
      required this.categoryname,
      required this.verifytag,
      required this.tagnumber,
      required this.auditedname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      // height: screenheight(context, dividedby: 15),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(screenheight(context, dividedby: 50)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                'Category',
                style: TextStyle(
                    fontSize: screenheight(context, dividedby: 40),
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
                maxLines: 2,
              ),
              Text(
                categoryname,
                style: TextStyle(
                    fontSize: screenheight(context, dividedby: 35),
                    fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
            ]),
            SizedBox(
              height: screenheight(context, dividedby: 25),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tag',
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 45),
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      maxLines: 2,
                    ),
                    Text(
                      tagnumber,
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 45),
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Physically Verified Tag',
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 45),
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      maxLines: 2,
                    ),
                    Text(
                      verifytag,
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 45),
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Audited  Work Completed',
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 45),
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      maxLines: 2,
                    ),
                    Text(
                      auditedname,
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 45),
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
