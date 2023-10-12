import '../inventory.dart';

class Contect_Screen extends StatelessWidget {
  const Contect_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenheight(context, dividedby: 17)),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
              // Container(
              //   width: 100,
              //   child: Image(
              //     image: AssetImage('assets/images/logo.png'),
              //   ),
              // ),
              SizedBox(width: screenheight(context, dividedby: 17)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: screenheight(context, dividedby: 4)),
                  Text(
                    'Company Co',
                    style: TextStyle(
                        fontSize: screenheight(context, dividedby: 35),
                        fontFamily: 'gilroy.bold'),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.purple,
                        width: 3,
                      ),
                    )),
                    child: Text(
                      'ntect',
                      style: TextStyle(
                        fontSize: screenheight(context, dividedby: 37),
                        fontFamily: 'gilroy.bold',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenheight(context, dividedby: 35)),
          const SizedBox(
            width: 200,
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          SizedBox(
            height: screenheight(context, dividedby: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                const Icon(
                  Icons.home_outlined,
                  size: 40,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: screenwidth(context, dividedby: 10),
                ),
                const Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    '94-95, Om Tower-2  Sheetala Mata Road  Gurgaon-122001',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                const Icon(
                  Icons.phone_android_sharp,
                  size: 40,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: screenwidth(context, dividedby: 10),
                ),
                const Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    '+124 4251675 \n  Mon to Fri 9am to 6pm',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                const Icon(
                  Icons.email_outlined,
                  size: 40,
                  color: Colors.purple,
                ),
                SizedBox(
                  width: screenwidth(context, dividedby: 10),
                ),
                const Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    'info@tagmyassets.com \n Send us your query anytime!',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
