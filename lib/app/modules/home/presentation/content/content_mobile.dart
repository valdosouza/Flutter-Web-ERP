import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/home/presentation/component/list_sales_payment_type.dart';
import 'package:frontend/app/modules/home/presentation/component/sales_chart/sales_chart.dart';
import 'package:frontend/app/modules/home/presentation/component/sales_date_filter.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_cubit.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_state.dart';

class ContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<HomeCubit>(),
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeErrorState) {
          return const Center(
            child: Icon(Icons.close),
          );
        } else {
          if (state is HomeLoadedState) {
            return SizedBox(
              child: Column(
                children: [
                  SalesDateFilter(),
                  SalesChart(),
                  ListSalesPaymentType(),
                ],
              ),
            );
          } else
            return Container();
        }
      },
    );
  }
}
