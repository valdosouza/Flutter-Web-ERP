import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/core/shared/theme.dart';
import 'package:frontend/app/modules/home/presentation/component/average_ticket.dart';
import 'package:frontend/app/modules/home/presentation/component/list_sales_payment_type.dart';
import 'package:frontend/app/modules/home/presentation/component/sales_chart/sales_chart.dart';
import 'package:frontend/app/modules/home/presentation/component/total_qtty.dart';
import 'package:frontend/app/modules/home/presentation/component/total_value.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_cubit.dart';
import 'package:frontend/app/modules/home/presentation/home_cubit/home_state.dart';
import 'package:intl/intl.dart';

class ContentMobile extends StatefulWidget {
  @override
  State<ContentMobile> createState() => _ContentMobileState();
}

class _ContentMobileState extends State<ContentMobile> {
  late DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<HomeCubit>()
        ..getFinancialClosed('2020-04-01', '2020-04-01'),
      child: Container(
        child: SingleChildScrollView(
          child: _build(context),
        ),
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: initialDateRange,
    );
    // ignore: always_put_control_body_on_new_line
    if (newDateRange != null) dateRange = newDateRange;
  }

  String getFrom() {
    return DateFormat('yyyy-MM/dd').format(dateRange.start);
  }

  String getUntil() {
    return DateFormat('yyyy-MM/dd').format(dateRange.end);
  }

  Widget filter(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: 50,
                child: Column(
                  children: [
                    AutoSizeText(
                      'Período: ${DateFormat('dd/MM/yyyy').format(dateRange.start)} à ${DateFormat('dd/MM/yyyy').format(dateRange.end)}',
                      minFontSize: 14,
                      maxFontSize: 18,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              onPressed: () async {
                await pickDateRange(context);
                await context
                    .read<HomeCubit>()
                    .getFinancialClosed(getFrom(), getUntil());
              },
              child: const Text(
                'Filtrar',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalSeparator() {
    return Container(
      height: 30,
      margin: const EdgeInsets.all(5), //only(top: kDefaultPadding),
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.lightGreen,
        border: Border.all(
          width: 2,
          color: Colors.lightGreen,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(kDefaultPadding),
        ),
      ),
      child: const Text(
        "Sumário",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              filter(context),
              if (list.isNotEmpty) salesChart(context, list),
              if (list.isNotEmpty) listSalesPaymentType(context, list),
              if (list.isNotEmpty) totalSeparator(),
              if (list.isNotEmpty) totalValueSales(context, list),
              if (list.isNotEmpty) totalQtdeSales(context, list),
              if (list.isNotEmpty) averageTicket(context, list),
            ],
          );
        } else
          return Container();
      },
    );
  }
}
