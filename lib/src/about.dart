import '../inventory.dart';

class About_Screen extends StatefulWidget {
  const About_Screen({Key? key}) : super(key: key);

  @override
  State<About_Screen> createState() => _About_ScreenState();
}

class _About_ScreenState extends State<About_Screen> {
  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenheight(context, dividedby: 17)),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Container(
                  width: 100,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                textAlign: TextAlign.justify,
                'Tag Savvy Pvt. Ltd is a trustworthy asset management partner for your fixed assets as well as financial statements. We began our journey in the year 2017 and soon became one of the most reliable asset management and tagging service providers for Delhi NCR. With over 20 + years of technical experience in this industry and clients that span across public and private industries, we are one of the leading organizations in the field of asset management solutions. Our focus is not just to meet but to exceed our customers’ expectations.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'We work with the latest technology available for helping organizations of all sizes manage and maintain their assets including fleets, facilities, consumables, equipment, property and infrastructure efficiently and cost-effectively. Our services can help your organization increase efficiency, improve data transparency, and reduce overall costs',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Our Mission',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25, fontFamily: 'gilroy.bold'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tag Savvy has solutions that cater to the needs of companies with a few hundred to those with millions of assets in a variety of industries including Manufacturing, IT, Banks and Financial Services, pharmaceuticals, chemicals, Cosmetics, Media, and Start-ups.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Our Vision ',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 25, fontFamily: 'gilroy.bold'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'To provide techno-oriented solution for verification of most valuable assets of an organization which will help in better control and proper Valuation.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
