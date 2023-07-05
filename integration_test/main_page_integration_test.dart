import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:find_cep_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Check if the screen behavior is correct', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    final btnSearch = find.byKey(const Key('btn_buscar_cep'));
    final txtfieldSearch = find.byKey(const Key('txt_field_buscar_cep'));
    expect(btnSearch, findsOneWidget);
    expect(txtfieldSearch, findsOneWidget);
    await tester.enterText(txtfieldSearch, '89870000');
    await tester.pumpAndSettle();
    await tester.tap(btnSearch);
    await tester.pump();
    final loadingWidget = find.byKey(const Key('state_loading_wigets'));
    expect(loadingWidget, findsOneWidget);
    await tester.pumpAndSettle();
    final successWidget = find.byKey(const Key('state_success_wigets'));
    expect(successWidget, findsOneWidget);
    await tester.enterText(txtfieldSearch, '00000');
    await tester.pumpAndSettle();
    await tester.tap(btnSearch);
    await tester.pump();
    final errorWidget = find.byKey(const Key('state_error_wigets'));
    expect(errorWidget, findsOneWidget);
  });
}
