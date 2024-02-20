import 'package:carousel_slider/carousel_slider.dart';
import 'package:fier/ui/router/app_routers.dart';
import 'package:fier/ui/widgets/register_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fier/domain/blocs/counter_bloc/counter_bloc.dart';
import 'package:fier/domain/blocs/start_page_bloc/start_page_bloc.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsBloc = StartPageBloc()..add(StartPageLoadedEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => itemsBloc,
        ),
      ],
      child: ScaffolWidget(
        itemsBloc: itemsBloc,
      ),
    );
  }
}

class ScaffolWidget extends StatelessWidget {
  const ScaffolWidget({
    Key? key,
    required this.itemsBloc,
  }) : super(key: key);
  final StartPageBloc itemsBloc;
  @override
  Widget build(BuildContext context) {
    final indexBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<CounterBloc, CounterChangeIndexState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.index == 0
              ? const Color(0xFFFF6B57)
              : state.index == 1
                  ? const Color(0xFF7BD3A5)
                  : const Color(0xFFFFC529),
          body: Stack(
            children: [
              BlocBuilder<StartPageBloc, StartPageState>(
                bloc: itemsBloc,
                builder: (context, state) {
                  if (state is StartPageLoadedState) {
                    return CarouselSlider(
                      items: state.images
                          .map(
                            (image) => Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
                          viewportFraction: 1,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            indexBloc.add(CounterChangeIndexEvent(index));
                          }),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              ScreenItems(indexState: state),
            ],
          ),
        );
      },
    );
  }
}

class ScreenItems extends StatelessWidget {
  const ScreenItems({
    Key? key,
    required this.indexState,
  }) : super(key: key);
  final CounterChangeIndexState indexState;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartPageBloc, StartPageState>(
      builder: (context, state) {
        if (state is StartPageLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 60,
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: indexState.index == 1
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                Text(
                  state.text[indexState.index],
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: indexState.index == 1 ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 50),
                const LoginButtons(),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RagisterButtons(
          btnName: 'Sing up',
          textStyle:const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          func: () {
         Navigator.pushNamed(context, AppRoutes.regPage);
          },
          btnStyle: ElevatedButton.styleFrom(
            minimumSize: const Size(155, 55),
            backgroundColor: Colors.white.withOpacity(0.21),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
         RagisterButtons(
          btnName: 'Log in',
          textStyle:const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          func: () {
              Navigator.pushNamed(context, AppRoutes.LoginPage);
          },
          btnStyle: ElevatedButton.styleFrom(
            minimumSize: const Size(155, 55),
            backgroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side:  BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
