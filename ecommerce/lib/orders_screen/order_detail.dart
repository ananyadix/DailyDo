import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/orders_screen/components/order_status.dart';
import 'package:ecommerce/orders_screen/order_place_details.dart';

class OrderDetail extends StatelessWidget {
  final dynamic data;
  const OrderDetail({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order Details", style: TextStyle(color: Colors.white)),
          elevation: 0,
          backgroundColor: Colors.yellow,
        ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              orderStatus(Icons.done,Colors.red,"Placed",data['order_placed']),
              orderStatus(Icons.thumb_up_alt_outlined,Colors.orange,"Confirmed",data['order_confirmed']),
              orderStatus(Icons.delivery_dining,Colors.blueAccent,"On Delivery",data['order_on_delivery']),
              orderStatus(Icons.cabin,Colors.green,"Delivered",data['order_delivered']),
              Divider(),
              10.heightBox,
              orderPlaceDetail("Order Code","Shipping Method",data["order_code"],data["shipping method"]),
              orderPlaceDetail("Order Date","Payment Method",data["order_date"].toDate(),data["payment_method"]),
              orderPlaceDetail("Delivery Status","Payment Status","Order Placed","Unpaid"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Shipping Address".text.bold.make(),
                        "${data["order_by_address"]}".text.color(Colors.grey).make(),
                        "${data["order_by_city"]}".text.color(Colors.grey).make(),
                        "${data["order_by_state"]}".text.color(Colors.grey).make(),
                        "${data["order_by_pin"]}".text.color(Colors.grey).make()
                      ],
                    ),
                    SizedBox(
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Total Amount".text.bold.make(),
                          "${data["total_amount"]} Rs".text.color(Colors.grey).make()
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Divider(),
              10.heightBox,
              "Ordered Product".text.bold.size(16).makeCentered(),
              ListView(
                shrinkWrap: true,
                children: List.generate(data["orders"].length, (index){
                  return orderPlaceDetail("Prdoduct","Quantity",data['orders'][index]['title'],data['orders'][index]['qty']);
              },
              ).toList()),
              Divider(),
              10.heightBox,

            ],
          ),
        ),
      ),
    );
  }
}
