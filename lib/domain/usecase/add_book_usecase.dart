import 'package:library_management_system/data/add_book_repository.dart';

class AddBookUsecase {
  AddBookRepository addBookRepository;
  AddBookUsecase({required this.addBookRepository});
  Future<void> pickImageFromGallery({required String imageBook, required String nameImage}) async {
    await addBookRepository.pickImageFromGallery(imageBook: imageBook, nameImage: nameImage);
  }

  Future<void> pickedFile({required String pdfPicker, required String namePdf}) async {
    await addBookRepository.pickedFile(pdfPicker: pdfPicker, namePdf: namePdf);
  }

  Future<String> uploadFileToFirebaseStorage(String filePath, String storagePath) async {
    return await addBookRepository.uploadFileToFirebaseStorage(filePath, storagePath);
  }

  Future<void> uploadDataAndFilesToFirebase({
    required String nameBook,
    required String authorBook,
    required String categoryBook,
    required String publisherBook,
    required String descriptionBook,
    required String numberOfBook,
    required String paperSizeBook,
    required String reprintBook,
    required String numberOfEditionsBook,
    required String releaseDateBook,
    required String updateDateBook,
    required String languageBook,
    required String imageBook,
    required String pdfPicker,
  }) async {
    await addBookRepository.uploadDataAndFilesToFirebase(
      nameBook: nameBook,
      authorBook: authorBook,
      categoryBook: categoryBook,
      publisherBook: publisherBook,
      descriptionBook: descriptionBook,
      numberOfBook: numberOfBook,
      paperSizeBook: paperSizeBook,
      reprintBook: reprintBook,
      numberOfEditionsBook: numberOfEditionsBook,
      releaseDateBook: releaseDateBook,
      updateDateBook: updateDateBook,
      languageBook: languageBook,
      imageBook: imageBook,
      pdfPicker: pdfPicker,
    );
  }
}
