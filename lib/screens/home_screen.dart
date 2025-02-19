import 'package:flutter/material.dart';
import 'package:hotel_search_app/utils/color_values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String visibleTextDateRange = "dd/mm - dd/mm";
  int roomCount = 0;
  int adultCount = 0;
  int kidsCount = 0;
  int seniorCCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.location_on,
                color: Colors.black,
              ))
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/dp3.png"),
            ),
            Center(
                child: Text(
              "Explore The Views!",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            )),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorValues.white1),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Location...", border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorValues.lightGreen)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: ColorValues.white1,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2025),
                              lastDate: DateTime(2026))
                          .then((selectedRange) {
                        if (selectedRange != null) {
                          var startDD =
                              "${selectedRange.start.day > 9 ? selectedRange.start.day : "0${selectedRange.start.day}"}";
                          var startMM =
                              "${selectedRange.start.month > 9 ? selectedRange.start.month : "0${selectedRange.start.month}"}";
                          var endDD =
                              "${selectedRange.end.day > 9 ? selectedRange.end.day : "0${selectedRange.end.day}"}";
                          var endMM =
                              "${selectedRange.end.month > 9 ? selectedRange.end.month : "0${selectedRange.end.month}"}";
                          visibleTextDateRange =
                              "$startDD/$startMM - $endDD/$endMM";
                        } else {
                          visibleTextDateRange = "dd/mm - dd/mm";
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Choose date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                          visibleTextDateRange,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 2,
                  color: Colors.grey,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (builder) {
                            return AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {});
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "CANCEL",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      setState(() {});
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "DONE",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                              contentPadding: EdgeInsets.all(5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              content: StatefulBuilder(builder:
                                  (BuildContext context,
                                      void Function(void Function()) setState) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Card(
                                      child: ListTile(
                                        onTap: () {},
                                        leading: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                roomCount++;
                                              });
                                            },
                                            icon: Icon(Icons.add)),
                                        title: Text(
                                          "Rooms:$roomCount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (roomCount != 0) {
                                                  roomCount--;
                                                } else {
                                                  roomCount = 0;
                                                }
                                              });
                                            },
                                            icon: Icon(Icons.remove)),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        onTap: () {},
                                        leading: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                adultCount++;
                                              });
                                            },
                                            icon: Icon(Icons.add)),
                                        title: Text(
                                          "Adults:$adultCount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (adultCount != 0) {
                                                  adultCount--;
                                                } else {
                                                  adultCount = 0;
                                                }
                                              });
                                            },
                                            icon: Icon(Icons.remove)),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        onTap: () {},
                                        leading: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                kidsCount++;
                                              });
                                            },
                                            icon: Icon(Icons.add)),
                                        title: Text(
                                          "Kids:$kidsCount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (kidsCount != 0) {
                                                  kidsCount--;
                                                } else {
                                                  kidsCount = 0;
                                                }
                                              });
                                            },
                                            icon: Icon(Icons.remove)),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        onTap: () {},
                                        leading: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                seniorCCount++;
                                              });
                                            },
                                            icon: Icon(Icons.add)),
                                        title: Text(
                                          "Senior Citizen:$seniorCCount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (seniorCCount != 0) {
                                                  seniorCCount--;
                                                } else {
                                                  seniorCCount = 0;
                                                }
                                              });
                                            },
                                            icon: Icon(Icons.remove)),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Number of rooms",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                          "$roomCount R,$adultCount A, $kidsCount K, $seniorCCount SC",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: ColorValues.white1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "500 hotels found",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ),
                        ),
                        PopupMenuButton(
                            elevation: 20,
                            menuPadding: EdgeInsets.all(10),
                            color: ColorValues.white1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            shadowColor: ColorValues.white2,
                            icon: Icon(
                              Icons.filter_list_sharp,
                              color: ColorValues.lightGreen,
                            ),
                            itemBuilder: (_) {
                              return [
                                PopupMenuItem(
                                    value: "rating",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("By Rating"),
                                        Icon(Icons.star),
                                      ],
                                    )),
                                PopupMenuItem(
                                    value: "distance",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("By Distance"),
                                        Icon(Icons.social_distance),
                                      ],
                                    )),
                                PopupMenuItem(
                                    value: "new",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("By New"),
                                        Icon(Icons.new_releases),
                                      ],
                                    )),
                                PopupMenuItem(
                                    value: "price",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("By Price"),
                                        Icon(Icons.social_distance),
                                      ],
                                    ))
                              ];
                            })
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 4,
                          itemExtent: 250,
                          itemBuilder: (_, index) {
                            index++;
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Card(
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 8,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        "assets/hotel$index.jpg",
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                    Positioned.fill(
                                      top: 140,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: ColorValues.white1,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Hotel name",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                Text(
                                                  "3,000/-",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    "City name, State",
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: Colors.red,
                                                        size: 18,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          "5 km to city",
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: List.generate(
                                                      5,
                                                      (i) => Icon(
                                                            i < 4
                                                                ? Icons.star
                                                                : Icons
                                                                    .star_outlined,
                                                            size: 18,
                                                            color: i < 4
                                                                ? ColorValues
                                                                    .lightGreen
                                                                : Colors.grey,
                                                          )),
                                                ),
                                                Text("150 Reviews")
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
