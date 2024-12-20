import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

part 'app_banner_top_state.dart';

class AppBannerTopCubit extends Cubit<AppBannerTopState> {
  AppBannerTopCubit() : super(AppBannerTopState.init());
  void updateNavigationEvent({required ResponsiveBreakpointsData data,required GlobalKey headerKey}) {

    if (!state.isActiveBannerTop && data.screenWidth < 430) return;
    if (data.screenWidth < 430) {
      emit(state.copyWitch(isActiveBannerTop: false));
    } else {
      RenderBox? box =
      headerKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        Offset position = box.localToGlobal(Offset.zero);
        // Obtén las dimensiones visibles del área de scroll
        double screenHeight = data.screenHeight;
        // Verifica si el widget está dentro del rango visible
        // true cuando esta renderizado y false cuando no.
        if (position.dy < screenHeight && position.dy + box.size.height > 0) {
          if (state.isActiveBannerTop) {
            emit(state.copyWitch(isActiveBannerTop: false));
          }
        } else {
          if (!state.isActiveBannerTop) {
            emit(state.copyWitch(isActiveBannerTop: true));
          }
        }
      }
    }
  }
}
