import 'package:ecommerce/consts/consts.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is empty".text.color(Colors.grey).makeCentered(),
    );
  }
}
