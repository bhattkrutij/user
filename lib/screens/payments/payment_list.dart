import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/payment_option_item.dart';
import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../widgets/text.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  int _selected = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: paymentOptionsItems.length,
        itemBuilder: (context, index) {
          PaymentItem item = paymentOptionsItems[index];
          return Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: Diamentions.screenWidth / 4,
                  right: Diamentions.width20,
                  top: Diamentions.width10,
                  bottom: Diamentions.width10),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selected = index;
                        print("_seelected::${_selected}");
                      });
                    },
                    child: Container(
                      height: Diamentions.width30,
                      width: Diamentions.width30,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Padding(
                        //this padding will be you border size
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              backgroundColor: _selected == index
                                  ? ColorsHelper.blackColor
                                  : ColorsHelper.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // child: CircleAvatar(
                    //
                    //   radius: 15,
                    //   backgroundColor: Colors.black,
                    //   child: CircleAvatar(
                    //     backgroundColor: _selected == index!
                    //         ? ColorsHelper.blackColor
                    //         : ColorsHelper.whiteColor,
                    //     radius: 13,
                    //   ),
                    // ),
                  ),
                  Positioned(
                    left: Diamentions.width50,
                    top: 0,
                    bottom: 0,
                    child: Icon(
                      item.getIcon(),
                      size: Diamentions.width20,
                    ),
                  ),
                  Positioned(
                    left: Diamentions.width100,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: CustomText(
                        title: paymentOptionsItems[index].getTitle(),
                        fontSize: 16,
                        fontColor: ColorsHelper.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
