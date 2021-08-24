import 'package:auto_size_text/auto_size_text.dart';
import 'package:erpgestao/app/core/shared/theme.dart';
import 'package:erpgestao/app/modules/home/presentation/component/average_ticket.dart';
import 'package:erpgestao/app/modules/home/presentation/component/list_sales_payment_type.dart';
import 'package:erpgestao/app/modules/home/presentation/component/sales_chart/sales_chart.dart';
import 'package:erpgestao/app/modules/home/presentation/component/total_qtty.dart';
import 'package:erpgestao/app/modules/home/presentation/component/total_value.dart';
import 'package:erpgestao/app/modules/home/presentation/home_cubit/home_cubit.dart';
import 'package:erpgestao/app/modules/home/presentation/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ContentMobile extends StatefulWidget {
  @override
  State<ContentMobile> createState() => _ContentMobileState();
}

class _ContentMobileState extends State<ContentMobile> {
  late DateTime initialDate = DateTime.now();
  late DateTime finalDate = DateTime.now();
  String selectedTerminal = 'Todos';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<HomeCubit>()
        ..getFinancialClosed('2020-04-01', '2020-04-01', selectedTerminal),
      child: Container(
        child: SingleChildScrollView(
          child: _build(context),
        ),
      ),
    );
  }

  String getFromInititalDate() {
    return DateFormat('dd/MM/yyyy').format(initialDate);
  }

  String getFromFinalDate() {
    return DateFormat('dd/MM/yyyy').format(finalDate);
  }

  Widget filterInititalDate(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText(
          'Período: ',
          minFontSize: 16,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(width: 10),
        AutoSizeText(
          getFromInititalDate(),
          minFontSize: 14,
          maxFontSize: 18,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          child: const Icon(
            Icons.calendar_today,
            color: Colors.blue,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2023))
                .then((date) {
              setState(() {
                initialDate = date!;
              });
            });
          },
        ),
      ],
    );
  }

  Widget filterFinalDate(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          getFromFinalDate(),
          minFontSize: 14,
          maxFontSize: 18,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          child: const Icon(
            Icons.calendar_today,
            color: Colors.blue,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: finalDate,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2023))
                .then((date) {
              setState(() {
                finalDate = date!;
              });
            });
          },
        ),
      ],
    );
  }

  Widget filterFirstLine(BuildContext context) {
    return Row(
      children: [
        filterInititalDate(context),
        filterFinalDate(context),
      ],
    );
  }

  Widget filterTerminalList(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText(
          'Terminal: ',
          minFontSize: 16,
          maxFontSize: 20,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        DropdownButton<String>(
          value: selectedTerminal,
          onChanged: (String? newValue) {
            setState(() {
              selectedTerminal = newValue!;
            });
          },
          items: <String>[
            'Todos',
            'Terminal 01',
            'Terminal 02',
            'Terminal 03',
            'Terminal 04'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget filterButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.lightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      onPressed: () => context.read<HomeCubit>().getFinancialClosed(
            DateFormat('yyyy-MM-dd').format(initialDate),
            DateFormat('yyyy-MM-dd').format(finalDate),
            selectedTerminal,
          ),
      child: const Text(
        'Filtrar',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }

  Widget filterSecondLine(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          alignment: Alignment.centerLeft,
          child: filterTerminalList(context),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          alignment: Alignment.centerLeft,
          child: filterButton(context),
        ),
      ],
    );
  }

  Widget filter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: kPrimaryColor.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(kDefaultPadding),
        ),
      ),
      alignment: Alignment.topRight,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.centerLeft,
            child: filterFirstLine(context),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.centerLeft,
            child: filterSecondLine(context),
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
