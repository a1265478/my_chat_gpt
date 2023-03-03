import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_chat_gpt/utils/image_saver.dart';
import '/const/enum.dart';
import '/modules/image_generations/image_generations.dart';
import '/utils/api_service.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  void changeImageSize(String size) {
    emit(state.copyWith(imageSize: size));
  }

  void changeDescription(String text) {
    emit(state.copyWith(description: text));
  }

  Future<void> generateImage() async {
    try {
      emit(state.copyWith(responseStatus: Status.working));
      final List<ImageData> imageList =
          await ApiService.imageGeneration(state.imageSize, state.description);
      emit(state.copyWith(
          imageUrlList: imageList, responseStatus: Status.success));
    } catch (_) {
      emit(state.copyWith(responseStatus: Status.fail));
    }
  }

  Future<void> downloadImage(int index) async {
    try {
      emit(state.copyWith(
          imageUrlList: List.from(state.imageUrlList)
            ..[index] =
                state.imageUrlList[index].copyWith(status: Status.working)));
      await ImageSaver.saveImageFromUrl(state.imageUrlList[index].imageUrl);
      emit(state.copyWith(
          imageUrlList: List.from(state.imageUrlList)
            ..[index] =
                state.imageUrlList[index].copyWith(status: Status.success)));
    } catch (_) {
      emit(state.copyWith(
          imageUrlList: List.from(state.imageUrlList)
            ..[index] =
                state.imageUrlList[index].copyWith(status: Status.fail)));
    }
  }
}
