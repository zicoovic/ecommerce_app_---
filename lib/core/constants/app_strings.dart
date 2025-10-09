/// Centralized string constants
/// Follows Single Responsibility Principle - only manages app strings
class AppStrings {
  const AppStrings._();

  // Auth - Login Screen
  static const String loginWelcome = 'Welcome';
  static const String loginSubtitle = 'Please enter your data to continue';
  static const String loginButton = 'Login';
  static const String rememberMe = 'Remember me';
  static const String forgotPassword = 'Forgot password?';

  // Auth - Register Screen
  static const String registerTitle = 'Sign Up';
  static const String registerButton = 'Create Account';
  static const String alreadyHaveAccount = 'Already have an account?';

  // Auth - Fields
  static const String emailLabel = 'Email Address';
  static const String emailHint = 'example@email.com';
  static const String passwordLabel = 'Password';
  static const String passwordHint = '""""""""';
  static const String usernameLabel = 'Username';
  static const String usernameHint = 'Esther Howard';

  // Auth - Validation
  static const String emailRequired = 'Please enter your email';
  static const String emailInvalid = 'Please enter a valid email';
  static const String passwordRequired = 'Please enter your password';
  static const String passwordWeak = 'Password must be at least 6 characters';
  static const String usernameRequired = 'Please enter your username';

  // Password Strength
  static const String passwordStrengthWeak = 'Weak';
  static const String passwordStrengthMedium = 'Medium';
  static const String passwordStrengthStrong = 'Strong';

  // Terms & Conditions
  static const String termsText =
      'By connecting your account confirm that you agree\nwith our ';
  static const String termsLink = 'Term and Condition';

  // Onboarding
  static const String onboardingTitle = 'Look Good, Feel Good';
  static const String onboardingSubtitle =
      'Create your individual & unique style and look amazing everyday.';
  static const String onboardingMen = 'Men';
  static const String onboardingWomen = 'Women';
  static const String onboardingSkip = 'Skip';

  // Gender Options
  static const String genderMen = 'men';
  static const String genderWomen = 'women';
  static const String genderAll = 'all';

  // Products
  static const String productsTitle = 'Products';
  static const String productsEmpty = 'No products available';

  // Common
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String retry = 'Retry';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const String edit = 'Edit';

  // Navigation
  static const String home = 'Home';
  static const String profile = 'Profile';
  static const String settings = 'Settings';
  static const String logout = 'Logout';
}