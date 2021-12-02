import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';

void main() {
  test('should return true if name >= 5', () {
    expect(
        TaskEntity(title: "Testando", date: DateTime.now()).isValidName, true);
  });

  test('should return false if name < 5', () {
    expect(TaskEntity(title: "Test", date: DateTime.now()).isValidName, false);
  });

  test('should return false if name > 50', () {
    expect(
        TaskEntity(
                title:
                    "kmjndhcdncjancnaucidabcybacbkajbcabljcbbacabucbabcaccascascccc",
                date: DateTime.now())
            .isValidName,
        false);
  });
}
