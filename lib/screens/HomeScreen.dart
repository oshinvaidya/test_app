import 'dart:async';

import 'package:flutter/material.dart';

import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:test_app/contract/GetPhotosContract.dart';
import 'package:test_app/contract/GetPostsContract.dart';
import 'package:test_app/contract/PostDetailContract.dart';
import 'package:test_app/model/PhotosResponseModel.dart';
import 'package:test_app/model/PostResponseModel.dart';
import 'package:test_app/model/SinglePostDetailResponseModel.dart';
import 'package:test_app/presenter/PhotosPresenter.dart';
import 'package:test_app/presenter/PostDetailPresenter.dart';
import 'package:test_app/presenter/PostsPresenter.dart';
import 'package:test_app/screens/Dashboard.dart';
import 'package:test_app/screens/DetailsScreen.dart';
import 'package:test_app/screens/LoginScreen.dart';
import 'package:test_app/utils/FetchException.dart';
import 'package:test_app/utils/Preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin
    implements GetPostsContract, GetPhotosContract, PostDetailContract {
  // late MotionTabController _tabController;
  bool isApiCallProcess = false;

  String? userEmail;

  late String postDetail;

  late List<PostsResponseModel> postsList;

  late List<PhotosResponseModel> photosList;

  late GetPhotosPresenter getPhotosPresenter;

  late GetPostsPresenter getPostsPresenter;

  late PostDetailPresenter postDetailPresenter;

  _HomeScreenState() {
    getPhotosPresenter = GetPhotosPresenter(this);
    getPostsPresenter = GetPostsPresenter(this);
    // postDetailPresenter = PostDetailPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    // ignore: argument_type_not_assignable
//    _tabController =
//        new MotionTabController(initialIndex: 1, length: 2, vsync: this);
    postDetailPresenter = PostDetailPresenter(this);
    postsList = [];
    photosList = [];
    getPhotos();
    Timer(Duration(seconds: 2), () => getPosts());

    Preference.init();

    userEmail = Preference.getUserEmail();
  }

  getPosts() {
    getPostsPresenter.getPosts('posts');
  }

  getPhotos() {
    getPhotosPresenter.getPhotos('photos');
  }

  getPostDetail(int id) {
    postDetailPresenter.getPostDetail('posts/$id');
  }

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text('HOME'),
              ),
              bottomNavigationBar: TabBar(tabs: const <Widget>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.pages))
              ]),
              drawer: Drawer(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.0),
                        CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 60.0,
                          child: Text(
                            userEmail ?? 'Unknown',
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        ListTile(
                          title: Text('Dashboard'),
                          leading: Icon(
                            Icons.dashboard,
                            // size: 16.0,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()),
                            );
                          },
                        ),
                        ListTile(
                          title: Text('Logout'),
                          leading: Icon(
                            Icons.logout,
                            // size: 16.0,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                          ),
                          onTap: () {
                            Preference.setIsLogin(false);
                            Preference.setUserEmail('');
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                // controller: _tabController,
                children: <Widget>[homeTabView(), postTabView()],
              ))),
    );
  }

  Widget homeTabView() {
    return photosList.length > 0
        ? Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: photosList.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  imageUrl: photosList[index].url.toString(),
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                photosList[index].url != null
                                    ? photosList[index].url.toString()
                                    : 'jhj',
                                height: 80.0,
                                width: 80.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 180.0,
                                child: Text(
                                  photosList[index].title != null
                                      ? photosList[index].title.toString()
                                      : 'NA',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0),
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget postTabView() {
    return postsList.length > 0
        ? Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: postsList.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      getPostDetail(postsList[index].id!);
                      //we required delay time because we are fetching a data from server and its take time to load data...
                      Future.delayed(Duration(seconds: 1), () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(postDetail),
                              //   content: const Text('This item is no longer available'),
                              actions: [
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 4,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                postsList[index].title != null
                                    ? postsList[index].title.toString()
                                    : 'NA',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                postsList[index].body != null
                                    ? postsList[index].body.toString()
                                    : 'NA',
                                overflow: TextOverflow.ellipsis,
                                // maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  @override
  void failurePhotos(FetchException exception) {
    setState(() {
      isApiCallProcess = false;
    });
    print(exception.toString());
  }

  @override
  void successPhotos(List<PhotosResponseModel> photosResponseModel) {
    setState(() {
      isApiCallProcess = false;
    });
    print('success photosResponseModel');
    print(photosResponseModel.length.toString());
    setState(() {
      photosList = photosResponseModel;
    });
  }

  @override
  void failurePosts(FetchException exception) {
    setState(() {
      isApiCallProcess = false;
    });
    print(exception.toString());
  }

  @override
  void successPosts(List<PostsResponseModel> postsResponseModel) {
    setState(() {
      isApiCallProcess = false;
      postsList.clear();
    });
    print('success postsResponseModel');
    print(postsResponseModel.length.toString());
    setState(() {
      postsList = postsResponseModel;
    });
  }

  @override
  void failurePostsDetail(FetchException exception) {
    setState(() {
      isApiCallProcess = false;
    });
    print(exception.toString());
  }

  @override
  void successPostsDetail(SinglePostDetailResponseModel postsResponseModel) {
    setState(() {
      isApiCallProcess = false;

      /// postsList.clear();
    });
    print('success postsResponseModel');
    print(postsResponseModel.toString());
    setState(() {
      postDetail = postsResponseModel.body!;
    });
  }
}
