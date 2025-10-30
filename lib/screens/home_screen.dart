import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';
import '../bloc/hotel_bloc/hotels_bloc.dart';
import '../bloc/hotel_bloc/hotels_event.dart';
import '../bloc/hotel_bloc/hotels_state.dart';
import '../utils/app_color.dart';
import '../utils/app_constant.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<HotelsBloc>().add(FetchHotels());
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = _controller.text.trim();
      context.read<HotelsBloc>().add(FetchHotels(query: query));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 1,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(AppConstant.userImg),
            ),

            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Welcome, ${widget.userName}!',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColor.blackColor),
            tooltip: AppConstant.signInBtn,
            onPressed: () {
              context.read<AuthBloc>().add(AuthSignOutRequested());
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: AppConstant.searchByTitle,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<HotelsBloc, HotelsState>(
              listener: (context, state) {
                if (state is HotelError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.message}')),
                  );
                }
              },
              builder: (context, state) {
                if (state is HotelLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HotelLoaded) {
                  if (state.hotels.isEmpty) {
                    return Center(child: Text(AppConstant.noHotelTitle));
                  }
                  return ListView.builder(
                    itemCount: state.hotels.length,
                    itemBuilder: (context, index) {
                      final hotel = state.hotels[index];
                      return Container(
                        width: 280,
                        height: 400,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.shadowColor.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInImage.assetNetwork(
                              placeholder: AppConstant.placeHoldImg,
                              image: hotel.propertyImage.toString(),
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  AppConstant.noPreviewImg,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.fill,
                                );
                              },
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hotel.propertyName.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        hotel.propertyType.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.labelColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        hotel.markedPrice!.displayAmount
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.place_outlined,
                                        color: AppColor.labelColor,
                                        size: 20,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        hotel.propertyAddress!.city.toString(),
                                        style: TextStyle(
                                          color: AppColor.greyColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: AppColor.yellowColor,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        hotel.propertyStar.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.greyColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Booking ${hotel.propertyName}...',
                                                ),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColor.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: Text(
                                            AppConstant.bookBtn,
                                            style: TextStyle(
                                              color: AppColor.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is HotelError) {
                  return Center(child: Text(AppConstant.errorMsg));
                }
                return Center(child: Text(AppConstant.loadingMsg));
              },
            ),
          ),
        ],
      ),
    );
  }
}
