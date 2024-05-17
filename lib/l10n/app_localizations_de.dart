import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get welcome => 'Willkommen';

  @override
  String get login => 'Anmelden';

  @override
  String get platformDescription => 'We connect shippers and carriers to haul together. Find and book loads for you and your fleet, easily upload documents, and get paid quickly with the tap of a button.';

  @override
  String get createAnAccount => 'Konto erstellen';

  @override
  String get phoneNumber => 'Telefonnummer';

  @override
  String get email => 'E-Mail';

  @override
  String get password => 'Passwort';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get doNotHaveAnAccount => 'Haben Sie kein Konto?';

  @override
  String get signUp => 'Anmelden';

  @override
  String get enterYourPhoneNumberToRecoverYourPassword => 'Geben Sie Ihre Telefonnummer ein, um Ihr Passwort wiederherzustellen.';

  @override
  String get verify => 'Überprüfen';

  @override
  String get verificationOTP => 'Verifizierungscode';

  @override
  String get enter4DigitOTP => 'Geben Sie den 4-stelligen OTP ein, der an Ihre Telefonnummer gesendet wurde.';

  @override
  String get resendOTPin => 'OTP in ';

  @override
  String countSeconds(int count) {
    return '$count Sekunden';
  }

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get confirmPassword => 'Passwort bestätigen';

  @override
  String get resetPassword => 'Passwort zurücksetzen';

  @override
  String get resetYourPasswordToLoginInToYourAccount => 'Setzen Sie Ihr Passwort zurück, um sich bei Ihrem Konto anzumelden.';

  @override
  String get updatePassword => 'Passwort aktualisieren';

  @override
  String get chooseProfileType => 'Profiltyp wählen';

  @override
  String stepNumber(int number) {
    return 'Schritt $number';
  }

  @override
  String get driver => 'Fahrer';

  @override
  String get ownVehicle => 'Eigenes Fahrzeug';

  @override
  String get vehicleOwnershipAndBooking => 'Das Fahrzeug gehört der Flottenfirma. Sie fahren das Fahrzeug und können Ladungen selbst buchen oder sie werden von der Flottenfirma zugewiesen.';

  @override
  String get personalDetails => 'Persönliche Details';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get fleetCompanyDetails => 'Flottenfirmendetails';

  @override
  String get fleetCompanyID => 'Fleet-Unternehmenskennung';

  @override
  String get iAcceptTheTermsAndConditions => 'Ich akzeptiere die Allgemeinen Geschäftsbedingungen.';

  @override
  String get next => 'Weiter';

  @override
  String get verifyPhoneNumber => 'Telefonnummer überprüfen';

  @override
  String get verifyAndCreateAccount => 'Überprüfen und Konto erstellen';

  @override
  String get verifyPhoneNumberWithOTP => 'Bitte überprüfen Sie Ihre Telefonnummer, indem Sie den OTP eingeben, der an Ihr Mobiltelefon gesendet wurde.';

  @override
  String get accountUnderVerification => 'Konto in Überprüfung';

  @override
  String get confirmationEmailUponVerification => 'Sie erhalten eine Bestätigungs-E-Mail, sobald Ihr Konto von der von Ihnen ausgewählten Flottenfirma überprüft wurde.';

  @override
  String get done => 'Erledigt';

  @override
  String get vehicleOwnershipAndBookingAuthority => 'Sie besitzen Ihr Fahrzeug und haben die Berechtigung, Ladungen selbst zu buchen.';

  @override
  String get vehicleLicenseNumber => 'Fahrzeugkennzeichen';

  @override
  String get drivingLicenseNumber => 'Führerscheinnummer';

  @override
  String get selectVehicleType => 'Fahrzeugtyp auswählen';

  @override
  String get vehicleDetails => 'Fahrzeugdetails';

  @override
  String get manageVehicle => 'Fahrzeug verwalten';

  @override
  String get transactions => 'Transaktionen';

  @override
  String get withdrawals => 'Abhebungen';

  @override
  String get reports => 'Berichte';

  @override
  String get about => 'Über';

  @override
  String get terms => 'Bedingungen';

  @override
  String get support => 'Unterstützung';

  @override
  String get faqs => 'FAQs';

  @override
  String get settings => 'Einstellungen';

  @override
  String get didNotReceiveACode => 'Keinen Code erhalten?';

  @override
  String get resendCode => 'Code erneut senden';

  @override
  String get congratulations => 'Herzlichen Glückwunsch';

  @override
  String get yourAccountHasComeToLife => 'Ihr Konto wurde aktiviert';

  @override
  String get passwordChanged => 'Passwort geändert';

  @override
  String get congratulationsYouHaveSuccessfully => 'Herzlichen Glückwunsch! Sie haben erfolgreich';

  @override
  String get changedYourPassword => 'Ihr Passwort geändert';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get save => 'Speichern';

  @override
  String get dateOfBirth => 'Geburtsdatum';

  @override
  String get male => 'Männlich';

  @override
  String get female => 'Weiblich';

  @override
  String get other => 'Andere';

  @override
  String get switchAccount => 'Konto wechseln';

  @override
  String get currency => 'Währung';

  @override
  String get language => 'Sprache';

  @override
  String get clearCache => 'Cache löschen';

  @override
  String get policy => 'Richtlinie';

  @override
  String get completeProfile => 'Profil vervollständigen';

  @override
  String get openAppSettings => 'App-Einstellungen öffnen';

  @override
  String get close => 'Schließen';

  @override
  String get allowPermission => 'Berechtigung zulassen';

  @override
  String get allowApplicationToAccessYourStorageWhileYouUseTheApp => 'Erlauben Sie der Anwendung, auf Ihren Speicher zuzugreifen, während Sie die App verwenden';

  @override
  String get allowApplicationToAccessYourCameraWhileYouUseTheApp => 'Erlauben Sie der Anwendung, auf Ihre Kamera zuzugreifen, während Sie die App verwenden';

  @override
  String get somethingWentWrong => 'Etwas ist schief gelaufen!';

  @override
  String get fileNotSupported => 'Datei nicht unterstützt';

  @override
  String get storagePermissionIsDenied => 'Speicherberechtigung verweigert';

  @override
  String get camera => 'Kamera';

  @override
  String get gallery => 'Galerie';

  @override
  String get en => 'EN';

  @override
  String get gr => 'GR';

  @override
  String get passwordShouldBeAtLeast8Characters => 'Das Passwort sollte mindestens 8 Zeichen lang sein';

  @override
  String get enterConfirmPassword => 'Bestätigen Sie das Passwort';

  @override
  String get passwordsDoNotMatch => 'Passwörter stimmen nicht überein';

  @override
  String get enterAValidEmail => 'Geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get enterAnEmail => 'Geben Sie eine E-Mail-Adresse ein';

  @override
  String get enterYourName => 'Geben Sie Ihren Namen ein';

  @override
  String get enterYourPhoneNumber => 'Geben Sie Ihre Telefonnummer ein';

  @override
  String get enterAValidPhoneNumber => 'Geben Sie eine gültige Telefonnummer ein';

  @override
  String get enterAValidName => 'Geben Sie einen gültigen Namen ein';

  @override
  String get nameShouldBeAtLeast2Characters => 'Der Name sollte mindestens 2 Zeichen lang sein';

  @override
  String get iAcceptThe => 'I accept the';

  @override
  String get iAccept => 'Ich akzeptiere';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get and => 'und';

  @override
  String get privacyPolicy => 'Datenschutzbestimmungen';

  @override
  String get acceptTermsOfServiceAndPrivacyPolicy => 'Akzeptieren Sie die Nutzungsbedingungen und Datenschutzbestimmungen';

  @override
  String get unableToLaunch => 'Kann nicht gestartet werden';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get pleaseEnterANewPasswordForYourAccount => 'Bitte geben Sie ein neues Passwort für Ihr Konto ein';

  @override
  String get areYouSureYouWantToDeleteAccount => 'Sind Sie sicher, dass Sie Ihr Konto löschen möchten?';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get areYouSureYouWantToExitTheApp => 'Sind Sie sicher, dass Sie die Anwendung beenden möchten?';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

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
  String get noMatchingLoads => 'Keine übereinstimmenden Ladungen';

  @override
  String get postTruck => 'Lkw veröffentlichen';

  @override
  String get myLoads => 'Meine Ladungen';

  @override
  String get book => 'Buchen';

  @override
  String get pastLoads => 'Vergangene Ladungen';

  @override
  String get request => 'Anfrage';

  @override
  String get today => 'Heute';

  @override
  String get truckOrReefer => 'Lkw/Kühlanhänger';

  @override
  String postingForDate(String date) {
    return 'Veröffentlichung für $date';
  }

  @override
  String get pickup => 'Abholung';

  @override
  String get delivery => 'Lieferung';

  @override
  String get whereYouWillBeEmpty => 'Wo werden Sie leer sein?';

  @override
  String get enterYourLocationHere => 'Geben Sie hier Ihren Standort ein';

  @override
  String get travelling => 'Unterwegs';

  @override
  String get local => 'Lokal';

  @override
  String get upto => 'Bis zu';

  @override
  String get short => 'Kurz';

  @override
  String get to => 'bis';

  @override
  String get long => 'Lang';

  @override
  String get over => 'über';

  @override
  String get filterBy => 'Filtern nach';

  @override
  String get truckPostedSuccesfully => 'Lkw erfolgreich veröffentlicht';

  @override
  String get viewMatchesAndNotifications => 'Sie können Ihre Übereinstimmungen in Gebuchte Ladungen anzeigen und erhalten auch Benachrichtigungen über neue Übereinstimmungen.';

  @override
  String get location => 'Standort';

  @override
  String get gotIt => 'Verstanden';

  @override
  String get sortByPrice => 'Preis';

  @override
  String get sortByWeight => 'Gewicht';

  @override
  String get sortByDeadhead => 'Leerfahrt';

  @override
  String get applySort => 'Anwenden';

  @override
  String get sortBy => 'Sortieren nach';

  @override
  String get loadsSuggestedBasedOnHistory => 'Ladungen, die basierend auf Ihrer Ladungs- und Browserhistorie für Sie vorgeschlagen werden.';

  @override
  String get forYou => 'Für Sie';

  @override
  String get price => 'Preis';

  @override
  String get weight => 'Gewicht';

  @override
  String get deadhead => 'Leerfahrt';

  @override
  String get apply => 'Anwenden';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get logout => 'Abmelden';

  @override
  String get back => 'Zurück';

  @override
  String get loadDetails => 'Ladungsdetails';

  @override
  String get loadId => 'Ladungs-ID #';

  @override
  String get ratePerMile => 'Tarif pro Meile';

  @override
  String get packageType => 'Pakettyp';

  @override
  String get commodity => 'Ware';

  @override
  String get bookLoad => 'Ladung buchen';

  @override
  String get pickupDetails => 'Abholungsdetails';

  @override
  String get deliveryDetails => 'Lieferdetails';

  @override
  String get bbDistributions => 'BB-Verteilungen';

  @override
  String get viewOnMap => 'Auf Karte anzeigen';

  @override
  String get shipperNotes => 'Versandnotizen';

  @override
  String get referenceNumber => 'Referenznummer';

  @override
  String get purchaseOrder => 'Bestellnummer #';

  @override
  String get pickupNumber => 'Abholvermerk #';

  @override
  String get additionalDetails => 'Zusätzliche Details';

  @override
  String get contact => 'Kontakt';

  @override
  String get restrooms => 'Toiletten';

  @override
  String get onsiteScale => 'Vor-Ort-Waage';

  @override
  String countRatings(int count) {
    return '$count Bewertungen';
  }

  @override
  String get mostRecentReviews => 'Aktuellste Bewertungen';

  @override
  String pickupByUserOnDate(String username, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Abholung durch $username am $dateString';
  }

  @override
  String get trailer => 'Anhänger';

  @override
  String get availableBalance => 'Verfügbares Guthaben';

  @override
  String get earlyWithdraw => 'Frühzeitige Auszahlung';

  @override
  String get withdrawalRequests => 'Auszahlungsanfragen';

  @override
  String get unpaid => 'Unbezahlt';

  @override
  String get withdrawFunds => 'Gelder abheben';

  @override
  String get manageBankAccount => 'Bankkonto verwalten';

  @override
  String get additionalChargeNote => 'Hinweis: Auf die Frühzeitige Auszahlung fallen nur zusätzliche Gebühren in Höhe von 3 % an';

  @override
  String get specifyAmount => 'Betrag angeben';

  @override
  String get messageOptional => 'Nachricht (optional)';

  @override
  String get typeHere => 'Hier tippen';

  @override
  String get bankName => 'Bankname';

  @override
  String get accountTitle => 'Kontotitel';

  @override
  String get iban => 'IBAN';

  @override
  String get update => 'Aktualisieren';

  @override
  String get bankUpdated => 'Bank aktualisiert';

  @override
  String get bankDetailsUpdatedSuccess => 'Ihre Bankdaten wurden erfolgreich aktualisiert!';

  @override
  String get submitRequest => 'Anfrage senden';

  @override
  String get requestSubmitted => 'Anfrage gesendet';

  @override
  String get withdrawalRequestSubmittedSuccess => 'Ihre Auszahlungsanfrage wurde erfolgreich gesendet!';

  @override
  String get manageBank => 'Bank verwalten';

  @override
  String get beneficiaryTitle => 'Begünstigtentitel';

  @override
  String get paymentReleased => 'Zahlung freigegeben';

  @override
  String get pendingApproval => 'Ausstehende Genehmigung';

  @override
  String get pendingPayment => 'Ausstehende Zahlung';

  @override
  String get podSubmittedNotApproved => 'POD eingereicht, aber nicht genehmigt';

  @override
  String get podApprovedPaymentNotReleased => 'POD genehmigt, Zahlung nicht freigegeben';

  @override
  String get podNotUploaded => 'POD nicht hochgeladen';

  @override
  String get uploadPodForPayment => 'POD für Zahlung hochladen';

  @override
  String get refunded => 'Erstattet';

  @override
  String get paymentRefunded => 'Zahlung wurde erstattet';

  @override
  String get total => 'Gesamt';

  @override
  String get fee => 'Gebühr';

  @override
  String get earnings => 'Verdienste';

  @override
  String get paid => 'Bezahlt';

  @override
  String get withdraw => 'Abheben';

  @override
  String get net => 'Netto';

  @override
  String get appointment => 'Termin';

  @override
  String seeAllCountReloadOptions(int count) {
    return 'Alle $count Nachladeoptionen anzeigen';
  }

  @override
  String get confirmBooking => 'Sind Sie sicher, dass Sie diese Ladung buchen möchten?';

  @override
  String get loadBooking => 'Ladungsbuchung';

  @override
  String get dropOffLocation => 'Sie geben die Ladung in San Antonio, TX ab. Möchten Sie auch die anderen Ladungen sehen?';

  @override
  String get loadBookedSuccess => 'Die Ladung wurde erfolgreich gebucht. Lassen Sie uns sie liefern, um den Auftrag abzuschließen.';

  @override
  String get viewReloads => 'Nachladeoptionen anzeigen';

  @override
  String get loadBooked => 'Ladung gebucht';

  @override
  String get editProfile => 'Profil bearbeiten';

  @override
  String get requestChange => 'Änderung beantragen';

  @override
  String get callOurSupport => 'Rufen Sie unseren Support an';

  @override
  String get emailOurSupport => 'E-Mail an unseren Support senden';

  @override
  String get sendRequest => 'Anfrage senden';

  @override
  String get requestUpdate => 'Aktualisierung anfordern';

  @override
  String get licenseNumberHere => 'Lizenznummer hier eingeben';

  @override
  String get drivingNumberHere => 'Fahrnummer hier eingeben';

  @override
  String get enterYourRequest => 'Geben Sie Ihre Anfrage ein';

  @override
  String get skip => 'Überspringen';

  @override
  String get joinIndividuallyOrFleet => 'Einzeln beitreten oder Teil der Flotte';

  @override
  String get bookYourLoad => 'Buchen Sie Ihre Ladung';

  @override
  String get useAIToBoostMatch => 'Verwenden Sie KI, um die Übereinstimmung zu verbessern';

  @override
  String get earnAndSeeReports => 'Verdienen und Berichte einsehen';

  @override
  String get soloDriver => 'Sie können Ihr Fahrzeug besitzen und alleine fahren.';

  @override
  String get learnGrowSucceed => 'Lernen, wachsen und erfolgreich sein mit den vielfältigen Bildungsressourcen, interaktiven Lektionen und personalisierten Lernerfahrungen unserer App.';

  @override
  String get unlockPotential => 'Entfesseln Sie Ihr Potenzial mit interaktiven Kursen und Expertenlehrern, die Ihnen zur Verfügung stehen.';

  @override
  String get learnAnytimeAnywhere => 'Lernen Sie jederzeit und überall mit einer umfangreichen Bibliothek an Bildungsinhalten und personalisierten Lernplänen.';

  @override
  String get booked => 'Gebucht';

  @override
  String get past => 'Vergangenheit';

  @override
  String get currentActiveLoad => 'Aktuelle aktive Ladung';

  @override
  String get inProgress => 'In Bearbeitung';

  @override
  String get docsNeeded => 'Dokumente benötigt';

  @override
  String get uploadPod => 'POD hochladen';

  @override
  String get processing => 'Verarbeitung';

  @override
  String get complete => 'Vollständig';

  @override
  String get logoutConfirmation => 'Möchten Sie sich abmelden?';

  @override
  String get faq => 'FAQ';

  @override
  String get backToFaq => 'Zurück zu den FAQ';

  @override
  String get preTrip => 'Vorabreise';

  @override
  String get completeDelivery => 'Lieferung abschließen';

  @override
  String get confirmDelivery => 'Sind Sie sicher, dass Sie die Ladung geliefert haben?';

  @override
  String get loadDelivered => 'Ladung geliefert';

  @override
  String get uploadPOD => 'Bitte laden Sie den POD (Nachweis der Lieferung) hoch, damit Ihre Frachtführerzahlung freigegeben werden kann.';

  @override
  String get notNow => 'Nicht jetzt';

  @override
  String get chooseOption => 'Option wählen';

  @override
  String get phoneGallery => 'Telefongalerie';

  @override
  String get openCamera => 'Kamera öffnen';

  @override
  String get docSubmitted => 'Dokument eingereicht';

  @override
  String get podSubmittedSuccess => 'Ihr POD (Nachweis der Lieferung) wurde eingereicht. Ihre Frachtführerzahlung erfolgt (zu den geplanten Terminen) nach Genehmigung der Dokumente.';

  @override
  String get pod => 'POD';

  @override
  String get addImages => 'Bilder hinzufügen';

  @override
  String get submitPOD => 'POD einreichen';

  @override
  String get pickupExperience => 'Wie war Ihre Abholung?';

  @override
  String get deliveryExperience => 'Wie war Ihre Lieferung?';

  @override
  String get ratePickup => 'Abholung bewerten';

  @override
  String get rateDelivery => 'Lieferung bewerten';

  @override
  String get thisActionCantUndoneYourAccountWillBePermanentlyDeleted => 'Diese Aktion kann nicht rückgängig gemacht werden.\nIhr Konto wird dauerhaft gelöscht.';

  @override
  String get deleteAccountQuestion => 'Konto löschen?';

  @override
  String get changeRequestSent => 'Änderungsanfrage gesendet';

  @override
  String get yourRequestForChangeInTheVehicleHasBeenSentSuccessfully => 'Ihre Anfrage auf Änderung des Fahrzeugs wurde erfolgreich gesendet';

  @override
  String get addBankAccount => 'Bankkonto hinzufügen';

  @override
  String get otpSentToYourPhone => 'OTP wurde an Ihr Telefon gesendet';

  @override
  String get profileUpdatedSuccessfully => 'Ihr Profil wurde erfolgreich aktualisiert';

  @override
  String get otpVerifiedSuccessfully => 'OTP wurde erfolgreich verifiziert';

  @override
  String get enterAValidOTP => 'Bitte geben Sie einen gültigen OTP ein';

  @override
  String get accountDeletedSuccessfully => 'Konto wurde erfolgreich gelöscht';

  @override
  String get requests => 'Anfragen';

  @override
  String get confirmationEmailUponVerificationByAdmin => 'Sie erhalten eine Bestätigungs-E-Mail, sobald Ihr Konto von Avcons Admin verifiziert wurde.';

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
}
