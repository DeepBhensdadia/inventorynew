import 'package:inventory/inventory.dart';

class CustomColumnRow extends StatelessWidget {
  final String name;
  final String sname;
  final String tag;
  final String tag2;

  const CustomColumnRow(
      {Key? key,
      required this.name,
      required this.sname,
      required this.tag,
      required this.tag2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomColumn(name: tag, sname: name),
        CustomColumn(name: tag2, sname: sname),
      ],
    );
  }
}

class CustomColumn extends StatelessWidget {
  final String name;
  final String sname;

  const CustomColumn({Key? key, required this.name, required this.sname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.purple),
            ),
            Text(
              sname,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
