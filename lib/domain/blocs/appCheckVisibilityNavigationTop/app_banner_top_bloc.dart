import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

part 'app_banner_top_event.dart';
part 'app_banner_top_state.dart';

class AppBannerTopBloc extends Bloc<AppBannerTopEvent, AppBannerTopState> {
  AppBannerTopBloc() : super(AppBannerTopState.init()) {
    on<UpdateNavigationEvent>((event, emit) {
      ResponsiveBreakpointsData breakpointsData =
          ResponsiveBreakpoints.of(event.context);
      if (breakpointsData.isMobile) return;
      RenderBox? box =
          event.headerKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        Offset position = box.localToGlobal(Offset.zero);
        // Obtén las dimensiones visibles del área de scroll
        double screenHeight = breakpointsData.screenHeight;
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
    });
  }
}
