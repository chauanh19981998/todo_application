import 'package:flutter_test/flutter_test.dart';
import 'package:todo_application/widgets/task_form_widget.dart';

void main() {
  test('empty title return error', () {
    var result = TitleFieldValidator.validate('');
    expect(result, 'Title cannot be empty');
  });

  test('length of title > 3 return error', () {
    var result = TitleFieldValidator.validate('ss');
    expect(result, 'Title must have more 3 character');
  });

  test('non-empty title returns null', () {
    var result = TitleFieldValidator.validate('morning');
    expect(result, null);
  });
}
