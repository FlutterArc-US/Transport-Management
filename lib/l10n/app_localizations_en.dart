import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome';

  @override
  String get loginToYourAccount => 'Login to your Account';

  @override
  String get login => 'Login';

  @override
  String get viaPhoneNumber => 'via Phone Number';

  @override
  String get viaDrivingLicense => 'via Driving License';

  @override
  String get platformDescription => 'We connect shippers and carriers to haul together. Find and book loads for you and your fleet, easily upload documents, and get paid quickly with the tap of a button.';

  @override
  String get createAnAccount => 'Create an account';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get doNotHaveAnAccount => 'Don’t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get enterYourPhoneNumberToRecoverYourPassword => 'Enter your phone number to recover\nyour password.';

  @override
  String get verify => 'Verify';

  @override
  String get verificationOTP => 'Verification OTP';

  @override
  String get enter4DigitOTP => 'Enter 4-digit OTP, sent on your phone number';

  @override
  String get resendOTPin => 'Resend OTP in ';

  @override
  String countSeconds(int count) {
    return '$count seconds';
  }

  @override
  String get newPassword => 'New password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get resetYourPasswordToLoginInToYourAccount => 'Reset your password to login to your account';

  @override
  String get updatePassword => 'Update Password';

  @override
  String get chooseProfileType => 'Choose Profile Type';

  @override
  String stepNumber(int number) {
    return 'Step $number';
  }

  @override
  String get driver => 'Driver';

  @override
  String get ownVehicle => 'Own Vehicle';

  @override
  String get vehicleOwnershipAndBooking => 'Vehicle is owned by Fleet Company. You drive the vehicle and can book loads yourself or they will be assigned by the Fleet Company.';

  @override
  String get personalDetails => 'Personal Details';

  @override
  String get fullName => 'Full name';

  @override
  String get fleetCompanyDetails => 'Fleet Company Details';

  @override
  String get fleetCompanyID => 'Fleet company ID';

  @override
  String get iAcceptTheTermsAndConditions => 'I accept the terms and conditions.';

  @override
  String get next => 'Next';

  @override
  String get verifyPhoneNumber => 'Verify Phone Number';

  @override
  String get verifyAndCreateAccount => 'Verify and Create Account';

  @override
  String get verifyPhoneNumberWithOTP => 'Please verify your phone number by entering the OTP sent to your cellphone.';

  @override
  String get accountUnderVerification => 'Account Under Verification';

  @override
  String get confirmationEmailUponVerification => 'You will receive a confirmation email once your account is verified by the Fleet Company you selected.';

  @override
  String get done => 'Done';

  @override
  String get vehicleOwnershipAndBookingAuthority => 'You own your vehicle and have authority to book loads yourself.';

  @override
  String get vehicleLicenseNumber => 'Vehicle license number';

  @override
  String get drivingLicenseNumber => 'Driving license number';

  @override
  String get selectVehicleType => 'Select Vehicle Type';

  @override
  String get vehicleDetails => 'Vehicle Details';

  @override
  String get manageVehicle => 'Manage Vehicle';

  @override
  String get transactions => 'Transactions';

  @override
  String get withdrawals => 'Withdrawals';

  @override
  String get reports => 'Reports';

  @override
  String get about => 'About';

  @override
  String get terms => 'Terms';

  @override
  String get support => 'Support';

  @override
  String get faqs => 'FAQs';

  @override
  String get settings => 'Settings';

  @override
  String get didNotReceiveACode => 'Didn’t receive a code?';

  @override
  String get resendCode => 'Resend code';

  @override
  String get congratulations => 'Congratulations';

  @override
  String get yourAccountHasComeToLife => 'Your account has come to life';

  @override
  String get passwordChanged => 'Password changed';

  @override
  String get congratulationsYouHaveSuccessfully => 'Congratulations! You have successfully';

  @override
  String get changedYourPassword => 'changed your password';

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get save => 'Save';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get other => 'Other';

  @override
  String get switchAccount => 'Switch Account';

  @override
  String get currency => 'Currency';

  @override
  String get language => 'Language';

  @override
  String get clearCache => 'Clear Cache';

  @override
  String get policy => 'Policy';

  @override
  String get completeProfile => 'Complete Profile';

  @override
  String get openAppSettings => 'Open app settings';

  @override
  String get close => 'Close';

  @override
  String get allowPermission => 'Allow Permission';

  @override
  String get allowApplicationToAccessYourStorageWhileYouUseTheApp => 'Allow application to access your storage while you use the App';

  @override
  String get allowApplicationToAccessYourCameraWhileYouUseTheApp => 'Allow application to access your camera while you use the App';

  @override
  String get somethingWentWrong => 'Something went wrong!';

  @override
  String get fileNotSupported => 'File not Supported';

  @override
  String get storagePermissionIsDenied => 'Storage permission is denied';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get en => 'EN';

  @override
  String get gr => 'GR';

  @override
  String get passwordShouldBeAtLeast8Characters => 'Password should be at least 8 characters';

  @override
  String get enterConfirmPassword => 'Enter confirm password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get enterAValidEmail => 'Enter a valid email';

  @override
  String get enterAnEmail => 'Enter an email';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get enterYourPhoneNumber => 'Enter your phone number';

  @override
  String get enterAValidPhoneNumber => 'Enter a valid phone number';

  @override
  String get enterAValidName => 'Enter a valid name';

  @override
  String get nameShouldBeAtLeast2Characters => 'Name should be at least 2 characters';

  @override
  String get iAcceptThe => 'I accept the';

  @override
  String get iAccept => 'I Accept';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get and => 'and';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get acceptTermsOfServiceAndPrivacyPolicy => 'Accept terms of service and privacy policy';

  @override
  String get unableToLaunch => 'Unable to launch';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get pleaseEnterANewPasswordForYourAccount => 'Please enter a new password for your account';

  @override
  String get areYouSureYouWantToDeleteAccount => 'Are you sure you want to delete your account';

  @override
  String get confirm => 'Confirm';

  @override
  String get areYouSureYouWantToExitTheApp => 'Are you sure you want to exit the application?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String amountWithCurrency(num price) {
    final intl.NumberFormat priceNumberFormat = intl.NumberFormat.simpleCurrency(
      locale: localeName,
      decimalDigits: 0
    );
    final String priceString = priceNumberFormat.format(price);

    return '$priceString';
  }

  @override
  String get noMatchingLoads => 'No Matching Loads';

  @override
  String get postTruck => 'Post Truck';

  @override
  String get myLoads => 'My Loads';

  @override
  String get book => 'Book';

  @override
  String get pastLoads => 'Past Loads';

  @override
  String get request => 'Request';

  @override
  String get today => 'Today';

  @override
  String get truckOrReefer => 'Truck/Reefer';

  @override
  String postingForDate(String date) {
    return 'Posting for $date';
  }

  @override
  String get pickup => 'Pickup';

  @override
  String get delivery => 'Delivery';

  @override
  String get whereYouWillBeEmpty => 'Where you will be empty?';

  @override
  String get enterYourLocationHere => 'Enter your location here';

  @override
  String get travelling => 'Travelling';

  @override
  String get local => 'Local';

  @override
  String get upto => 'Upto';

  @override
  String get short => 'Short';

  @override
  String get to => 'to';

  @override
  String get long => 'Long';

  @override
  String get over => 'over';

  @override
  String get filterBy => 'Filter By';

  @override
  String get truckPostedSuccesfully => 'Truck Posted Successfully';

  @override
  String get viewMatchesAndNotifications => 'You can view your matches in Booked loads and will also get notifications on new matches.';

  @override
  String get location => 'Location';

  @override
  String get gotIt => 'Got it';

  @override
  String get sortByPrice => 'Price';

  @override
  String get sortByWeight => 'Weight';

  @override
  String get sortByDeadhead => 'Deadhead';

  @override
  String get applySort => 'Apply';

  @override
  String get sortBy => 'Sort by';

  @override
  String get loadsSuggestedBasedOnHistory => 'Loads suggested for you based on your load and browsing history.';

  @override
  String get forYou => 'For You';

  @override
  String get price => 'Price';

  @override
  String get weight => 'Weight';

  @override
  String get deadhead => 'Deadhead';

  @override
  String get apply => 'Apply';

  @override
  String get notifications => 'Notifications';

  @override
  String get logout => 'Logout';

  @override
  String get back => 'Back';

  @override
  String get loadDetails => 'Load Details';

  @override
  String get loadId => 'Load ID #';

  @override
  String get ratePerMile => 'Rate per mile';

  @override
  String get packageType => 'Package Type';

  @override
  String get commodity => 'Commodity';

  @override
  String get bookLoad => 'Book Load';

  @override
  String get pickupDetails => 'Pickup Details';

  @override
  String get deliveryDetails => 'Delivery Details';

  @override
  String get bbDistributions => 'BB Distributions';

  @override
  String get viewOnMap => 'View On Map';

  @override
  String get notes => 'Notes';

  @override
  String get referenceNumber => 'Reference Number';

  @override
  String get purchaseOrder => 'Purchase Order #';

  @override
  String get pickupNumber => 'Pickup #';

  @override
  String get additionalDetails => 'Additional Details';

  @override
  String get contact => 'Contact';

  @override
  String get restrooms => 'Restrooms';

  @override
  String get onsiteScale => 'On-site scale';

  @override
  String countRatings(int count) {
    return '$count ratings';
  }

  @override
  String get mostRecentReviews => 'Most Recent Reviews';

  @override
  String pickupByUserOnDate(String username, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Pickup by $username on $dateString';
  }

  @override
  String get trailer => 'Trailer';

  @override
  String get availableBalance => 'Available Balance';

  @override
  String get earlyWithdraw => 'Early Withdraw';

  @override
  String get withdrawalRequests => 'Withdrawal Requests';

  @override
  String get unpaid => 'Unpaid';

  @override
  String get withdrawFunds => 'Withdraw Funds';

  @override
  String get manageBankAccount => 'Manage Bank Account';

  @override
  String get additionalChargeNote => 'Note: 3% additional charges will be applied on Early Withdrawal Amount only';

  @override
  String get specifyAmount => 'Specify Amount';

  @override
  String get messageOptional => 'Message (Optional)';

  @override
  String get typeHere => 'Type here';

  @override
  String get bankName => 'Bank Name';

  @override
  String get accountTitle => 'Account Title';

  @override
  String get iban => 'IBAN';

  @override
  String get update => 'Update';

  @override
  String get bankUpdated => 'Bank Updated';

  @override
  String get bankDetailsUpdatedSuccess => 'Your bank details have been updated successfully!';

  @override
  String get submitRequest => 'Submit Request';

  @override
  String get requestSubmitted => 'Request Submitted';

  @override
  String get withdrawalRequestSubmittedSuccess => 'Your withdrawal request has been submitted successfully!';

  @override
  String get manageBank => 'Manage Bank';

  @override
  String get beneficiaryTitle => 'Beneficiary Title';

  @override
  String get paymentReleased => 'Payment released';

  @override
  String get pendingApproval => 'Pending for Approval';

  @override
  String get pendingPayment => 'Pending for Payment';

  @override
  String get podSubmittedNotApproved => 'POD Submitted but not approved';

  @override
  String get podApprovedPaymentNotReleased => 'POD Approved, payment not released';

  @override
  String get podNotUploaded => 'POD not uploaded';

  @override
  String get uploadPodForPayment => 'Upload POD for payment';

  @override
  String get refunded => 'Refunded';

  @override
  String get paymentRefunded => 'Payment is refunded';

  @override
  String get total => 'Total';

  @override
  String get fee => 'Fee';

  @override
  String get earnings => 'Earnings';

  @override
  String get paid => 'Paid';

  @override
  String get withdraw => 'Withdraw';

  @override
  String get net => 'Net';

  @override
  String get appointment => 'Appointment';

  @override
  String seeAllCountReloadOptions(int count) {
    return 'See all $count reload options';
  }

  @override
  String get confirmBooking => 'Are you sure you want to book this load?';

  @override
  String get loadBooking => 'Load Booking';

  @override
  String get dropOffLocation => 'You’re dropping off load at San Antonio, TX. Do you also want to see the other loads?';

  @override
  String get loadBookedSuccess => 'Load is booked successfully. Let\'s deliver it to complete the job.';

  @override
  String get viewReloads => 'View Reloads';

  @override
  String get loadBooked => 'Load Booked';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get requestChange => 'Request Change';

  @override
  String get callOurSupport => 'Call our Support';

  @override
  String get emailOurSupport => 'Email our Support';

  @override
  String get sendRequest => 'Send Request';

  @override
  String get requestUpdate => 'Request Update';

  @override
  String get licenseNumberHere => 'License Number Here';

  @override
  String get drivingNumberHere => 'Driving Number Here';

  @override
  String get enterYourRequest => 'Enter your request';

  @override
  String get skip => 'Skip';

  @override
  String get booked => 'Booked';

  @override
  String get past => 'Past';

  @override
  String get currentActiveLoad => 'Current active load';

  @override
  String get inProgress => 'In-Progress';

  @override
  String get docsNeeded => 'Docs Needed';

  @override
  String get uploadPod => 'Upload POD';

  @override
  String get processing => 'Processing';

  @override
  String get complete => 'Complete';

  @override
  String get logoutConfirmation => 'Do you want to Logout?';

  @override
  String get faq => 'FAQ';

  @override
  String get backToFaq => 'Back To FAQ';

  @override
  String get preTrip => 'Pre-trip';

  @override
  String get completeDelivery => 'Complete Delivery';

  @override
  String get confirmDelivery => 'Are you sure you have delivered the Load?';

  @override
  String get loadDelivered => 'Load Delivered';

  @override
  String get uploadPOD => 'Please upload POD (Proof of Delivery) so your carrier payment can be cleared.';

  @override
  String get notNow => 'Not now';

  @override
  String get chooseOption => 'Choose An Option';

  @override
  String get phoneGallery => 'Phone Gallery';

  @override
  String get openCamera => 'Open Camera';

  @override
  String get docSubmitted => 'Doc Submitted';

  @override
  String get podSubmittedSuccess => 'Your POD (Proof of Delivery) has been submitted. Your carrier will be paid (in scheduled dates) upon approval of documents.';

  @override
  String get pod => 'POD';

  @override
  String get addImages => 'Add Images';

  @override
  String get submitPOD => 'Submit POD';

  @override
  String get pickupExperience => 'How was your pickup?';

  @override
  String get deliveryExperience => 'How was your delivery?';

  @override
  String get ratePickup => 'Rate Pickup';

  @override
  String get rateDelivery => 'Rate Delivery';

  @override
  String get thisActionCantUndoneYourAccountWillBePermanentlyDeleted => 'This action can’t undone,\nYour account will be permanently deleted.';

  @override
  String get deleteAccountQuestion => 'Delete Account?';

  @override
  String get changeRequestSent => 'Change Request Sent';

  @override
  String get yourRequestForChangeInTheVehicleHasBeenSentSuccessfully => 'Your request for change in the vehicle has been sent successfully';

  @override
  String get addBankAccount => 'Add Bank Account';

  @override
  String get otpSentToYourPhone => 'OTP has been sent to your phone';

  @override
  String get profileUpdatedSuccessfully => 'Your profile has been updated successfully';

  @override
  String get otpVerifiedSuccessfully => 'OTP has been verified successfully';

  @override
  String get enterAValidOTP => 'Please enter a valid OTP';

  @override
  String get accountDeletedSuccessfully => 'Account has been deleted successfully';

  @override
  String get requests => 'Requests';

  @override
  String get confirmationEmailUponVerificationByAdmin => 'You will receive a confirmation email once your account is verified by Avcons admin.';

  @override
  String get details => 'Details';

  @override
  String get routeToday => 'Route Today';

  @override
  String get confirmStartRide => 'Are you sure you want to start this ride?';

  @override
  String get rideStarted => 'Ride Started. Have a safe Journey!';

  @override
  String get thanks => 'Thanks!';

  @override
  String get startTheRide => 'Start the Ride';

  @override
  String get chat => 'Chat';

  @override
  String get home => 'Home';

  @override
  String get tripDetails => 'Trip Details';

  @override
  String get trackYourJourney => 'Track your Journey';

  @override
  String get upcomingSchedule => 'Upcoming Schedule';

  @override
  String get pastTrips => 'Past Trips';

  @override
  String get recordYourMatters => 'Record your Matters';

  @override
  String get recordFaultExpense => 'Record Fault / Expense';

  @override
  String get leaves => 'Leaves';

  @override
  String get reviewAndWiki => 'Review & Wiki';

  @override
  String get courses => 'Courses';

  @override
  String get reviews => 'Reviews';

  @override
  String get extras => 'Extras';

  @override
  String get reportFault => 'Report Fault';

  @override
  String get recordExpense => 'Record Expense';

  @override
  String get date => 'Date';

  @override
  String get selectDate => 'Select Date';

  @override
  String get message => 'Message';

  @override
  String get typeMessageHere => 'Type message here';

  @override
  String get attachPictures => 'Attach Pictures';

  @override
  String get reportAFault => 'Report A Fault';

  @override
  String get faultReported => 'Fault Reported';

  @override
  String get faultRequestSuccess => 'Your request for change in the vehicle has been sent successfully';

  @override
  String get type => 'Type';

  @override
  String get selectType => 'Select Type';

  @override
  String get enterAmount => 'Enter Amount';

  @override
  String get amount => 'Amount';

  @override
  String get attachReceipt => 'Attach Receipt';

  @override
  String get recordAnExpense => 'Record An Expense';

  @override
  String get searchHere => 'Search Here';

  @override
  String get allCategories => 'All Categories';

  @override
  String get expenseRecorded => 'Expense Recorded';

  @override
  String get expenseRequestSuccess => 'Your request for change in the vehicle has been sent successfully';

  @override
  String get hours => 'Hours';

  @override
  String get days => 'Days';

  @override
  String get sick => 'Sick';

  @override
  String get tapForLeaveDetails => 'Tap on any date to see details about leave';

  @override
  String get approved => 'Approved';

  @override
  String get pending => 'Pending';

  @override
  String get rejected => 'Rejected';

  @override
  String get applyForLeave => 'Apply For Leave';

  @override
  String get leaveStatus => 'Leave Status';

  @override
  String get reason => 'Reason';

  @override
  String get typeReasonHere => 'Type reason here';

  @override
  String get leaveRequestSuccess => 'Your leave request was sent successfully!';

  @override
  String get recent => 'Recent';

  @override
  String get day => 'Day';

  @override
  String get singleDay => 'Single day';

  @override
  String get multiDay => 'Multi-day';

  @override
  String get enterPin => 'Enter Pin';

  @override
  String get forgotYourPin => 'Forgot Your Pin?';

  @override
  String get enterYourPinToLogin => 'Enter your pin to login';

  @override
  String get createNewTicket => 'Create New Ticket';

  @override
  String get inReview => 'In Review';

  @override
  String get resolved => 'Resolved';

  @override
  String get ticket => 'Ticket';

  @override
  String get tickets => 'Tickets';

  @override
  String get requestSubmittedSuccessfully => 'Your request has been submitted successfully';

  @override
  String get newPin => 'New Pin';

  @override
  String get systemUnits => 'System Units';

  @override
  String get distance => 'Distance';
}
