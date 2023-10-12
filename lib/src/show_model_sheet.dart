import '../inventory.dart';

class Model_bottom_sheet extends StatelessWidget {
  final tapGallary;

  final pickCamera;

  Model_bottom_sheet(
      {Key? key, required this.tapGallary, required this.pickCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: pickCamera,
                child: Container(
                  width: screenwidth(context, dividedby: 3.2),
                  height: screenheight(context, dividedby: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: Icon(
                    Icons.camera,
                    size: screenheight(context, dividedby: 20),
                  ),
                ),
              ),
              SizedBox(
                height: screenheight(context, dividedby: 50),
              ),
              Text(
                'Pick From Camera',
                style: TextStyle(
                    fontSize: screenheight(context, dividedby: 55),
                    fontWeight: FontWeight.w400,
                    color: Colors.black38),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: tapGallary,
                child: Container(
                  width: screenwidth(context, dividedby: 3.2),
                  height: screenheight(context, dividedby: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: Icon(
                    Icons.photo,
                    size: screenheight(context, dividedby: 20),
                  ),
                ),
              ),
              SizedBox(
                height: screenheight(context, dividedby: 50),
              ),
              Text(
                'Pick From Gallary',
                style: TextStyle(
                    fontSize: screenheight(context, dividedby: 55),
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                    letterSpacing: -0.5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
