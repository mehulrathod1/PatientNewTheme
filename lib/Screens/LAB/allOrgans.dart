import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/Screens/LAB/test_available_labs.dart';
import 'package:patient/Screens/LAB/test_by_organs.dart';
import 'package:patient/Utils/colorsandstyles.dart';
import 'package:patient/controller/LabController/lab_profile_controller.dart';
import 'package:patient/controller/NavigationController.dart';
import 'package:patient/widgets/commonAppBarLeading.dart';
import 'package:patient/widgets/common_app_bar_title.dart';
import 'package:patient/widgets/common_button.dart';

class AllOrgans extends StatefulWidget {
  const AllOrgans({Key? key}) : super(key: key);

  @override
  _AllOrgansState createState() => _AllOrgansState();
}

class _AllOrgansState extends State<AllOrgans> {
  LABProfileController _controller = LABProfileController();

  Future initialize() async {
    _controller.allOrgans = await _controller.getallOrgans();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize().then((value) {
      setState(() {
        _controller.organsLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: commonAppBarTitle(),
        backgroundColor: Color(0xffEFEFEF),
        elevation: 0,
        titleSpacing: 0,
        leading: commonAppBarLeading(
            iconData: Icons.arrow_back_ios_new,
            onPressed: () {
              setState(() {
                Pop(context);
              });
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Organs',
                style: GoogleFonts.montserrat(
                    color: appBlackColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            (_controller.organsLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _controller.allOrgans.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(2, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 170,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _controller.allOrgans.data[index]
                                                  .organName
                                                  .toUpperCase(),
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: appBlackColor),
                                            ),
                                            // Text(
                                            //     (_controller
                                            //         .allTests
                                            //         .data[index]
                                            //         .testDescription
                                            //         .length >=
                                            //         150)
                                            //         ? _controller
                                            //         .allTests
                                            //         .data[index]
                                            //         .testDescription
                                            //         .substring(0, 100) +
                                            //         '...'
                                            //         : _controller
                                            //         .allTests
                                            //         .data[index]
                                            //         .testDescription,
                                            //     style: GoogleFonts.montserrat(
                                            //         fontSize: 10)),
                                            // Text(
                                            //   '₹ 199',
                                            //   style: GoogleFonts.montserrat(
                                            //       fontWeight: FontWeight.bold,
                                            //       fontSize: 16),
                                            // ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 4),
                                              child: commonBtn(
                                                borderRadius: 5,
                                                // width: 100,

                                                s: 'Book Now',
                                                textSize: 12,
                                                bgcolor: appBlackColor,
                                                textColor: Colors.white,
                                                onPressed: () {
                                                  Push(
                                                      context,
                                                      TestsByOrgan(
                                                          organid: _controller
                                                              .allOrgans
                                                              .data[index]
                                                              .organId));
                                                },
                                                height: 30,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15)),
                                            image: DecorationImage(
                                                image: NetworkImage(_controller
                                                    .allOrgans
                                                    .data[index]
                                                    .image),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
            SizedBox(
              height: navbarht + 20,
            ),
          ],
        ),
      ),
    );
  }
}
