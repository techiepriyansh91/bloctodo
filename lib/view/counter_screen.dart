import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc/counter_bloc.dart';
import '../bloc/counter_bloc/counter_events.dart';
import '../bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 50, title: const Text('Block Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previousState, currentState) =>
                  previousState.count != currentState.count,
              builder: (context, state) {
                print("build1");
                return Column(
                  children: [
                    Text(
                      'Count: ${state.count}',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: Text('Add'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
            const SizedBox(height: 50),
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previousState, currentState) =>
                  previousState.name != currentState.name,
              builder: (context, state) {
                print("build2");
                return Column(
                  children: [
                    Text(
                      'My Name: ${state.name}',
                      style: const TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(ChangeName());
              },
              child: const Text('change Name'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  color: state.isSwitchValue
                      ? Colors.green
                      : Colors.red, // Change color
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(
                          value: state.isSwitchValue,
                          onChanged: (bool value) {
                            context.read<CounterBloc>().add(SwitchChange());
                          },
                        ),
                        Text(
                          state.isSwitchValue
                              ? 'Switch is ON'
                              : 'Switch is OFF',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Container(
                  color: Colors.deepPurple.withOpacity(state.sliderValue),
                  child: Slider(
                    activeColor: Colors.lime,
                    value: state.sliderValue,
                    onChanged: (value) {
                      context
                          .read<CounterBloc>()
                          .add(SliderValueEvent(sliderValue: value));
                      print(value);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

/// [UI] ---> [Event] ---> [Bloc] ---> [State] ---> [UI Updates]
