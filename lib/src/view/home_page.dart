import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quotes_app/src/model/quote_model.dart';
import 'package:quotes_app/src/services/quote_service.dart';
import 'package:quotes_app/src/widgets/quotes_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  final List<QuotesModel> page = [];

  String token = '';

  @override
  void initState() {
    //  Provider.of<QuoteProvider>(context, listen: false).getQuotesData();
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('login')!;
    });
  }

  final response = QuoteService().getQuotes();

  @override
  Widget build(BuildContext context) {
    // final quotes = Provider.of<QuoteProvider>(context);
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/bg_image2.jpg',
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Welcome User',
                    //       style: TextStyle(color: Colors.white, fontSize: 20),
                    //     ),
                    //     Text(
                    //       'Your token is: $token',
                    //       style: const TextStyle(
                    //           color: Colors.white, fontSize: 20),
                    //     )
                    //   ],
                    // ),
                    150.height,
                    Center(
                      child: FutureBuilder<List<QuotesModel>>(
                          future: QuoteService().getQuotes(),
                          //response,
                          //QuoteService().getQuotes(),
                          builder: ((context, snapshot) {
                            final page = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                              // const SpinKitThreeBounceProgressIndicator();
                            }
                            if (snapshot.hasData) {
                              Center(
                                child: Container(
                                  height: 350,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      //  color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: FlipCard(
                                    front:
                                        QuotesCard(text: page![currentIndex].q),
                                    back:
                                        QuotesCard(text: page[currentIndex].a),
                                  ),
                                ),
                              );
                            }
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text(
                                  'Error occured while fetching quotes',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            } else {
                              // return buildQuotes(quotes!);
                            }
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  alignment: Alignment.center,
                                  height: 350,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: FlipCard(
                                    front:
                                        QuotesCard(text: page![currentIndex].q),
                                    back:
                                        QuotesCard(text: page[currentIndex].a),
                                  ),
                                ),
                                20.height,
                                const Text('Click on card to flip',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))
                              ],
                            );

                            //const Center(child: Text('No data'));
                          })),
                    ),
                  ],
                )),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // OutlinedButton.icon(
                //     onPressed: 
                  //showPrevCard,
                //     icon: const Icon(Icons.chevron_left),
                //     label: const Text('Prev')),
                190.width,
                OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: const Icon(Icons.chevron_right),
                    label: const Text('Next'))
              ],
            ),
          )
        ],
      ),
    ));
  }

  void showNextCard() {
    setState(() {
      currentIndex = (currentIndex + 1 < page.length) ? currentIndex + 1 : 0;
    });
  }

  void showPrevCard() {
    setState(() {
      currentIndex = (currentIndex - 1 >= 0) ? currentIndex - 1 : page.length;
    });
  }

  @override
  Widget bounce(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    );
  }
}

class SpinKitThreeBounceProgressIndicator extends StatelessWidget {
  const SpinKitThreeBounceProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// Widget buildQuotes(List<QuotesModel> quotes) {
  //  return 
    
    //ListView.builder(
        // scrollDirection: Axis.horizontal,
        // itemCount: quotes[currentIndex].,
      //  itemBuilder: ((context, index) {
    //  final makeQuotes = quotes[index];

      // return 
      
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       height: 350,
      //       width: 300,
      //       decoration: BoxDecoration(
      //           color: Colors.white.withOpacity(0.1),
      //           borderRadius: BorderRadius.circular(12)),
      //       child: FlipCard(
      //         front: QuotesCard(text: page.q),
      //         back: QuotesCard(text: makeQuotes.a),
      //       ),
      //     ),
          // Text(
          //   makeQuotes.q,
          //   style: const TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white),
          // ),
          // 10.height,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(
          //       height: 3,
          //       width: 20,
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(5)),
          //     ),
          //     5.width,
          //     Text(
          //       makeQuotes.a,
          //       style: const TextStyle(
          //           fontSize: 14,
          //           color: Colors.white,
          //           fontWeight: FontWeight.w600),
          //     )
          //   ],
          // ),
          // 10.height,
          // const Divider(
          //   color: Colors.grey,
          //   height: 2,
          // )
  //       ],
  //     );
  //   }));
  // }
//}
