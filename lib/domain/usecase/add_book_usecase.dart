import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_system/data/add_book_repository.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class AddBookUsecase {
  AddBookRepository addBookRepository;
  AddBookUsecase({required this.addBookRepository});
  Future<void> pickImageFromGallery({required String imageBook, required String nameImage}) async {
    await addBookRepository.pickImageFromGallery(imageBook: imageBook, nameImage: nameImage);
  }

  Future<UserModel> getUserById(String id) async {
    return await addBookRepository.getUserById(id);
  }

  Future<void> pickedFile({required String pdfPicker, required String namePdf}) async {
    await addBookRepository.pickedFile(pdfPicker: pdfPicker, namePdf: namePdf);
  }

  Future<String> uploadFileToFirebaseStorage(String filePath, String storagePath) async {
    return await addBookRepository.uploadFileToFirebaseStorage(filePath, storagePath);
  }

  User? getCurrentUser() {
    return addBookRepository.getCurrentUser();
  }

  Future<void> upDocumentToDB({
    required String nameBook,
    required String authorBook,
    required String categoryBook,
    required String publisherBook,
    required String descriptionBook,
    required String numberOfBook,
    required String paperSizeBook,
    required String reprintBook,
    required String numberOfEditionsBook,
    required DateTime releaseDateBook,
    required String languageBook,
    required String imageBook,
    required String pdfPicker,
    required String idPoster,
    required String namePoster,
  }) async {
    await addBookRepository.upDocumentToDB(
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
      languageBook: languageBook,
      imageBook: imageBook,
      pdfPicker: pdfPicker,
      idPoster: idPoster,
      namePoster: namePoster,
    );
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
      languageBook: languageBook,
      imageBook: imageBook,
      pdfPicker: pdfPicker,
    );
  }
}
