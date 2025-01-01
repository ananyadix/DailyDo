import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/list.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.white70,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.black,
                  focusColor: Colors.yellowAccent,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search anything...",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellowAccent)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            10.heightBox,
            VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 150,
              enlargeCenterPage: true,
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    brands[index],
                    fit: BoxFit.fitWidth,
                  ),
                )
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .margin(const EdgeInsets.symmetric(horizontal: 8))
                    .make(); // Complete the VelocityX chain
              },
            )
          ],
        ),
      ),
    );
  }
}
