import 'package:go_router/go_router.dart';
import 'package:transport_management/features/about/domain/models/faq_model.dart';
import 'package:transport_management/features/about/presentation/views/about/about_view.dart';
import 'package:transport_management/features/about/presentation/views/faq/faqs_view.dart';
import 'package:transport_management/features/about/presentation/views/faq/single_faq_view.dart';
import 'package:transport_management/features/about/presentation/views/privacy_policy/privacy_policy_view.dart';
import 'package:transport_management/features/about/presentation/views/terms_of_service/terms_of_service_view.dart';
import 'package:transport_management/features/auth/presentation/views/change_request/change_request_view.dart';
import 'package:transport_management/features/auth/presentation/views/enter_pin/enter_pin_view.dart';
import 'package:transport_management/features/auth/presentation/views/forget_password/forgot_password_view.dart';
import 'package:transport_management/features/auth/presentation/views/login/login_view.dart';
import 'package:transport_management/features/auth/presentation/views/otp_verification/otp_verification_view.dart';
import 'package:transport_management/features/auth/presentation/views/profile_update/profile_update_view.dart';
import 'package:transport_management/features/auth/presentation/views/register/sign_up_view.dart';
import 'package:transport_management/features/auth/presentation/views/reset_password/reset_password.dart';
import 'package:transport_management/features/courses/presentation/views/courses/courses_view.dart';
import 'package:transport_management/features/home/presentation/views/home_view.dart';
import 'package:transport_management/features/notifications/presentation/views/notifications/notifications_view.dart';
import 'package:transport_management/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:transport_management/features/record_matter/presentation/views/apply_for_leave/apply_for_leave_view.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/leaves_view.dart';
import 'package:transport_management/features/record_matter/presentation/views/report_fault_expense/report_fault_expense_view.dart';
import 'package:transport_management/features/reviews/presentation/views/reviews/reviews_view.dart';
import 'package:transport_management/features/rides/domain/models/load/load_model.dart';
import 'package:transport_management/features/rides/presentation/views/ride_details/ride_details_view.dart';
import 'package:transport_management/features/rides/presentation/views/system_units/system_units_view.dart';
import 'package:transport_management/features/rides/presentation/views/trip_point_details/trip_point_details.dart';
import 'package:transport_management/features/splash/presentation/splash_view.dart';
import 'package:transport_management/features/support/domain/models/ticket_model.dart';
import 'package:transport_management/features/support/presentation/views/create_new_ticket/create_new_ticket_view.dart';
import 'package:transport_management/features/support/presentation/views/ticket_detail/ticket_detail_view.dart';
import 'package:transport_management/features/support/presentation/views/tickets/tickets_view.dart';
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
      path: RoutePaths.updateProfile,
      builder: (context, state) {
        return const ProfileUpdateView();
      },
    ),
    GoRoute(
      path: RoutePaths.changeRequest,
      builder: (context, state) {
        return const ChangeRequestView();
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
      path: RoutePaths.rideDetails,
      builder: (context, state) {
        final data = state.extra as LoadModel?;
        return RideDetailsView(load: data);
      },
    ),
    GoRoute(
      path: RoutePaths.tripPoint,
      builder: (context, state) {
        return const TripPointDetailsView();
      },
    ),
    GoRoute(
      path: RoutePaths.reportFaultExpense,
      builder: (context, state) {
        return const ReportFaultExpenseView();
      },
    ),
    GoRoute(
      path: RoutePaths.leaves,
      builder: (context, state) {
        return const LeavesView();
      },
    ),
    GoRoute(
      path: RoutePaths.applyForLeave,
      builder: (context, state) {
        return const ApplyForLeaveView();
      },
    ),
    GoRoute(
      path: RoutePaths.enterPin,
      builder: (context, state) {
        return const EnterPinView();
      },
    ),
    GoRoute(
      path: RoutePaths.reviews,
      builder: (context, state) {
        return const ReviewsView();
      },
    ),
    GoRoute(
      path: RoutePaths.courses,
      builder: (context, state) {
        return const CoursesView();
      },
    ),
    GoRoute(
      path: RoutePaths.createNewTicket,
      builder: (context, state) {
        return const CreateNewTicketView();
      },
    ),
    GoRoute(
      path: RoutePaths.ticketDetail,
      builder: (context, state) {
        final data = state.extra as TicketModel;
        return TicketDetailView(ticket: data);
      },
    ),
    GoRoute(
      path: RoutePaths.support,
      builder: (context, state) {
        return const TicketsView();
      },
    ),
    GoRoute(
      path: RoutePaths.units,
      builder: (context, state) {
        return const SystemUnitsView();
      },
    ),
  ],
);
