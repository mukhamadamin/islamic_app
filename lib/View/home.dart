import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/View/fav_screen.dart';
import 'package:islamic_app/provider/fav_provider.dart';
import 'package:islamic_app/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontroller = TextEditingController();

  final List<String> items = [
    'Angry'.tr(),
    'Anxious'.tr(),
    'Bored'.tr(),
    'Confident'.tr(),
    'Confused'.tr(),
    'Content'.tr(),
    'Depressed'.tr(),
    'Doubtful'.tr(),
    'Grateful'.tr(),
    'Greedy'.tr(),
    'Guilty'.tr(),
    'Happy'.tr(),
    'Hurt'.tr(),
    'Rage'.tr(),
    'Indecisive'.tr(),
    'Jealous'.tr(),
    'Lazy'.tr(),
    'Lonely'.tr(),
    'Lost'.tr(),
    'Nervous'.tr(),
    'Uneasy'.tr(),
    'Regret'.tr(),
    'Sad'.tr(),
    'Scared'.tr(),
    // Add more items as needed
  ];
  final List<String> duas = [
    'My Lord, I seek protection with You from the promptings of the devils; and I seek protection in You, my Lord, from their coming near me. (23:97-98).'.tr(),
    'Allah is sufficient for me. There is no god worthy of worship except Him. I have placed my trust in Him only and He is the Lord of the Magnificent Throne.'.tr(),
    'My Lord, truly I am in dire need of any good which You may send me. (28:24)'.tr(),
    'My Lord, enable me to be grateful for Your favour which You have bestowed upon me and upon my parents, and to do good deeds that please You. And admit me by Your mercy amongst Your righteous servants. (27:19)'.tr(),
    'O Allah, grant us the best outcome in all of our affairs, and protect us from the humiliation of this world and the punishment of the hereafter.'.tr(),
    'O Allah, all the favours that I or anyone from Your creation has received in the morning, are from You Alone. You have no partner. To You Alone belong all praise and all thanks.'.tr(),
    'Allah is sufficient for me. There is no god worthy of worship except Him. I have placed my trust in Him only and He is the Lord of the Magnificent Throne.'.tr(),
    'Oh Allah, if my intended action is best for me, make it destined and easy for me, and grant me Your Blessings in it.'.tr(),
    'All praise is for Allah, Who provided us food and drink and Who sufficed us and has sheltered us; for how many have none to suffice them or shelter them.'.tr(),
    'O Allah, I seek Your protection from anxiety and grief. I seek Your protection from inability and laziness. I seek Your protection from cowardice and miserliness, and I seek Your protection from being overcome by debt and being overpowered by men.'.tr(),
    'My Lord, I have certainly wronged myself, so forgive me. (28:16)'.tr(),
    'All praise is for Allah through whose blessing righteous actions are accomplished.'.tr(),
    'To Allah we belong and unto Him is our return. O Allah, recompense me for my affliction and replace it for me with something better.'.tr(),
    'Oh Allah, remove anger from my heart.'.tr(),
    'O The Ever Living, The Sustainer of all. ; I seek assistance through Your mercy. Rectify all of my affairs and do not entrust me to myself for the blink of an eye.'.tr(),
    'My Lord, I seek protection with You from the promptings of the devils; and I seek protection in You, my Lord, from their coming near me. (23:97-98)'.tr(),
    'O The Ever Living, The Sustainer of all. ; I seek assistance through Your mercy. Rectify all of my affairs and do not entrust me to myself for the blink of an eye.'.tr(),
    'Allah is sufficient for me. There is no god worthy of worship except Him. I have placed my trust in Him only and He is the Lord of the Magnificent Throne.'.tr(),
    'My Lord, truly I am in dire need of any good which You may send me. (28:24)'.tr(),
    'Allah is sufficient for me. There is no God worthy of worship except Him. I have placed my trust in Him only and He is the Lord of the Magnificent Throne.'.tr(),
    'Oh Allah, descend upon me satisfaction that comes from you and open my chest and protect my heart with it.'.tr(),
    'Our Lord, we have wronged ourselves. If You do not forgive us and have mercy upon us, we will surely be amongst the losers. (7:23)'.tr(),
    'My Lord, I seek protection with You from the promptings of the devils; and I seek protection in You, my Lord, from their coming near me. (23:97-98)'.tr(),
    'I seek protection in the perfect words of Allah from His anger and punishment, and from the evil of His servants, and from the evil suggestions of the devils and from them appearing to me.'.tr(),

    // Add more items as needed
  ];
  List<int> selecteditem = [];

  String locale = 'ru';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondarycolor,
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 3, left: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Consumer<FavouriteItemprovider>(
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: searchcontroller,
                              onChanged: (query) {
                                value.updatesearchitem(query);
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: primarycolor,
                                ),
                                hintText: "Search".tr(),
                                hintStyle: TextStyle(color: primarycolor),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    // borderSide: BorderSide(color: secondarycolor),
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    borderSide: BorderSide(color: primarycolor),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            );
                          },
                        )),
                        SizedBox(width: 10,),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Favourite_Screen()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 30,
                                color: primarycolor,
                              ),
                            ],
                          ),
                        )),
                        Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            if(locale == 'uz'){
                              setState(() {
                                locale = 'ru';
                                context.setLocale(Locale('ru'));
                              });
                            }
                            else{
                              setState(() {
                                locale = 'uz';
                                context.setLocale(Locale('uz'));
                              });
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Favourite_Screen()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.language_outlined,
                                size: 30,
                                color: primarycolor,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Consumer<FavouriteItemprovider>(
                builder: (context, value, child) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        String name = items[index].toString().tr();
                        if (searchcontroller.text.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 4, right: 4, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      child: AlertDialog(
                                        title: Center(
                                          child: Text(
                                            maxLines: 1,
                                            items[index].toString().tr(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: primarycolor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        content: Text(
                                          duas[index].toString().tr(),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          Center(
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 100,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: secondarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                child: Text(
                                                  "Close".tr(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: primarycolor),
                                                ),
                                              ),
                                            ),
                                          ))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: secondarycolor.withOpacity(.9)),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: primarycolor,
                                          spreadRadius: .5,
                                          blurRadius: 1,
                                          offset: const Offset(1, 1))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child:
                                              Consumer<FavouriteItemprovider>(
                                            builder: (context, value, child) {
                                              return InkWell(
                                                  onTap: () {
                                                    if (value.selecteditems
                                                        .contains(index)) {
                                                      value.removeitems(index);
                                                    } else {
                                                      value.additems(index);
                                                    }
                                                  },
                                                  child: value.selecteditems
                                                          .contains(index)
                                                      ? const Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xff1c6758),
                                                        )
                                                      : const Icon(
                                                          Icons.favorite_border,
                                                          color:
                                                              Color(0xff1c6758),
                                                        ));
                                            },
                                          )),
                                    ),
                                    Image.asset(
                                      "images/pray.png",
                                      height: 60,
                                    ),
                                    // SizedBox(height: 8),
                                    Text(
                                      maxLines: 1,
                                      items[index].toString().tr(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: primarycolor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchcontroller.text.toLowerCase())) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 4, right: 4, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      child: AlertDialog(
                                        title: Center(
                                          child: Text(
                                            maxLines: 1,
                                            items[index].toString().tr(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: primarycolor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        content: Text(
                                          duas[index].toString().tr(),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          Center(
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 100,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: secondarycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                child: Text(
                                                  "Close".tr(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: primarycolor),
                                                ),
                                              ),
                                            ),
                                          ))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: secondarycolor.withOpacity(.9)),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: primarycolor,
                                          spreadRadius: .5,
                                          blurRadius: 1,
                                          offset: const Offset(1, 1))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child:
                                              Consumer<FavouriteItemprovider>(
                                            builder: (context, value, child) {
                                              return InkWell(
                                                  onTap: () {
                                                    if (value.selecteditems
                                                        .contains(index)) {
                                                      value.removeitems(index);
                                                    } else {
                                                      value.additems(index);
                                                    }
                                                  },
                                                  child: value.selecteditems
                                                          .contains(index)
                                                      ? const Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xff1c6758),
                                                        )
                                                      : const Icon(
                                                          Icons.favorite_border,
                                                          color:
                                                              Color(0xff1c6758),
                                                        ));
                                            },
                                          )),
                                    ),
                                    Image.asset(
                                      "images/pray.png",
                                      height: 60,
                                    ),
                                    // SizedBox(height: 8),
                                    Container(
                                      child: Text(
                                        maxLines: 1,
                                        items[index].toString().tr(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: primarycolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Text("");
                        }
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
