import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/home/book_screen.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

import '../../../common/constants/app_routes.dart';
import 'home_controller.dart';

class BookScreen extends GetView<HomeController> {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.sp,
          right: 16.sp,
        ),
        child: ListView(
          children: [
            TextButton.icon(
              style: ButtonStyle(alignment: Alignment.bottomLeft),
              icon: const Icon(
                Icons.arrow_back,
                size: 40,
              ),
              label: const Text(
                '',
                style: TextStyle(color: AppColors.blue700, fontSize: 18),
                textAlign: TextAlign.left,
              ),
              onPressed: () => Get.offAllNamed(AppRoutes.home),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 350.h,
                    height: 304.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.grey1,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Image(
                            height: 242.57,
                            width: 170,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://cdn.luatminhkhue.vn/lmk/article/Sach-luat/Giao-trinh-kinh-te-chinh-tri-Mac-Lenin.jpg")),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Kinh tế  chính trị Mác- Lênin",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.blue700,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.grey1,
                    ),
                    width: 350.h,
                    height: 300.w,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.sp,
                        right: 16.sp,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Tác giả:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                'Võ Văn Thưởng',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Thể loại:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                'Giáo trình',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Số trang:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' 1500',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Id:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' KMAKTCT',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Nhà xuất bản:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' KMA',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Khổ giấy:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' A4',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Ngôn ngữ:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' tiếng Việt',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Số lần tái bản:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' 3',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Ngày xuất bản:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' 01/01/2023',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Ngày chỉnh sửa:',
                                style: TextStyle(
                                    color: AppColors.blue700, fontSize: 18),
                              ),
                              Text(
                                ' 10/01/2023',
                                style: TextStyle(
                                    color: AppColors.blue700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey1,
                  ),
                  width: 350.h,
                  height: 200.w,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.sp,
                      right: 16.sp,
                    ),
                    child: Column(children: [
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Giáo trình Kinh tế chính trị của Mác-Lênin là một tài liệu lý thuyết và phân tích quan trọng về mối quan hệ kinh tế và chính trị trong thời kỳ cách mạng. Nó cung cấp cái nhìn đa chiều về hệ thống kinh tế và xã hội, và bao gồm các khái niệm quan trọng như cấu trúc kinh tế và quy luật sản xuất.',
                        style:
                            TextStyle(color: AppColors.blue700, fontSize: 18),
                        textAlign: TextAlign.justify,
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.bluef,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text('Thêm tài liệu',style: TextStyle(fontSize: 20),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
