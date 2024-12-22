import 'package:carbon_credit_trading/pages/question_details_page.dart';
import 'package:carbon_credit_trading/services/format.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

final List<String> questions = [
  'Tín chỉ carbon là gì và nó hoạt động như thế nào?',
  'Các công ty có thể làm gì để đạt được tín chỉ carbon?',
  'Tín chỉ carbon có ảnh hưởng gì đến môi trường và kinh tế không?'
];

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  List<String> getFilteredQuestions() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) return questions;

    return questions.where((question) {
      return question.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredQuestions = getFilteredQuestions();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Câu hỏi thường gặp",
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Tìm hiểu thêm về tín chỉ Carbon',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            isSearching = value.isNotEmpty;
                          });
                        },
                        onTap: () {
                          setState(() {});
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          hintText: 'Tìm kiếm',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                    if (isSearching)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                            FocusScope.of(context).unfocus();
                            isSearching = false;
                          });
                        },
                        child: const Text(
                          "Hủy",
                          style: TextStyle(
                            color: AppColors.greenPopUpText,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: filteredQuestions.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: filteredQuestions.length,
                        itemBuilder: (context, index) {
                          final question = filteredQuestions[index];

                          return ListTile(
                            title: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                children: highlightMatches(
                                  question,
                                  searchController.text,
                                  Colors.yellow,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const QuestionDetailPage(),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                      )
                    : const Center(
                        child: Text(
                          'Không có câu hỏi phù hợp',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
              )),
            ],
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: TextButton(
              onPressed: () {
                //handle when click submit button
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.greenButton,
              ),
              child: const Text(
                'Thêm câu hỏi',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
