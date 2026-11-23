import 'package:flutter/material.dart';
import 'package:project_zaskia/Container/ContainerSatu.dart';
import 'package:project_zaskia/Container/LatihanSatu.dart';
import 'package:project_zaskia/list_grid_view/ArticleListScreen.dart';
import 'package:project_zaskia/list_grid_view/GridBasic.dart';
import 'package:project_zaskia/list_grid_view/GridProductPage.dart';
import 'package:project_zaskia/list_grid_view/GridView.dart';
import 'package:project_zaskia/list_grid_view/ListBasic.dart';
import 'package:project_zaskia/list_grid_view/ListViewBuilder.dart';
import 'package:project_zaskia/list_grid_view/ListViewCustom.dart';
import 'package:project_zaskia/list_grid_view/ListViewHorizontal.dart';
import 'package:project_zaskia/list_grid_view/ListViewSeparated.dart';
import 'package:project_zaskia/pages/about_page.dart';
import 'package:project_zaskia/pages/fetch_api_page.dart';
import 'package:project_zaskia/pages/form_page.dart';
import 'package:project_zaskia/pages/home_page.dart';
import 'package:project_zaskia/pages/input-form.dart';
import 'package:project_zaskia/pages/login_page.dart';
import 'package:project_zaskia/pages/photo_page.dart';
import 'package:project_zaskia/pages/post_page.dart';
import 'package:project_zaskia/pages/register_page.dart';
import 'package:project_zaskia/pages/tugas-form.dart';
import 'package:project_zaskia/row_colum/ColumWidget.dart';
import 'package:project_zaskia/row_colum/Latihan1.dart';
import 'package:project_zaskia/row_colum/LatihanDua.dart';
import 'package:project_zaskia/row_colum/RowColumWidget.dart';
import 'package:project_zaskia/row_colum/RowWidget.dart';
import 'package:project_zaskia/sized_expanded_stack/ExpandedWidget.dart';
import 'package:project_zaskia/sized_expanded_stack/LatihanEmpat.dart';
import 'package:project_zaskia/sized_expanded_stack/LatihanTiga.dart';
import 'package:project_zaskia/sized_expanded_stack/LayoutDua.dart';
import 'package:project_zaskia/sized_expanded_stack/LayoutEmpat.dart';
import 'package:project_zaskia/sized_expanded_stack/LayoutSatu.dart';
import 'package:project_zaskia/sized_expanded_stack/LayoutTiga%20.dart';
import 'package:project_zaskia/sized_expanded_stack/SizedBoxWidget.dart';
import 'package:project_zaskia/sized_expanded_stack/StackWidget.dart';
import 'package:project_zaskia/toko_elektronik/electromart_page.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
  static const containerSatu = '/container';
  static const latihanSatu = '/latihan-satu';

  static const columWidget = '/colum-widget';
  static const rowColumnWidget = '/row-column-widget';
  static const rowWidget = '/row-widget';
  static const latihan1 = '/latihan-1';
  static const latihanDua = '/latihan-dua';

  static const expandedWidget = '/expanded-widget';
  static const sizedBoxWidget = '/sized-box-widget';
  static const stackWidget = '/stack-widget';
  static const layoutSatu = '/layout-satu';
  static const layoutDua = '/layout-dua';
  static const layoutTiga = '/layout-tiga';
  static const layoutEmpat = '/layout-empat';
  static const latihanTiga = '/latihan-tiga';
  static const latihanEmpat = '/latihan-empat';


  static const listBasic = '/list-basic';
  static const listViewBuilder = '/list-view-builder';
  static const listViewCostum = '/list-view-costum';
  static const listViewHorizontal = '/list-view-horizontal';
  static const listViewSeparated = '/list-view-separated';
  static const gridView = '/grid-view';
  static const gridBasic = '/grid-basic';
  static const gridProduct = '/grid-product';
  static const articleList = '/article-list';

  
  static const inputForm = '/input-form';
  static const formPage = '/form-page';
  static const tugasForm = '/tugas-form';
  static const about = '/about';
  static const tokoElektronik = '/toko-elektronik';
  static const album = '/album';
  static const postPage = '/post-page';
  static const photoPage = '/photo-page';
  
  static Map<String, WidgetBuilder> routes() {
    return {
      home: (context) => HomePage(),
      login: (context) => LoginPage(),
      register: (context) => RegisterPage(),
      containerSatu: (context) => Containersatu(),
      latihanSatu: (context) => Latihansatu(),

      columWidget: (context) => Columnwidget(),
      rowColumnWidget: (context) => Rowcolum(),
      rowWidget: (context) => RowWidget(),
      latihan1: (context) => Latihan1(),
      latihanDua: (context) => Latihandua(),

      expandedWidget: (context) => ExpandedWidget(),
      sizedBoxWidget: (context) => SizedBoxWidget(),
      stackWidget: (context) => StackWidget(),
      layoutSatu: (context) => KartuProfil(),
      layoutDua: (context) => Layoutdua(),
      layoutTiga: (context) => KartuDashboard(),
      layoutEmpat: (context) => ProfileWidget(),  
      latihanTiga: (context) => Latihantiga(),
      latihanEmpat: (context) => Latihanig(),

      
      listBasic: (context) => Listview(),
      listViewBuilder: (context) => Listviewbuilder(),
      listViewCostum: (context) => Listviewcustom(),
      listViewHorizontal: (context) => Listviewhorizontal(),
      listViewSeparated: (context) => Listviewseparated(),
      gridView: (context) => Gridview(),
      gridBasic: (context) => Gridbasic(),  
      gridProduct: (context) => GridProductPage(),
      articleList: (context) => ArticleListScreen(),

      about: (context) => AboutPage(),
      formPage: (context) => FormPage(),
      inputForm: (context) => BelajarForm(),
      tugasForm: (context) => TugasForm(),
      tokoElektronik: (context) => ElectroMartPage(),
      album: (context) => AlbumPage(),
      postPage: (context) => PostPage(),
      photoPage: (context) => PhotoPage(),
    };
  }
   static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        // Halaman fallback jika rute tidak ditemukan
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rute tidak ditemukan: ${settings.name}'),
            ),
          ),
        );
    }
  }
}