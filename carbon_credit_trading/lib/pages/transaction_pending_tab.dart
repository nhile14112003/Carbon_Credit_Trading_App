import 'package:carbon_credit_trading/pages/approve_transaction_page.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/models/user.dart';
import 'package:carbon_credit_trading/widgets/transaction_item.dart';

class TransactionPendingTab extends StatefulWidget {
  final String previousPage;
  final String? searchQuery;

  const TransactionPendingTab(
      {super.key, this.previousPage = '', this.searchQuery});

  @override
  createState() => _TransactionPendingTabState();
}

class _TransactionPendingTabState extends State<TransactionPendingTab> {
  bool _isSearching = false;
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Create a list of pending transactions
    final List<Transaction> pendingTransactions = [
      Transaction(
        transactionId: '033',
        contractNumber: '',
        contractDate: '',
        projectName: 'REDD+ Bảo tồn rừng ngập mặn',
        creditAmount: '10,000',
        totalAmount: '14,000,000 USD',
        seller: User(businessName: 'EcoHome Building Corporation'),
        buyer: User(businessName: 'Coastal Mangrove Restoration Initiative'),
        projectInfo: Project(
            projectName: 'Solar Power Plant Expansion',
            startDate: '2023-01-15',
            endDate: '2024-01-15',
            location: 'California, USA',
            scale: '100 MW',
            scope: 'Increase solar capacity to reduce fossil fuel dependency.',
            partners: 'SolarTech Corp, Green Energy Solutions',
            issuer: 'California State Energy Authority',
            availableCredits: '50000',
            certificates: 'ISO 14001, Green Energy Certificate',
            price: '10.5',
            projectImages: [
              'https://example.com/images/solar_plant.jpg',
              'https://example.com/images/solar_panel.jpg',
            ],
            creditImages: [
              'https://example.com/images/solar_credit.jpg',
            ],
            paymentMethods: ['Credit Card', 'Bank Transfer'],
            status: 'approved'),
        status: 'pending',
      ),
      Transaction(
        transactionId: '022',
        contractNumber: '',
        contractDate: '',
        projectName: 'REDD+ Bảo tồn rừng ngập mặn',
        creditAmount: '10,000',
        totalAmount: '14,000,000 USD',
        seller: User(businessName: 'EcoHome Building Corporation'),
        buyer: User(businessName: 'Coastal Mangrove Restoration Initiative'),
        projectInfo: Project(
            projectName: 'Wind Farm Development',
            startDate: '2022-05-20',
            endDate: '2024-05-20',
            location: 'Texas, USA',
            scale: '200 MW',
            scope: 'Generate renewable energy through wind turbines.',
            partners: 'Windy Fields Inc, EcoEnergy Partners',
            issuer: 'Texas Renewable Energy Agency',
            availableCredits: '75000',
            certificates: 'Renewable Energy Certificate, ISO 14064',
            price: '15.0',
            projectImages: [
              'https://example.com/images/wind_farm.jpg',
              'https://example.com/images/wind_turbine.jpg',
            ],
            creditImages: [
              'https://example.com/images/wind_credit.jpg',
            ],
            paymentMethods: ['PayPal', 'Bank Transfer'],
            status: 'approved'),
        status: 'pending',
      ),
    ];

    List<Transaction> getFilteredTransactions(List<Transaction> transactions) {
      final searchQuery = widget.previousPage != ''
          ? _searchQuery.trim()
          : widget.searchQuery?.trim() ?? '';

      return transactions.where((transaction) {
        return transaction.transactionId.contains(searchQuery);
      }).toList();
    }

    final filteredTransactions = getFilteredTransactions(pendingTransactions);

    return Scaffold(
      appBar: widget.previousPage != ''
          ? AppBar(
              centerTitle: true,
              title: _isSearching
                  ? TextField(
                      focusNode: _searchFocusNode,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tìm mã giao dịch...',
                      ),
                    )
                  : const Text(
                      'Giao dịch',
                      style: AppTextStyles.heading,
                    ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_isSearching) {
                          _isSearching = false;
                          _searchQuery = '';
                          _searchFocusNode.unfocus();
                        } else {
                          _isSearching = true;
                          _searchFocusNode.requestFocus();
                        }
                      });
                    },
                    child: _isSearching
                        ? const Text(
                            'Hủy',
                            style: TextStyle(
                                color: AppColors.greenButton, fontSize: 16),
                          )
                        : const Icon(
                            Icons.search,
                            color: AppColors.greenButton,
                          ),
                  ),
                ),
              ],
            )
          : null,
      body: Container(
        color: AppColors.greyBackGround,
        child: filteredTransactions.isEmpty
            ? const Center(
                child: Text(
                  'Không có giao dịch nào đang chờ duyệt',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: AppTextStyles.normalText,
                ),
              )
            : Column(
                children: [
                  if (widget.previousPage.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Các giao dịch đang chờ duyệt',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greenButton,
                        ),
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: filteredTransactions.length,
                      itemBuilder: (context, index) {
                        final transaction = filteredTransactions[index];
                        return TransactionItem(
                          transaction: transaction,
                          searchQuery: widget.previousPage != ''
                              ? _searchQuery
                              : widget.searchQuery,
                          onPress: widget.previousPage == 'intermediary'
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ApproveTransactionPage(
                                              transaction: transaction),
                                    ),
                                  );
                                }
                              : null,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
