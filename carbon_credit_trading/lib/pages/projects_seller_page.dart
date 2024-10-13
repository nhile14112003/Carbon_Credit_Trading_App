import 'package:carbon_credit_trading/pages/project_approved_tab.dart';
import 'package:carbon_credit_trading/pages/project_canceled_tab.dart';
import 'package:carbon_credit_trading/pages/project_pending_tab.dart';
import 'package:flutter/material.dart';

class ProjectsSellerPage extends StatefulWidget {
  @override
  _ProjectsSellerPage createState() => _ProjectsSellerPage();
}

class _ProjectsSellerPage extends State<ProjectsSellerPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Tìm kiếm'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search logic here
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          tabs: [
            Tab(text: 'Chờ duyệt'),
            Tab(text: 'Dự án đã duyệt'),
            Tab(text: 'Đã hủy'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProjectPendingTab(),
          ProjectApprovedTab(),
          ProjectCanceledTab(),
        ],
      ),
    );
  }
}