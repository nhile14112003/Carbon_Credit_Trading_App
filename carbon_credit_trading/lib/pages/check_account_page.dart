import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:flutter/material.dart';

/* Description
  show company info (image, name, email, taxCode, address, industry), user(name, phone)
  reject button
  approve buttonbutton

*/

class CheckAccountPage extends StatefulWidget {
  final Map<String, dynamic> accountDetails;

  const CheckAccountPage({super.key, required this.accountDetails});

  @override
  State<CheckAccountPage> createState() => _CheckAccountPageState();
}

class _CheckAccountPageState extends State<CheckAccountPage> {

  Future<void>? processing;

  Future<void> approveAcc() async {
    try {
      await mediatorAuditControllerApi
          .approveUserRegistration(widget.accountDetails['userId']);
    } catch (e) {
      print("Error fetching pending accounts: $e");
    }
  }

  Future<void> rejectAcc() async {
    try {
      await mediatorAuditControllerApi
          .rejectUserRegistration(widget.accountDetails['userId']);
    } catch (e) {
      print("Error fetching pending accounts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final company = widget.accountDetails['company'] ?? {};

    return Scaffold(
      appBar: const CustomAppBar(title: 'Chi tiết tài khoản'),
      body: processing == null ? buildDetail(company) : FutureBuilder(future: processing, builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          Navigator.pop(context);
          return const Center(
            child: Text('Duyệt tài khoản thành công'),
          );
        }
      }),
    );
  }

  Container buildDetail(company) {
    return Container(
      color: AppColors.greyBackGround,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customRichText(
                      title: 'Tên doanh nghiệp:',
                      value: company?.name,
                    ),
                    const SizedBox(height: 20),
                    customRichText(
                      title: 'Mã số thuế:',
                      value: company.taxCode ?? "N/A",
                    ),
                    const SizedBox(height: 20),
                    customRichText(
                      title: 'Địa chỉ:',
                      value: company.address,
                    ),
                    const SizedBox(height: 20),
                    customRichText(
                      title: 'Ngành nghề kinh doanh:',
                      value: company.industry,
                    ),
                    const SizedBox(height: 20),
                    customRichText(
                      title: 'Email:',
                      value: company.email,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Thông tin người đại diện:',
                      style: TextStyle(
                          fontSize: 17, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10),
                    customRichText(
                      title: 'Họ và tên:',
                      value: widget.accountDetails['name'],
                    ),
                    const SizedBox(height: 10),
                    customRichText(
                      title: 'Số điện thoại:',
                      value: widget.accountDetails['phone'],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          processing = rejectAcc();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Từ chối',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              processing = approveAcc();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.greenButton,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Duyệt',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            )))
                  ]))
        ],
      ),
    );
  }
}
