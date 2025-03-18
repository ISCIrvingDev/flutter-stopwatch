import 'package:flutter/material.dart';

// * Services
// import 'home.service.dart';

// * MVVM
import 'package:provider/provider.dart';
import 'home.viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // * Business logic
  // HomeService _homeService = HomeService();

  @override
  Widget build(BuildContext context) {
    // * View Models
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0XFF1c2757),
      appBar: AppBar(
        backgroundColor: const Color(0XFF1c2757),
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '${homeViewModel.homeModel.digitHours}:${homeViewModel.homeModel.digitMinutes}:${homeViewModel.homeModel.digitSeconds}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 82,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0XFF323F68),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  itemCount: homeViewModel.homeModel.laps.length,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${index + 1}° Lap',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              homeViewModel.homeModel.laps[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      onPressed:
                          () =>
                              !homeViewModel.started
                                  ? homeViewModel.start()
                                  : homeViewModel.stop(),
                      child: Text(
                        !homeViewModel.started ? 'Start' : 'Pause',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(width: 8),
                  IconButton(
                    color: Colors.white,
                    onPressed: homeViewModel.addLaps,
                    icon: Icon(Icons.flag),
                  ),
                  SizedBox(width: 8),

                  Expanded(
                    child: RawMaterialButton(
                      fillColor: Colors.blue,
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      onPressed: homeViewModel.reset,
                      child: Text(
                        'Reset',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
