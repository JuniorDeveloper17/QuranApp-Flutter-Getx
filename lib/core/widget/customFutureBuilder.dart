import 'package:flutter/material.dart';

enum AsyncState { initial, loading, error, data }

class CustomFutureBuilder<T> extends StatefulWidget {
  final Future<T> Function() futureProvider;
  final Widget Function(BuildContext, T) dataBuilder;
  final Widget Function(BuildContext) loadingBuilder;
  final Widget Function(BuildContext, Object?) errorBuilder;

  CustomFutureBuilder({
    required this.futureProvider,
    required this.dataBuilder,
    required this.loadingBuilder,
    required this.errorBuilder,
  });

  @override
  _CustomFutureBuilderState<T> createState() => _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  AsyncState _asyncState = AsyncState.initial;
  late T _data;
  late Object _error;

  @override
  Widget build(BuildContext context) {
    switch (_asyncState) {
      case AsyncState.loading:
        return widget.loadingBuilder(context);
      case AsyncState.error:
        return widget.errorBuilder(context, _error);
      case AsyncState.data:
        return widget.dataBuilder(context, _data);
      default:
        return SizedBox.shrink();
    }
  }

  void fetchData() async {
    setState(() {
      _asyncState = AsyncState.loading;
    });

    try {
      final result = await widget.futureProvider();
      setState(() {
        _asyncState = AsyncState.data;
        _data = result;
      });
    } catch (error) {
      setState(() {
        _asyncState = AsyncState.error;
        _error = error;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
}
