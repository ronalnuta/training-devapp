
clean: 
	@echo "$ Cleaning the project"
	@rm -rf pubspec.lock
	@flutter clean && flutter pub get
get:
	dart pub get
format:
	dart format .
lint:
	dart analyze
runner: 
	flutter packages pub run build_runner build
pod:
	pod update --project-directory=ios && pod install --project-directory=ios
signingReport:
	cd android && ./gradlew signingReport && cd ..
pull:
	git checkout main && git fetch && git pull levi main
# keytool -list -v -keystore android/app/release-keystore.jks -alias <key alias>

# metrics - docs: https://dcm.dev/docs/individuals/cli/
metrics:
	flutter pub get && flutter pub run dart_code_metrics:metrics lib
analyze:
	flutter pub run dart_code_metrics:metrics analyze lib
checkNull:
	flutter pub run dart_code_metrics:metrics check-unnecessary-nullable lib
checkUnusedFiles:
	flutter pub run dart_code_metrics:metrics check-unused-files lib
checkUnusedCode:
	flutter pub run dart_code_metrics:metrics check-unused-code	 lib





