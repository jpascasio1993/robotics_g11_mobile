import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:robotics_g11/common/widgets/abstract_stateless_widget/abstract_stateless_widget.dart';

mixin ServiceLocatorMixin on AbstractStatelessWidget {
  late GetIt serviceLocator;

  @override
  Widget build(BuildContext context) {
    serviceLocator = RepositoryProvider.of<GetIt>(context);
    return super.build(context);
  }
}
