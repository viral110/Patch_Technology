import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patch_task/get_it_configuration/get_it_configuration.dart';
import 'package:patch_task/src/app/product/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:patch_task/src/app/product/presentation/bloc/category_bloc/category_event.dart';
import 'package:patch_task/src/app/product/presentation/bloc/category_bloc/category_state.dart';
import 'package:patch_task/src/app/product/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:patch_task/src/app/product/presentation/bloc/product_bloc/product_event.dart';
import 'package:patch_task/src/app/product/presentation/bloc/product_bloc/product_state.dart';
import 'package:patch_task/src/app/product/presentation/widgets/product_display_widget.dart';
import 'package:patch_task/src/common/constants/color_helper.dart';
import 'package:patch_task/src/common/widgets/custom_text_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool? isHighToLow;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => getIt.get<ProductBloc>()..add(FetchProducts()),
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => getIt.get<CategoryBloc>()..add(FetchCategories()),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {},
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: 120, // Height for the purple background
                color: ColorHelper.primaryColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 9), // Space for status bar

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0), // Rounded corners
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4), // Shadow effect
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: "What are you looking for?",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20), // Spacing

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomTextWidget(
                              text: "Choose from any category",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
                            if (state is CategoryLoadSuccessfully) {
                              return BlocBuilder<ProductBloc, ProductState>(builder: (ctx, ste) {
                                return SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: state.entities!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 15.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            selectedIndex = index;
                                            ctx.read<ProductBloc>().add(FetchProductsByCategories(catName: state.entities![index].toString()));
                                            isHighToLow = null;
                                            setState(() {});
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      selectedIndex == index ? const Color(0xff4CBACC) : Colors.transparent,
                                                      selectedIndex == index ? const Color(0xff77D28B) : Colors.transparent,
                                                    ],
                                                  ),
                                                ),
                                                child: CircleAvatar(
                                                  radius: 24,
                                                  backgroundColor: ColorHelper.primaryColor,
                                                  child: CustomTextWidget(
                                                    text: state.entities![index].toString().substring(0, 1).toUpperCase(),
                                                    color: ColorHelper.whiteColor,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                width: 80,
                                                child: CustomTextWidget(
                                                  text: state.entities![index],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  align: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              });
                            } else if (state is CategoryFailed) {
                              return const Center(
                                child: CustomTextWidget(text: "Something went wrong"),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),

                          // Product List
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                            if (state is ProductLoadSuccessfully) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "${state.entities!.length} products to choose from",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            isHighToLow = false;
                                            context.read<ProductBloc>().add(FilterProductsByPrice("Lowest price first"));
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 9),
                                            decoration: BoxDecoration(
                                              color: isHighToLow == false ? ColorHelper.primaryColor : ColorHelper.greyNonSelectedColor,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: CustomTextWidget(
                                              text: "Lowest price first",
                                              color: isHighToLow == false ? ColorHelper.whiteColor : ColorHelper.blackColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            isHighToLow = true;
                                            context.read<ProductBloc>().add(FilterProductsByPrice("Highest price first"));
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 9),
                                            decoration: BoxDecoration(
                                              color: isHighToLow == true ? ColorHelper.primaryColor : ColorHelper.greyNonSelectedColor,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: CustomTextWidget(
                                              text: "Highest price first",
                                              color: isHighToLow == true ? ColorHelper.whiteColor : ColorHelper.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GridView.builder(
                                      itemCount: state.entities!.length,
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        mainAxisExtent: 225,
                                      ),
                                      itemBuilder: (context, index) {
                                        return ProductDisplayWidget(
                                          product: state.entities![index],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else if (state is ProductFailed) {
                              return const Center(
                                child: CustomTextWidget(text: "Something went wrong"),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                        ],
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
