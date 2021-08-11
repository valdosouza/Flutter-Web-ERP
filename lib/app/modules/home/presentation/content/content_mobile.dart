import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/home/presentation/component/list_sales_payment_type.dart';
import 'package:frontend/app/modules/home/presentation/component/sales_chart/sales_chart.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_cubit.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_state.dart';

class ContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<HomeCubit>()
        ..getFinancialClosed('2020-04-01', '2020-04-01'),
      child: Center(
        child: Container(width: 400, child: _build(context)),
      ),
    );
  }

  Widget _buildLoadPaymnents(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        onPressed: () => context
            .read<HomeCubit>()
            .getFinancialClosed('2020-04-01', '2020-04-01'),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sending Message"),
          ));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadedState) {
          final list = state.homeSalesPaymentTypeModel;
          return Column(
            children: [
              salesChart(context, list),
              listSalesPaymentType(context, list),
            ],
          );
        } else
          return Container();
      },
    );
  }
}
