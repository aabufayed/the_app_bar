import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 0 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 0 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List of dummy data

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffE01E89),
        centerTitle: true,
        title: Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'خصومات و شحن مجاني بترقية حسابك الى كوينا',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.85,
                      fontFamily: 'Lama Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.85,
                      fontFamily: 'Lama Sans',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'سجلي الان',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.85,
                      fontFamily: 'Lama Sans',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
              100.0), // Adjusted the height to accommodate the TextField
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.menu),
                      Spacer(),
                      Icon(Icons.favorite_border),
                      Icon(Icons.person),
                      Icon(Icons.shopping_cart),
                    ],
                  ),
                  TextField(
                    style: TextStyle(
                      fontFamily: 'TheSansArabic',
                    ),
                    decoration: InputDecoration(
                      hintText: 'إبحث عن منتج أو ماركة',
                      hintStyle: TextStyle(
                        color: Color(0xFF868686),
                        fontSize: 16.59,
                        fontFamily: 'TheSansArabic',
                        fontWeight: FontWeight.w300,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(39),
                        borderSide: BorderSide(
                          color: Color(0xFFF5F5F6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(39),
                        borderSide: BorderSide(
                          color: Color(0xFFF5F5F6),
                        ),
                      ),
                      fillColor: Color(0xFFF5F5F6),
                      filled: true,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
