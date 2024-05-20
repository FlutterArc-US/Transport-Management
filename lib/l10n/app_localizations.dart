import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @loginToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to your Account'**
  String get loginToYourAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @viaPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'via Phone Number'**
  String get viaPhoneNumber;

  /// No description provided for @viaDrivingLicense.
  ///
  /// In en, this message translates to:
  /// **'via Driving License'**
  String get viaDrivingLicense;

  /// No description provided for @platformDescription.
  ///
  /// In en, this message translates to:
  /// **'We connect shippers and carriers to haul together. Find and book loads for you and your fleet, easily upload documents, and get paid quickly with the tap of a button.'**
  String get platformDescription;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAnAccount;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @doNotHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get doNotHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @enterYourPhoneNumberToRecoverYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to recover\nyour password.'**
  String get enterYourPhoneNumberToRecoverYourPassword;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verificationOTP.
  ///
  /// In en, this message translates to:
  /// **'Verification OTP'**
  String get verificationOTP;

  /// No description provided for @enter4DigitOTP.
  ///
  /// In en, this message translates to:
  /// **'Enter 4-digit OTP, sent on your phone number'**
  String get enter4DigitOTP;

  /// No description provided for @resendOTPin.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP in '**
  String get resendOTPin;

  /// No description provided for @countSeconds.
  ///
  /// In en, this message translates to:
  /// **'{count} seconds'**
  String countSeconds(int count);

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @resetYourPasswordToLoginInToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Reset your password to login to your account'**
  String get resetYourPasswordToLoginInToYourAccount;

  /// No description provided for @updatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get updatePassword;

  /// No description provided for @chooseProfileType.
  ///
  /// In en, this message translates to:
  /// **'Choose Profile Type'**
  String get chooseProfileType;

  /// No description provided for @stepNumber.
  ///
  /// In en, this message translates to:
  /// **'Step {number}'**
  String stepNumber(int number);

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @ownVehicle.
  ///
  /// In en, this message translates to:
  /// **'Own Vehicle'**
  String get ownVehicle;

  /// No description provided for @vehicleOwnershipAndBooking.
  ///
  /// In en, this message translates to:
  /// **'Vehicle is owned by Fleet Company. You drive the vehicle and can book loads yourself or they will be assigned by the Fleet Company.'**
  String get vehicleOwnershipAndBooking;

  /// No description provided for @personalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personalDetails;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @fleetCompanyDetails.
  ///
  /// In en, this message translates to:
  /// **'Fleet Company Details'**
  String get fleetCompanyDetails;

  /// No description provided for @fleetCompanyID.
  ///
  /// In en, this message translates to:
  /// **'Fleet company ID'**
  String get fleetCompanyID;

  /// No description provided for @iAcceptTheTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'I accept the terms and conditions.'**
  String get iAcceptTheTermsAndConditions;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @verifyPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Verify Phone Number'**
  String get verifyPhoneNumber;

  /// No description provided for @verifyAndCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Verify and Create Account'**
  String get verifyAndCreateAccount;

  /// No description provided for @verifyPhoneNumberWithOTP.
  ///
  /// In en, this message translates to:
  /// **'Please verify your phone number by entering the OTP sent to your cellphone.'**
  String get verifyPhoneNumberWithOTP;

  /// No description provided for @accountUnderVerification.
  ///
  /// In en, this message translates to:
  /// **'Account Under Verification'**
  String get accountUnderVerification;

  /// No description provided for @confirmationEmailUponVerification.
  ///
  /// In en, this message translates to:
  /// **'You will receive a confirmation email once your account is verified by the Fleet Company you selected.'**
  String get confirmationEmailUponVerification;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @vehicleOwnershipAndBookingAuthority.
  ///
  /// In en, this message translates to:
  /// **'You own your vehicle and have authority to book loads yourself.'**
  String get vehicleOwnershipAndBookingAuthority;

  /// No description provided for @vehicleLicenseNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicle license number'**
  String get vehicleLicenseNumber;

  /// No description provided for @drivingLicenseNumber.
  ///
  /// In en, this message translates to:
  /// **'Driving license number'**
  String get drivingLicenseNumber;

  /// No description provided for @selectVehicleType.
  ///
  /// In en, this message translates to:
  /// **'Select Vehicle Type'**
  String get selectVehicleType;

  /// No description provided for @vehicleDetails.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Details'**
  String get vehicleDetails;

  /// No description provided for @manageVehicle.
  ///
  /// In en, this message translates to:
  /// **'Manage Vehicle'**
  String get manageVehicle;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @withdrawals.
  ///
  /// In en, this message translates to:
  /// **'Withdrawals'**
  String get withdrawals;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get terms;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @didNotReceiveACode.
  ///
  /// In en, this message translates to:
  /// **'Didn’t receive a code?'**
  String get didNotReceiveACode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @yourAccountHasComeToLife.
  ///
  /// In en, this message translates to:
  /// **'Your account has come to life'**
  String get yourAccountHasComeToLife;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password changed'**
  String get passwordChanged;

  /// No description provided for @congratulationsYouHaveSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You have successfully'**
  String get congratulationsYouHaveSuccessfully;

  /// No description provided for @changedYourPassword.
  ///
  /// In en, this message translates to:
  /// **'changed your password'**
  String get changedYourPassword;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @switchAccount.
  ///
  /// In en, this message translates to:
  /// **'Switch Account'**
  String get switchAccount;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clearCache;

  /// No description provided for @policy.
  ///
  /// In en, this message translates to:
  /// **'Policy'**
  String get policy;

  /// No description provided for @completeProfile.
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get completeProfile;

  /// No description provided for @openAppSettings.
  ///
  /// In en, this message translates to:
  /// **'Open app settings'**
  String get openAppSettings;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @allowPermission.
  ///
  /// In en, this message translates to:
  /// **'Allow Permission'**
  String get allowPermission;

  /// No description provided for @allowApplicationToAccessYourStorageWhileYouUseTheApp.
  ///
  /// In en, this message translates to:
  /// **'Allow application to access your storage while you use the App'**
  String get allowApplicationToAccessYourStorageWhileYouUseTheApp;

  /// No description provided for @allowApplicationToAccessYourCameraWhileYouUseTheApp.
  ///
  /// In en, this message translates to:
  /// **'Allow application to access your camera while you use the App'**
  String get allowApplicationToAccessYourCameraWhileYouUseTheApp;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!'**
  String get somethingWentWrong;

  /// No description provided for @fileNotSupported.
  ///
  /// In en, this message translates to:
  /// **'File not Supported'**
  String get fileNotSupported;

  /// No description provided for @storagePermissionIsDenied.
  ///
  /// In en, this message translates to:
  /// **'Storage permission is denied'**
  String get storagePermissionIsDenied;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get en;

  /// No description provided for @gr.
  ///
  /// In en, this message translates to:
  /// **'GR'**
  String get gr;

  /// No description provided for @passwordShouldBeAtLeast8Characters.
  ///
  /// In en, this message translates to:
  /// **'Password should be at least 8 characters'**
  String get passwordShouldBeAtLeast8Characters;

  /// No description provided for @enterConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter confirm password'**
  String get enterConfirmPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @enterAValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterAValidEmail;

  /// No description provided for @enterAnEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter an email'**
  String get enterAnEmail;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhoneNumber;

  /// No description provided for @enterAValidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid phone number'**
  String get enterAValidPhoneNumber;

  /// No description provided for @enterAValidName.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid name'**
  String get enterAValidName;

  /// No description provided for @nameShouldBeAtLeast2Characters.
  ///
  /// In en, this message translates to:
  /// **'Name should be at least 2 characters'**
  String get nameShouldBeAtLeast2Characters;

  /// No description provided for @iAcceptThe.
  ///
  /// In en, this message translates to:
  /// **'I accept the'**
  String get iAcceptThe;

  /// No description provided for @iAccept.
  ///
  /// In en, this message translates to:
  /// **'I Accept'**
  String get iAccept;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @acceptTermsOfServiceAndPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Accept terms of service and privacy policy'**
  String get acceptTermsOfServiceAndPrivacyPolicy;

  /// No description provided for @unableToLaunch.
  ///
  /// In en, this message translates to:
  /// **'Unable to launch'**
  String get unableToLaunch;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @pleaseEnterANewPasswordForYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a new password for your account'**
  String get pleaseEnterANewPasswordForYourAccount;

  /// No description provided for @areYouSureYouWantToDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account'**
  String get areYouSureYouWantToDeleteAccount;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @areYouSureYouWantToExitTheApp.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit the application?'**
  String get areYouSureYouWantToExitTheApp;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @amountWithCurrency.
  ///
  /// In en, this message translates to:
  /// **'{price}'**
  String amountWithCurrency(num price);

  /// No description provided for @noMatchingLoads.
  ///
  /// In en, this message translates to:
  /// **'No Matching Loads'**
  String get noMatchingLoads;

  /// No description provided for @postTruck.
  ///
  /// In en, this message translates to:
  /// **'Post Truck'**
  String get postTruck;

  /// No description provided for @myLoads.
  ///
  /// In en, this message translates to:
  /// **'My Loads'**
  String get myLoads;

  /// No description provided for @book.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get book;

  /// No description provided for @pastLoads.
  ///
  /// In en, this message translates to:
  /// **'Past Loads'**
  String get pastLoads;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @truckOrReefer.
  ///
  /// In en, this message translates to:
  /// **'Truck/Reefer'**
  String get truckOrReefer;

  /// No description provided for @postingForDate.
  ///
  /// In en, this message translates to:
  /// **'Posting for {date}'**
  String postingForDate(String date);

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get pickup;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @whereYouWillBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Where you will be empty?'**
  String get whereYouWillBeEmpty;

  /// No description provided for @enterYourLocationHere.
  ///
  /// In en, this message translates to:
  /// **'Enter your location here'**
  String get enterYourLocationHere;

  /// No description provided for @travelling.
  ///
  /// In en, this message translates to:
  /// **'Travelling'**
  String get travelling;

  /// No description provided for @local.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get local;

  /// No description provided for @upto.
  ///
  /// In en, this message translates to:
  /// **'Upto'**
  String get upto;

  /// No description provided for @short.
  ///
  /// In en, this message translates to:
  /// **'Short'**
  String get short;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @long.
  ///
  /// In en, this message translates to:
  /// **'Long'**
  String get long;

  /// No description provided for @over.
  ///
  /// In en, this message translates to:
  /// **'over'**
  String get over;

  /// No description provided for @filterBy.
  ///
  /// In en, this message translates to:
  /// **'Filter By'**
  String get filterBy;

  /// No description provided for @truckPostedSuccesfully.
  ///
  /// In en, this message translates to:
  /// **'Truck Posted Successfully'**
  String get truckPostedSuccesfully;

  /// No description provided for @viewMatchesAndNotifications.
  ///
  /// In en, this message translates to:
  /// **'You can view your matches in Booked loads and will also get notifications on new matches.'**
  String get viewMatchesAndNotifications;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @sortByPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get sortByPrice;

  /// No description provided for @sortByWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get sortByWeight;

  /// No description provided for @sortByDeadhead.
  ///
  /// In en, this message translates to:
  /// **'Deadhead'**
  String get sortByDeadhead;

  /// No description provided for @applySort.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applySort;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortBy;

  /// No description provided for @loadsSuggestedBasedOnHistory.
  ///
  /// In en, this message translates to:
  /// **'Loads suggested for you based on your load and browsing history.'**
  String get loadsSuggestedBasedOnHistory;

  /// No description provided for @forYou.
  ///
  /// In en, this message translates to:
  /// **'For You'**
  String get forYou;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @deadhead.
  ///
  /// In en, this message translates to:
  /// **'Deadhead'**
  String get deadhead;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @loadDetails.
  ///
  /// In en, this message translates to:
  /// **'Load Details'**
  String get loadDetails;

  /// No description provided for @loadId.
  ///
  /// In en, this message translates to:
  /// **'Load ID #'**
  String get loadId;

  /// No description provided for @ratePerMile.
  ///
  /// In en, this message translates to:
  /// **'Rate per mile'**
  String get ratePerMile;

  /// No description provided for @packageType.
  ///
  /// In en, this message translates to:
  /// **'Package Type'**
  String get packageType;

  /// No description provided for @commodity.
  ///
  /// In en, this message translates to:
  /// **'Commodity'**
  String get commodity;

  /// No description provided for @bookLoad.
  ///
  /// In en, this message translates to:
  /// **'Book Load'**
  String get bookLoad;

  /// No description provided for @pickupDetails.
  ///
  /// In en, this message translates to:
  /// **'Pickup Details'**
  String get pickupDetails;

  /// No description provided for @deliveryDetails.
  ///
  /// In en, this message translates to:
  /// **'Delivery Details'**
  String get deliveryDetails;

  /// No description provided for @bbDistributions.
  ///
  /// In en, this message translates to:
  /// **'BB Distributions'**
  String get bbDistributions;

  /// No description provided for @viewOnMap.
  ///
  /// In en, this message translates to:
  /// **'View On Map'**
  String get viewOnMap;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @referenceNumber.
  ///
  /// In en, this message translates to:
  /// **'Reference Number'**
  String get referenceNumber;

  /// No description provided for @purchaseOrder.
  ///
  /// In en, this message translates to:
  /// **'Purchase Order #'**
  String get purchaseOrder;

  /// No description provided for @pickupNumber.
  ///
  /// In en, this message translates to:
  /// **'Pickup #'**
  String get pickupNumber;

  /// No description provided for @additionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Additional Details'**
  String get additionalDetails;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @restrooms.
  ///
  /// In en, this message translates to:
  /// **'Restrooms'**
  String get restrooms;

  /// No description provided for @onsiteScale.
  ///
  /// In en, this message translates to:
  /// **'On-site scale'**
  String get onsiteScale;

  /// No description provided for @countRatings.
  ///
  /// In en, this message translates to:
  /// **'{count} ratings'**
  String countRatings(int count);

  /// No description provided for @mostRecentReviews.
  ///
  /// In en, this message translates to:
  /// **'Most Recent Reviews'**
  String get mostRecentReviews;

  /// No description provided for @pickupByUserOnDate.
  ///
  /// In en, this message translates to:
  /// **'Pickup by {username} on {date}'**
  String pickupByUserOnDate(String username, DateTime date);

  /// No description provided for @trailer.
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get trailer;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// No description provided for @earlyWithdraw.
  ///
  /// In en, this message translates to:
  /// **'Early Withdraw'**
  String get earlyWithdraw;

  /// No description provided for @withdrawalRequests.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Requests'**
  String get withdrawalRequests;

  /// No description provided for @unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get unpaid;

  /// No description provided for @withdrawFunds.
  ///
  /// In en, this message translates to:
  /// **'Withdraw Funds'**
  String get withdrawFunds;

  /// No description provided for @manageBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Manage Bank Account'**
  String get manageBankAccount;

  /// No description provided for @additionalChargeNote.
  ///
  /// In en, this message translates to:
  /// **'Note: 3% additional charges will be applied on Early Withdrawal Amount only'**
  String get additionalChargeNote;

  /// No description provided for @specifyAmount.
  ///
  /// In en, this message translates to:
  /// **'Specify Amount'**
  String get specifyAmount;

  /// No description provided for @messageOptional.
  ///
  /// In en, this message translates to:
  /// **'Message (Optional)'**
  String get messageOptional;

  /// No description provided for @typeHere.
  ///
  /// In en, this message translates to:
  /// **'Type here'**
  String get typeHere;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @accountTitle.
  ///
  /// In en, this message translates to:
  /// **'Account Title'**
  String get accountTitle;

  /// No description provided for @iban.
  ///
  /// In en, this message translates to:
  /// **'IBAN'**
  String get iban;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @bankUpdated.
  ///
  /// In en, this message translates to:
  /// **'Bank Updated'**
  String get bankUpdated;

  /// No description provided for @bankDetailsUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your bank details have been updated successfully!'**
  String get bankDetailsUpdatedSuccess;

  /// No description provided for @submitRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit Request'**
  String get submitRequest;

  /// No description provided for @requestSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Request Submitted'**
  String get requestSubmitted;

  /// No description provided for @withdrawalRequestSubmittedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your withdrawal request has been submitted successfully!'**
  String get withdrawalRequestSubmittedSuccess;

  /// No description provided for @manageBank.
  ///
  /// In en, this message translates to:
  /// **'Manage Bank'**
  String get manageBank;

  /// No description provided for @beneficiaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Title'**
  String get beneficiaryTitle;

  /// No description provided for @paymentReleased.
  ///
  /// In en, this message translates to:
  /// **'Payment released'**
  String get paymentReleased;

  /// No description provided for @pendingApproval.
  ///
  /// In en, this message translates to:
  /// **'Pending for Approval'**
  String get pendingApproval;

  /// No description provided for @pendingPayment.
  ///
  /// In en, this message translates to:
  /// **'Pending for Payment'**
  String get pendingPayment;

  /// No description provided for @podSubmittedNotApproved.
  ///
  /// In en, this message translates to:
  /// **'POD Submitted but not approved'**
  String get podSubmittedNotApproved;

  /// No description provided for @podApprovedPaymentNotReleased.
  ///
  /// In en, this message translates to:
  /// **'POD Approved, payment not released'**
  String get podApprovedPaymentNotReleased;

  /// No description provided for @podNotUploaded.
  ///
  /// In en, this message translates to:
  /// **'POD not uploaded'**
  String get podNotUploaded;

  /// No description provided for @uploadPodForPayment.
  ///
  /// In en, this message translates to:
  /// **'Upload POD for payment'**
  String get uploadPodForPayment;

  /// No description provided for @refunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get refunded;

  /// No description provided for @paymentRefunded.
  ///
  /// In en, this message translates to:
  /// **'Payment is refunded'**
  String get paymentRefunded;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @fee.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get fee;

  /// No description provided for @earnings.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get earnings;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// No description provided for @net.
  ///
  /// In en, this message translates to:
  /// **'Net'**
  String get net;

  /// No description provided for @appointment.
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get appointment;

  /// No description provided for @seeAllCountReloadOptions.
  ///
  /// In en, this message translates to:
  /// **'See all {count} reload options'**
  String seeAllCountReloadOptions(int count);

  /// No description provided for @confirmBooking.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to book this load?'**
  String get confirmBooking;

  /// No description provided for @loadBooking.
  ///
  /// In en, this message translates to:
  /// **'Load Booking'**
  String get loadBooking;

  /// No description provided for @dropOffLocation.
  ///
  /// In en, this message translates to:
  /// **'You’re dropping off load at San Antonio, TX. Do you also want to see the other loads?'**
  String get dropOffLocation;

  /// No description provided for @loadBookedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Load is booked successfully. Let\'s deliver it to complete the job.'**
  String get loadBookedSuccess;

  /// No description provided for @viewReloads.
  ///
  /// In en, this message translates to:
  /// **'View Reloads'**
  String get viewReloads;

  /// No description provided for @loadBooked.
  ///
  /// In en, this message translates to:
  /// **'Load Booked'**
  String get loadBooked;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @requestChange.
  ///
  /// In en, this message translates to:
  /// **'Request Change'**
  String get requestChange;

  /// No description provided for @callOurSupport.
  ///
  /// In en, this message translates to:
  /// **'Call our Support'**
  String get callOurSupport;

  /// No description provided for @emailOurSupport.
  ///
  /// In en, this message translates to:
  /// **'Email our Support'**
  String get emailOurSupport;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendRequest;

  /// No description provided for @requestUpdate.
  ///
  /// In en, this message translates to:
  /// **'Request Update'**
  String get requestUpdate;

  /// No description provided for @licenseNumberHere.
  ///
  /// In en, this message translates to:
  /// **'License Number Here'**
  String get licenseNumberHere;

  /// No description provided for @drivingNumberHere.
  ///
  /// In en, this message translates to:
  /// **'Driving Number Here'**
  String get drivingNumberHere;

  /// No description provided for @enterYourRequest.
  ///
  /// In en, this message translates to:
  /// **'Enter your request'**
  String get enterYourRequest;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @joinIndividuallyOrFleet.
  ///
  /// In en, this message translates to:
  /// **'Join Individually Or Part Of Fleet'**
  String get joinIndividuallyOrFleet;

  /// No description provided for @bookYourLoad.
  ///
  /// In en, this message translates to:
  /// **'Book Your Load'**
  String get bookYourLoad;

  /// No description provided for @useAIToBoostMatch.
  ///
  /// In en, this message translates to:
  /// **'Use AI To Boost Match'**
  String get useAIToBoostMatch;

  /// No description provided for @earnAndSeeReports.
  ///
  /// In en, this message translates to:
  /// **'Earn & See Reports'**
  String get earnAndSeeReports;

  /// No description provided for @soloDriver.
  ///
  /// In en, this message translates to:
  /// **'You can own your vehicle and become a solo driver.'**
  String get soloDriver;

  /// No description provided for @learnGrowSucceed.
  ///
  /// In en, this message translates to:
  /// **'Learn, grow, and succeed with our app\'s diverse educational resources, interactive lessons, and personalized learning experiences.'**
  String get learnGrowSucceed;

  /// No description provided for @unlockPotential.
  ///
  /// In en, this message translates to:
  /// **'Unlock your potential with interactive courses and expert instructors at your fingertips.'**
  String get unlockPotential;

  /// No description provided for @learnAnytimeAnywhere.
  ///
  /// In en, this message translates to:
  /// **'Learn anytime, anywhere, with a vast library of educational content and personalized study plans.'**
  String get learnAnytimeAnywhere;

  /// No description provided for @booked.
  ///
  /// In en, this message translates to:
  /// **'Booked'**
  String get booked;

  /// No description provided for @past.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get past;

  /// No description provided for @currentActiveLoad.
  ///
  /// In en, this message translates to:
  /// **'Current active load'**
  String get currentActiveLoad;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In-Progress'**
  String get inProgress;

  /// No description provided for @docsNeeded.
  ///
  /// In en, this message translates to:
  /// **'Docs Needed'**
  String get docsNeeded;

  /// No description provided for @uploadPod.
  ///
  /// In en, this message translates to:
  /// **'Upload POD'**
  String get uploadPod;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to Logout?'**
  String get logoutConfirmation;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @backToFaq.
  ///
  /// In en, this message translates to:
  /// **'Back To FAQ'**
  String get backToFaq;

  /// No description provided for @preTrip.
  ///
  /// In en, this message translates to:
  /// **'Pre-trip'**
  String get preTrip;

  /// No description provided for @completeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Complete Delivery'**
  String get completeDelivery;

  /// No description provided for @confirmDelivery.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you have delivered the Load?'**
  String get confirmDelivery;

  /// No description provided for @loadDelivered.
  ///
  /// In en, this message translates to:
  /// **'Load Delivered'**
  String get loadDelivered;

  /// No description provided for @uploadPOD.
  ///
  /// In en, this message translates to:
  /// **'Please upload POD (Proof of Delivery) so your carrier payment can be cleared.'**
  String get uploadPOD;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notNow;

  /// No description provided for @chooseOption.
  ///
  /// In en, this message translates to:
  /// **'Choose An Option'**
  String get chooseOption;

  /// No description provided for @phoneGallery.
  ///
  /// In en, this message translates to:
  /// **'Phone Gallery'**
  String get phoneGallery;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open Camera'**
  String get openCamera;

  /// No description provided for @docSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Doc Submitted'**
  String get docSubmitted;

  /// No description provided for @podSubmittedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your POD (Proof of Delivery) has been submitted. Your carrier will be paid (in scheduled dates) upon approval of documents.'**
  String get podSubmittedSuccess;

  /// No description provided for @pod.
  ///
  /// In en, this message translates to:
  /// **'POD'**
  String get pod;

  /// No description provided for @addImages.
  ///
  /// In en, this message translates to:
  /// **'Add Images'**
  String get addImages;

  /// No description provided for @submitPOD.
  ///
  /// In en, this message translates to:
  /// **'Submit POD'**
  String get submitPOD;

  /// No description provided for @pickupExperience.
  ///
  /// In en, this message translates to:
  /// **'How was your pickup?'**
  String get pickupExperience;

  /// No description provided for @deliveryExperience.
  ///
  /// In en, this message translates to:
  /// **'How was your delivery?'**
  String get deliveryExperience;

  /// No description provided for @ratePickup.
  ///
  /// In en, this message translates to:
  /// **'Rate Pickup'**
  String get ratePickup;

  /// No description provided for @rateDelivery.
  ///
  /// In en, this message translates to:
  /// **'Rate Delivery'**
  String get rateDelivery;

  /// No description provided for @thisActionCantUndoneYourAccountWillBePermanentlyDeleted.
  ///
  /// In en, this message translates to:
  /// **'This action can’t undone,\nYour account will be permanently deleted.'**
  String get thisActionCantUndoneYourAccountWillBePermanentlyDeleted;

  /// No description provided for @deleteAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete Account?'**
  String get deleteAccountQuestion;

  /// No description provided for @changeRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Change Request Sent'**
  String get changeRequestSent;

  /// No description provided for @yourRequestForChangeInTheVehicleHasBeenSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your request for change in the vehicle has been sent successfully'**
  String get yourRequestForChangeInTheVehicleHasBeenSentSuccessfully;

  /// No description provided for @addBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Bank Account'**
  String get addBankAccount;

  /// No description provided for @otpSentToYourPhone.
  ///
  /// In en, this message translates to:
  /// **'OTP has been sent to your phone'**
  String get otpSentToYourPhone;

  /// No description provided for @profileUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your profile has been updated successfully'**
  String get profileUpdatedSuccessfully;

  /// No description provided for @otpVerifiedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'OTP has been verified successfully'**
  String get otpVerifiedSuccessfully;

  /// No description provided for @enterAValidOTP.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid OTP'**
  String get enterAValidOTP;

  /// No description provided for @accountDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account has been deleted successfully'**
  String get accountDeletedSuccessfully;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @confirmationEmailUponVerificationByAdmin.
  ///
  /// In en, this message translates to:
  /// **'You will receive a confirmation email once your account is verified by Avcons admin.'**
  String get confirmationEmailUponVerificationByAdmin;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @routeToday.
  ///
  /// In en, this message translates to:
  /// **'Route Today'**
  String get routeToday;

  /// No description provided for @confirmStartRide.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to start this ride?'**
  String get confirmStartRide;

  /// No description provided for @rideStarted.
  ///
  /// In en, this message translates to:
  /// **'Ride Started. Have a safe Journey!'**
  String get rideStarted;

  /// No description provided for @thanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks!'**
  String get thanks;

  /// No description provided for @startTheRide.
  ///
  /// In en, this message translates to:
  /// **'Start the Ride'**
  String get startTheRide;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @tripDetails.
  ///
  /// In en, this message translates to:
  /// **'Trip Details'**
  String get tripDetails;

  /// No description provided for @trackYourJourney.
  ///
  /// In en, this message translates to:
  /// **'Track your Journey'**
  String get trackYourJourney;

  /// No description provided for @upcomingSchedule.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Schedule'**
  String get upcomingSchedule;

  /// No description provided for @pastTrips.
  ///
  /// In en, this message translates to:
  /// **'Past Trips'**
  String get pastTrips;

  /// No description provided for @recordYourMatters.
  ///
  /// In en, this message translates to:
  /// **'Record your Matters'**
  String get recordYourMatters;

  /// No description provided for @recordFaultExpense.
  ///
  /// In en, this message translates to:
  /// **'Record Fault / Expense'**
  String get recordFaultExpense;

  /// No description provided for @leaves.
  ///
  /// In en, this message translates to:
  /// **'Leaves'**
  String get leaves;

  /// No description provided for @reviewAndWiki.
  ///
  /// In en, this message translates to:
  /// **'Review & Wiki'**
  String get reviewAndWiki;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @extras.
  ///
  /// In en, this message translates to:
  /// **'Extras'**
  String get extras;

  /// No description provided for @reportFault.
  ///
  /// In en, this message translates to:
  /// **'Report Fault'**
  String get reportFault;

  /// No description provided for @recordExpense.
  ///
  /// In en, this message translates to:
  /// **'Record Expense'**
  String get recordExpense;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @typeMessageHere.
  ///
  /// In en, this message translates to:
  /// **'Type message here'**
  String get typeMessageHere;

  /// No description provided for @attachPictures.
  ///
  /// In en, this message translates to:
  /// **'Attach Pictures'**
  String get attachPictures;

  /// No description provided for @reportAFault.
  ///
  /// In en, this message translates to:
  /// **'Report A Fault'**
  String get reportAFault;

  /// No description provided for @faultReported.
  ///
  /// In en, this message translates to:
  /// **'Fault Reported'**
  String get faultReported;

  /// No description provided for @faultRequestSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your request for change in the vehicle has been sent successfully'**
  String get faultRequestSuccess;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @selectType.
  ///
  /// In en, this message translates to:
  /// **'Select Type'**
  String get selectType;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get enterAmount;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @attachReceipt.
  ///
  /// In en, this message translates to:
  /// **'Attach Receipt'**
  String get attachReceipt;

  /// No description provided for @recordAnExpense.
  ///
  /// In en, this message translates to:
  /// **'Record An Expense'**
  String get recordAnExpense;

  /// No description provided for @searchHere.
  ///
  /// In en, this message translates to:
  /// **'Search Here'**
  String get searchHere;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @expenseRecorded.
  ///
  /// In en, this message translates to:
  /// **'Expense Recorded'**
  String get expenseRecorded;

  /// No description provided for @expenseRequestSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your request for change in the vehicle has been sent successfully'**
  String get expenseRequestSuccess;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @sick.
  ///
  /// In en, this message translates to:
  /// **'Sick'**
  String get sick;

  /// No description provided for @tapForLeaveDetails.
  ///
  /// In en, this message translates to:
  /// **'Tap on any date to see details about leave'**
  String get tapForLeaveDetails;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @applyForLeave.
  ///
  /// In en, this message translates to:
  /// **'Apply For Leave'**
  String get applyForLeave;

  /// No description provided for @leaveStatus.
  ///
  /// In en, this message translates to:
  /// **'Leave Status'**
  String get leaveStatus;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @typeReasonHere.
  ///
  /// In en, this message translates to:
  /// **'Type reason here'**
  String get typeReasonHere;

  /// No description provided for @leaveRequestSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your leave request was sent successfully!'**
  String get leaveRequestSuccess;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @singleDay.
  ///
  /// In en, this message translates to:
  /// **'Single day'**
  String get singleDay;

  /// No description provided for @multiDay.
  ///
  /// In en, this message translates to:
  /// **'Multi-day'**
  String get multiDay;

  /// No description provided for @enterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter Pin'**
  String get enterPin;

  /// No description provided for @forgotYourPin.
  ///
  /// In en, this message translates to:
  /// **'Forgot Your Pin?'**
  String get forgotYourPin;

  /// No description provided for @enterYourPinToLogin.
  ///
  /// In en, this message translates to:
  /// **'Enter your pin to login'**
  String get enterYourPinToLogin;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
