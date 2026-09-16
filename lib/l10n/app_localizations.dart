import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

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
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutMe;

  /// No description provided for @aboutMeDescription1.
  ///
  /// In en, this message translates to:
  /// **'I am Alejandro Aguilar Alba, a passionate programmer always looking for new opportunities to learn and grow in the world of technology. I continually strive to excel in the industry, combining unwavering dedication with a meticulous approach to development.'**
  String get aboutMeDescription1;

  /// No description provided for @aboutMeDescription2.
  ///
  /// In en, this message translates to:
  /// **'My proactive attitude allows me to effectively face complex challenges, while I enjoy exploring and applying the latest trends and technologies. This keeps me at the forefront and helps me deliver innovative solutions. My commitment to continuous training is what drives my constant evolution, always seeking excellence in each project.'**
  String get aboutMeDescription2;

  /// No description provided for @downloadCV.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCV;

  /// No description provided for @knowledge.
  ///
  /// In en, this message translates to:
  /// **'Knowledge'**
  String get knowledge;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon...'**
  String get comingSoon;

  /// No description provided for @contact_me.
  ///
  /// In en, this message translates to:
  /// **'Contact form'**
  String get contact_me;

  /// No description provided for @see_project.
  ///
  /// In en, this message translates to:
  /// **'See all projects'**
  String get see_project;

  /// No description provided for @certificate.
  ///
  /// In en, this message translates to:
  /// **'Certificate'**
  String get certificate;

  /// No description provided for @practices.
  ///
  /// In en, this message translates to:
  /// **'Programmer intern'**
  String get practices;

  /// No description provided for @programmerSpain.
  ///
  /// In en, this message translates to:
  /// **'Junior full stack programmer'**
  String get programmerSpain;

  /// No description provided for @formName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get formName;

  /// No description provided for @formEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get formEmail;

  /// No description provided for @formMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get formMessage;

  /// No description provided for @formSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get formSubject;

  /// No description provided for @formRequestCorrect.
  ///
  /// In en, this message translates to:
  /// **'The message has been sent successfully'**
  String get formRequestCorrect;

  /// No description provided for @formRequestInCorrect.
  ///
  /// In en, this message translates to:
  /// **'Error sending message'**
  String get formRequestInCorrect;

  /// No description provided for @sendEmail.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get sendEmail;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @skills1.
  ///
  /// In en, this message translates to:
  /// **'Problem solving'**
  String get skills1;

  /// No description provided for @skills2.
  ///
  /// In en, this message translates to:
  /// **'Teamwork'**
  String get skills2;

  /// No description provided for @skills3.
  ///
  /// In en, this message translates to:
  /// **'Proactive communication'**
  String get skills3;

  /// No description provided for @textCommit.
  ///
  /// In en, this message translates to:
  /// **'Commits made'**
  String get textCommit;

  /// No description provided for @practicesNextPort1.
  ///
  /// In en, this message translates to:
  /// **'- Knowledge of agile methodologies.'**
  String get practicesNextPort1;

  /// No description provided for @practicesNextPort2.
  ///
  /// In en, this message translates to:
  /// **'- Experience in real Flutter projects.'**
  String get practicesNextPort2;

  /// No description provided for @practicesNextPort3.
  ///
  /// In en, this message translates to:
  /// **'- Experience working with Java.'**
  String get practicesNextPort3;

  /// No description provided for @programadorSpainSur1.
  ///
  /// In en, this message translates to:
  /// **'- I develop software to automate and optimize processes.'**
  String get programadorSpainSur1;

  /// No description provided for @programadorSpainSur2.
  ///
  /// In en, this message translates to:
  /// **'- I implement solutions to integrate systems and services.'**
  String get programadorSpainSur2;

  /// No description provided for @programadorSpainSur3.
  ///
  /// In en, this message translates to:
  /// **'- I design efficient and scalable applications.'**
  String get programadorSpainSur3;

  /// No description provided for @descriptionHeader.
  ///
  /// In en, this message translates to:
  /// **'Full Stack developer passionate about programming and learning.'**
  String get descriptionHeader;

  /// No description provided for @workExperience.
  ///
  /// In en, this message translates to:
  /// **'Work experience'**
  String get workExperience;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @server.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get server;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @myExperience.
  ///
  /// In en, this message translates to:
  /// **'My experience using'**
  String get myExperience;

  /// No description provided for @javaExperience.
  ///
  /// In en, this message translates to:
  /// **'During my professional experience, I have developed enterprise solutions using Java and Spring Boot, applying best practices and programming principles. I have worked on the development and maintenance of services and applications, contributing to projects focused on process automation and optimization through Java-based solutions.'**
  String get javaExperience;

  /// No description provided for @netMauiExperience.
  ///
  /// In en, this message translates to:
  /// **'I have been working with .NET MAUI for the past year, developing key skills in building cross-platform applications. Over this time, I have completed several mini projects that have allowed me to become more familiar with the capabilities and features of .NET MAUI.'**
  String get netMauiExperience;

  /// No description provided for @flutterExperience.
  ///
  /// In en, this message translates to:
  /// **'I have mainly worked with Flutter through personal projects, developing cross-platform applications and gaining experience with the framework. I have also complemented this knowledge through professional training.'**
  String get flutterExperience;

  /// No description provided for @androidExperience.
  ///
  /// In en, this message translates to:
  /// **'I have been working with Android development for a year, gaining a solid understanding of building native apps. My passion for learning has led me to explore various areas of Android development, from creating intuitive user interfaces to API integration and local database management'**
  String get androidExperience;

  /// No description provided for @phpExperience.
  ///
  /// In en, this message translates to:
  /// **'I have acquired a solid knowledge of PHP, thanks to my intensive learning during the Higher Degree. This educational environment has provided me with a solid foundation in backend web development, allowing me to manage databases, develop dynamic applications'**
  String get phpExperience;

  /// No description provided for @kotlinExperience.
  ///
  /// In en, this message translates to:
  /// **'I started learning Kotlin as a result of my work with Android development, quickly becoming familiar with its modern and concise syntax. As I delved deeper into its use for mobile applications, I have also begun to explore its capabilities for backend development.'**
  String get kotlinExperience;

  /// No description provided for @htmlExperience.
  ///
  /// In en, this message translates to:
  /// **'I have worked with HTML during my studies and on various projects, developing a solid foundation for creating and structuring web pages. I have knowledge of its main tags and elements, applying them to build clear and well-organized structures.'**
  String get htmlExperience;

  /// No description provided for @cssExperience.
  ///
  /// In en, this message translates to:
  /// **'I have worked with CSS during my studies and on various projects, gaining experience in designing and styling web pages. I have knowledge of properties, selectors, and different techniques for creating visually appealing and well-structured interfaces.'**
  String get cssExperience;

  /// No description provided for @mysqlExperience.
  ///
  /// In en, this message translates to:
  /// **'I have worked with MySQL and SQL during my studies and professional experience, developing queries and managing databases for Java applications. I have experience working with data and connecting databases to applications using Spring Boot.'**
  String get mysqlExperience;

  /// No description provided for @mongoExperience.
  ///
  /// In en, this message translates to:
  /// **'I have been learning MongoDB for less than a year, getting familiar with its syntax and operation. Although my experience is recent, I have a good understanding of how to manage NoSQL databases and work with JSON documents to store and query data in a flexible way.'**
  String get mongoExperience;

  /// No description provided for @firebaseExperience.
  ///
  /// In en, this message translates to:
  /// **'I have worked with Firebase on several projects, including my undergraduate thesis, and have performed tests using its Realtime Database functionality. I have experience integrating Firebase to manage authentication, real-time data storage, and synchronization across web and mobile applications.'**
  String get firebaseExperience;

  /// No description provided for @gitExperience.
  ///
  /// In en, this message translates to:
  /// **'I have used Git throughout my studies and professional experience to manage project version control. I have experience working with repositories, commits, and branches, maintaining an organized workflow and facilitating team collaboration.'**
  String get gitExperience;

  /// No description provided for @gitHubExperience.
  ///
  /// In en, this message translates to:
  /// **'I have used GitHub throughout my studies, as well as in personal and professional projects. I have experience managing repositories and using tools such as pull requests and issues to maintain an organized workflow.'**
  String get gitHubExperience;

  /// No description provided for @intelIjExperience.
  ///
  /// In en, this message translates to:
  /// **'IntelliJ is one of the development environments I regularly use to work with Java and Spring Boot. I am comfortable using its tools for developing, debugging, and managing projects efficiently.'**
  String get intelIjExperience;

  /// No description provided for @springExperience.
  ///
  /// In en, this message translates to:
  /// **'I have professional experience developing backend applications and services using Spring Boot and Java. I have worked on the development and maintenance of a monolithic application, creating processes and services connected to SQL databases.'**
  String get springExperience;

  /// No description provided for @javaScriptExperience.
  ///
  /// In en, this message translates to:
  /// **'I have knowledge of JavaScript gained through my studies and web development experience. I have used the language to develop web functionalities and interfaces, complementing my frontend experience with technologies such as Angular.'**
  String get javaScriptExperience;

  /// No description provided for @descriptionTasty.
  ///
  /// In en, this message translates to:
  /// **'This is a final year project. The application uses Firebase with realtime, authentication, storage and Gemini. The purpose of the project is to be able to show the data of a product, as well as to be able to see on a map where the associated restaurants are located on the map.'**
  String get descriptionTasty;

  /// No description provided for @typeScriptExperience.
  ///
  /// In en, this message translates to:
  /// **'I have experience using TypeScript to develop web applications, working with types, interfaces, and organized structures to create maintainable code and integrate it with backend services.'**
  String get typeScriptExperience;

  /// No description provided for @angularExperience.
  ///
  /// In en, this message translates to:
  /// **'I have experience developing web interfaces with Angular, working on projects of different sizes and using well-organized project structures. I am able to develop reusable components, manage interface logic, and integrate the frontend with backend services to build complete and maintainable applications.'**
  String get angularExperience;

  /// No description provided for @descriptionPokeApi.
  ///
  /// In en, this message translates to:
  /// **'Poke Api is an app developed in Flutter that uses the PokéAPI to display detailed information about Pokémon. The app allows users to explore a complete list of Pokémon, view their stats, abilities, moves, and types, all with a user-friendly interface inspired by the style of the Pokémon universe.'**
  String get descriptionPokeApi;

  /// No description provided for @descriptionOtelo.
  ///
  /// In en, this message translates to:
  /// **'Game made with Java without a graphical interface, it works through the terminal. It is made with Java 17 and following best practices.'**
  String get descriptionOtelo;

  /// No description provided for @descriptionGomoku.
  ///
  /// In en, this message translates to:
  /// **'Game made with Java without a graphical interface. First project with several modes, player vs player, player vs bot and bot vs bot.'**
  String get descriptionGomoku;

  /// No description provided for @descriptionAppTeacher.
  ///
  /// In en, this message translates to:
  /// **'Project carried out in my higher education. It is an application aimed at teachers. Its objective is to be able to keep track of all the students in the app and to be able to see how many hours they have completed in total, as well as being able to see their personal data and finally being able to create a PDF of all their hours and work completed in the practices.'**
  String get descriptionAppTeacher;

  /// No description provided for @descriptionAppStudent.
  ///
  /// In en, this message translates to:
  /// **'Project carried out in my higher education. It is an application aimed at students. Its objective is to control the work carried out in the module\'s practices, indicating how much time we have spent on the task and its time. It also has a cloud database where you can create a student account or log in with the Firebase authenticator.'**
  String get descriptionAppStudent;

  /// No description provided for @descriptionUltraRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Project carried out in my higher education. It is an application for a food company that wants to be able to show its products. You can log in or register, and you can also view a product catalogue where you can filter them in different ways.'**
  String get descriptionUltraRestaurant;

  /// No description provided for @descriptionImcCalculator.
  ///
  /// In en, this message translates to:
  /// **'Project developed using the Maui .Net framework, it is a body mass index calculator.'**
  String get descriptionImcCalculator;

  /// No description provided for @descriptionProjectPaint.
  ///
  /// In en, this message translates to:
  /// **'Project developed with pure HTML, CSS and JavaScript, which allows interactive drawing in a simple interface. Deployed in Vercel to ensure fast performance and smooth updates.'**
  String get descriptionProjectPaint;

  /// No description provided for @descriptionTicTacToe.
  ///
  /// In en, this message translates to:
  /// **'I\'ve created a 3-stripe game, Tic Tac Toe, using React and JavaScript in Visual Studio. This project is one of my first at React and has taught me about interactive interfaces and state management. The game allows two players to compete and spot winners, which has improved my programming skills and my understanding of web applications.'**
  String get descriptionTicTacToe;

  /// No description provided for @eclipseExperience.
  ///
  /// In en, this message translates to:
  /// **'Eclipse is the integrated development environment (IDE) that started my programming journey. I feel very comfortable working in this environment, taking advantage of its advanced tools and features to develop Java projects efficiently and productively. It was the first IDE I used, and it continues to be a fundamental platform in my workflow.'**
  String get eclipseExperience;

  /// No description provided for @visualEstudioExperience.
  ///
  /// In en, this message translates to:
  /// **'Visual Studio is the integrated development environment (IDE) that I use specifically for working with .NET MAUI. Although it is not my primary tool, I feel comfortable using it for projects on this platform, taking advantage of its powerful tools and features that facilitate efficient development of cross-platform applications. It is a robust solution for my .NET MAUI projects.'**
  String get visualEstudioExperience;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
