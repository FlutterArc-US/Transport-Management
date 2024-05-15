import 'package:go_router/go_router.dart';
import 'package:transport_management/features/about/domain/models/faq_model.dart';
import 'package:transport_management/features/about/presentation/views/about/about_view.dart';
import 'package:transport_management/features/about/presentation/views/faq/faqs_view.dart';
import 'package:transport_management/features/about/presentation/views/faq/single_faq_view.dart';
import 'package:transport_management/features/about/presentation/views/privacy_policy/privacy_policy_view.dart';
import 'package:transport_management/features/about/presentation/views/terms_of_service/terms_of_service_view.dart';
import 'package:transport_management/features/auth/presentation/views/change_request/change_request_view.dart';
import 'package:transport_management/features/auth/presentation/views/forget_password/forgot_password_view.dart';
import 'package:transport_management/features/auth/presentation/views/login/login_view.dart';
import 'package:transport_management/features/auth/presentation/views/manage_vehicle/manage_vehicle_view.dart';
import 'package:transport_management/features/auth/presentation/views/otp_verification/otp_verification_view.dart';
import 'package:transport_management/features/auth/presentation/views/profile_update/profile_update_view.dart';
import 'package:transport_management/features/auth/presentation/views/register/sign_up_view.dart';
import 'package:transport_management/features/auth/presentation/views/reset_password/reset_password.dart';
import 'package:transport_management/features/earnings/presentation/views/earnings/earnings_view.dart';
import 'package:transport_management/features/home/presentation/views/home_view.dart';
import 'package:transport_management/features/loads/domain/models/load/load_model.dart';
import 'package:transport_management/features/loads/presentation/views/delivery_details/delivery_details_view.dart';
import 'package:transport_management/features/loads/presentation/views/load_details/load_details_view.dart';
import 'package:transport_management/features/loads/presentation/views/loads_for_you/loads_for_you_view.dart';
import 'package:transport_management/features/loads/presentation/views/my_loads/my_loads_view.dart';
import 'package:transport_management/features/loads/presentation/views/pickup_details/pickup_details_view.dart';
import 'package:transport_management/features/loads/presentation/views/pretrip/pretrip_view.dart';
import 'package:transport_management/features/loads/presentation/views/submitted_docs/submitted_docs_view.dart';
import 'package:transport_management/features/notifications/presentation/views/notifications/notifications_view.dart';
import 'package:transport_management/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:transport_management/features/splash/presentation/splash_view.dart';
import 'package:transport_management/features/withdrawal/presentation/views/manage_bank/manage_bank_view.dart';
import 'package:transport_management/features/withdrawal/presentation/views/withdraw_funds/withdraw_funds_view.dart';
import 'package:transport_management/features/withdrawal/presentation/views/withdrawal/withdrawal_view.dart';
import 'package:transport_management/util/router/paths.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (context, state) {
        return const OnboardingView();
      },
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) {
        return const SignUpView();
      },
    ),
    GoRoute(
      path: RoutePaths.otpVerification,
      builder: (context, state) {
        final data = state.extra as bool?;
        return OTPVerificationView(profileChangePassword: data);
      },
    ),
    GoRoute(
        path: RoutePaths.forgetPassword,
        builder: (context, state) {
          return const ForgotPasswordView();
        }),
    GoRoute(
      path: RoutePaths.resetPassword,
      builder: (context, state) {
        return const ResetPasswordView();
      },
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: RoutePaths.notifications,
      builder: (context, state) {
        return const NotificationsView();
      },
    ),
    GoRoute(
      path: RoutePaths.loadDetails,
      builder: (context, state) {
        final data = state.extra as LoadModel?;
        return LoadDetailsView(load: data);
      },
    ),
    GoRoute(
      path: RoutePaths.deliveryDetails,
      builder: (context, state) {
        return const DeliveryDetailsView();
      },
    ),
    GoRoute(
      path: RoutePaths.pickupDetails,
      builder: (context, state) {
        return const PickupDetailsView();
      },
    ),
    GoRoute(
      path: RoutePaths.withdrawal,
      builder: (context, state) {
        return const WithdrawalView();
      },
    ),
    GoRoute(
      path: RoutePaths.earnings,
      builder: (context, state) {
        return const EarningsView();
      },
    ),
    GoRoute(
      path: RoutePaths.withdrawFunds,
      builder: (context, state) {
        return const WithdrawFundsView();
      },
    ),
    GoRoute(
      path: RoutePaths.manageBank,
      builder: (context, state) {
        return const ManageBankView();
      },
    ),
    GoRoute(
      path: RoutePaths.updateProfile,
      builder: (context, state) {
        return const ProfileUpdateView();
      },
    ),
    GoRoute(
      path: RoutePaths.manageVehicle,
      builder: (context, state) {
        return const ManageVehicleView();
      },
    ),
    GoRoute(
      path: RoutePaths.changeRequest,
      builder: (context, state) {
        return const ChangeRequestView();
      },
    ),
    GoRoute(
      path: RoutePaths.myLoads,
      builder: (context, state) {
        return const MyLoadsView();
      },
    ),
    GoRoute(
      path: RoutePaths.about,
      builder: (context, state) {
        return const AboutView();
      },
    ),
    GoRoute(
      path: RoutePaths.privacyPolicy,
      builder: (context, state) {
        return const PrivacyPolicyView();
      },
    ),
    GoRoute(
      path: RoutePaths.termsOfService,
      builder: (context, state) {
        return const TermsOfServiceView();
      },
    ),
    GoRoute(
      path: RoutePaths.faqsView,
      builder: (context, state) {
        return const FaqsView();
      },
    ),
    GoRoute(
      path: RoutePaths.singleFaqView,
      builder: (context, state) {
        final data = state.extra as FaqModel;
        return SingleFaqView(faqModel: data);
      },
    ),
    GoRoute(
      path: RoutePaths.preTrip,
      builder: (context, state) {
        return const PreTripView();
      },
    ),
    GoRoute(
      path: RoutePaths.submittedDocs,
      builder: (context, state) {
        return const SubmittedDocsView();
      },
    ),
    GoRoute(
      path: RoutePaths.forYou,
      builder: (context, state) {
        return const LoadsForYouView();
      },
    )
  ],
);
