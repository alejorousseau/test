import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:technical_test/ui/theme/colors.theme.dart';
import 'package:technical_test/ui/widgets/article.card.dart';
import 'package:technical_test/ui/screens/home/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const LoadData());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding( padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              child: RefreshIndicator(
                onRefresh: () async => BlocProvider.of<HomeBloc>(context).add(const LoadData(isRefreshing: true)),

                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            text: TextSpan(
                              text: 'All News about ',
                              style:GoogleFonts.dmSerifDisplay()
                              .copyWith(fontSize: screenSize.width * .15, fontWeight: FontWeight.w600,
                                color: ColorsTheme.primaryColor
                              ),
                              children: [
                                TextSpan(
                                  text: 'Tech', 
                                  style: GoogleFonts.dmSerifDisplay()
                                  .copyWith(fontSize: screenSize.width * .15, fontWeight: FontWeight.w600,
                                    color: ColorsTheme.secondaryColor
                                  ),
                                )
                              ]
                            ),

                          )
                        ],
                      ) 
                    ),
                    Expanded(
                      flex: 3 ,
                      child: ListView.builder(
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          final article = state.articles[index];
                          final fontSize = screenSize.width * 0.1;
                          return ArticleCard(fontSize: fontSize, article: article);
                        }
                      ),
                    ),
                  ],
                ),

              ),
            ),
          )
        );
      },
    );
  }
}
