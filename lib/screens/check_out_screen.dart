import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';
import 'package:ecommerce_app/widgets/summary_order.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  static const routeName = "/check_out";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckOutScreen());
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 50,
            alignment: Alignment.center,
            color: Colors.black,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text('ORDER NOW',
                    style: Theme.of(context).textTheme.headline3!))),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CUSTOMER INFORMATION',
                style: Theme.of(context).textTheme.headline3),
            _buildTextFormField(emailController, context, 'Email'),
            _buildTextFormField(nameController, context, 'Full Name'),
            Text('DELIVERY INFORMATION',
                style: Theme.of(context).textTheme.headline3),
            _buildTextFormField(addressController, context, 'Address'),
            _buildTextFormField(cityController, context, 'City'),
            _buildTextFormField(countryController, context, 'Country'),
            _buildTextFormField(zipController, context, 'Zip Code'),
            Text('ORDER SUMMARY', style: Theme.of(context).textTheme.headline3),
            OrderSummary(),
          ]),
    );
  }

  Padding _buildTextFormField(TextEditingController controller,
      BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            )),
        Expanded(
            child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ))
      ]),
    );
  }
}
