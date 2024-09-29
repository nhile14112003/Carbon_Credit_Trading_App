import 'package:flutter/material.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User Info Section
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 30),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Renewable Biomass Energy Ventures',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'andi@renewablebiomass.id',
                        style:TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Transaction Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child:
                        _buildTransactionCard('Giao dịch đang chờ duyệt', '0')),
                Expanded(
                    child:
                        _buildTransactionCard('Giao dịch đã hoàn thành', '0')),
                Expanded(child: _buildTransactionCard('Giao dịch đã hủy', '0')),
                Expanded(child: _buildTransactionCard('Phản hồi', '0')),
              ],
            ),
            const SizedBox(height: 20),
            // Action Buttons Section
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildActionCard(Icons.file_copy, 'Đăng ký dự án'),
                  _buildActionCard(Icons.check, 'Dự án đã duyệt'),
                  _buildActionCard(Icons.contact_page, 'Liên hệ'),
                  _buildActionCard(Icons.bar_chart, 'Thống kê doanh thu'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildActionCard(IconData icon, String label) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Thao tác khi nhấn
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.green),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
