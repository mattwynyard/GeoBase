// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreLocation;
@import MapKit;
@import CoreData;
@import MessageUI;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSURL;
@class NSManagedObjectModel;
@class NSPersistentStoreCoordinator;
@class NSManagedObjectContext;

SWIFT_CLASS("_TtC7GeoBase11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
@property (nonatomic, strong) NSURL * _Nonnull applicationDocumentsDirectory;
@property (nonatomic, strong) NSManagedObjectModel * _Nonnull managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator * _Nullable persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext * _Nullable managedObjectContext;
- (void)saveContext;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class CLLocationManager;
@class CMMotionManager;
@class NSDate;
@class CLLocation;
@class NSArray;
@class UISegmentedControl;
@class CLHeading;
@class NSError;
@class UILabel;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS_NAMED("CompassController")
@interface CompassController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified strikeLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified dipLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified latitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified longitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified elevationLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified longitudeAccuracy;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified latitudeAccuracy;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified verticalAccuracy;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified pitchLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified yawLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl * _Null_unspecified structSelector;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified structLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified struct2Label;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified headingLabel;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic, readonly, strong) CMMotionManager * _Nonnull motionManager;
@property (nonatomic, readonly, strong) NSDate * _Nonnull date;
@property (nonatomic, strong) CLLocation * _Null_unspecified startLocation;
@property (nonatomic, strong) CLLocation * _Null_unspecified currentLocation;
@property (nonatomic, strong) NSArray * _Null_unspecified locationArray;
@property (nonatomic, copy) NSString * _Null_unspecified dip;
@property (nonatomic, copy) NSString * _Nonnull direction;
@property (nonatomic) int32_t dipInt32;
@property (nonatomic) double dipDouble;
@property (nonatomic) double pitch;
@property (nonatomic) BOOL useTrueNorth;
@property (nonatomic, copy) NSString * _Nullable currentProject;
- (IBAction)indexChanged:(UISegmentedControl * _Nonnull)sender;
- (IBAction)recordButton:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateHeading:(CLHeading * _Nonnull)currentHeading;
- (NSString * _Nonnull)setDirection:(double)heading roll:(double)roll;
- (NSString * _Nonnull)printTimestamp;
- (CLLocationDegrees)getLatitude;
- (CLLocationDegrees)getLongitude;
- (void)startMotion;
- (void)didReceiveMemoryWarning;
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager * _Nonnull)manager;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nonnull)error;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class Project;
@class NSEntityDescription;

SWIFT_CLASS_NAMED("DataModel")
@interface DataModel : NSManagedObject
@property (nonatomic, copy) NSString * _Nonnull date;
@property (nonatomic) int32_t dip;
@property (nonatomic, copy) NSString * _Nonnull direction;
@property (nonatomic) double elevation;
@property (nonatomic, copy) NSString * _Nonnull id;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) int32_t strike;
@property (nonatomic, copy) NSString * _Nonnull structure;
@property (nonatomic, copy) NSString * _Nonnull north;
@property (nonatomic, strong) Project * _Nonnull project;
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;

SWIFT_CLASS("_TtC7GeoBase18DataViewController")
@interface DataViewController : UITableViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSNumber;
@class NSSet;

SWIFT_CLASS_NAMED("Locality")
@interface Locality : NSManagedObject
@property (nonatomic, strong) NSNumber * _Nonnull latitude;
@property (nonatomic, strong) NSNumber * _Nonnull longitude;
@property (nonatomic, strong) NSDate * _Nonnull date;
@property (nonatomic, copy) NSString * _Nonnull field_id;
@property (nonatomic, copy) NSString * _Nonnull notes;
@property (nonatomic, strong) Project * _Nonnull project;
@property (nonatomic, strong) NSSet * _Nonnull data;
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end

@class MKMapView;

SWIFT_CLASS("_TtC7GeoBase13MapController")
@interface MapController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (nonatomic, weak) IBOutlet MKMapView * _Null_unspecified mapView;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic) CLLocationDegrees latDelta;
@property (nonatomic) CLLocationDegrees longDelta;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)locationManager:(CLLocationManager * _Nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIStoryboardSegue;

SWIFT_CLASS("_TtC7GeoBase21MeasurementController")
@interface MeasurementController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS_NAMED("Project")
@interface Project : NSManagedObject
@property (nonatomic, copy) NSString * _Nonnull project;
@property (nonatomic, copy) NSString * _Nonnull date_created;
@property (nonatomic, copy) NSString * _Nonnull notes;
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end

@class NSIndexPath;
@class UISwitch;
@class UITableViewCell;
@class MFMailComposeViewController;
@class UIBarButtonItem;

SWIFT_CLASS("_TtC7GeoBase17ProjectController")
@interface ProjectController : UITableViewController <MFMailComposeViewControllerDelegate>
@property (nonatomic, copy) NSArray * _Nonnull projectList;
@property (nonatomic, strong) NSManagedObject * _Nullable selection;
@property (nonatomic, strong) NSIndexPath * _Nullable defaultPath;
@property (nonatomic, strong) UISwitch * _Nonnull projectSwitch;
@property (nonatomic, strong) UITableViewCell * _Null_unspecified currentCell;
@property (nonatomic, strong) UITableViewCell * _Null_unspecified previousCell;
@property (nonatomic) BOOL isLocked;
@property (nonatomic, copy) NSString * _Nullable currentProject;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified emailButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified lockButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified editButton;
@property (nonatomic, readonly, strong) AppDelegate * _Nonnull appDel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)loadData;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nullable)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nullable)indexPath;
- (BOOL)tableView:(UITableView * _Nonnull)tableView canEditRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (IBAction)lockButton:(id _Nonnull)sender;
- (IBAction)emailData:(id _Nonnull)sender;
- (MFMailComposeViewController * _Nonnull)configuredMailComposeViewController;
- (void)showSendMailErrorAlert;
- (void)mailComposeController:(MFMailComposeViewController * _Nonnull)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError * _Nullable)error;
- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextField;
@class UITouch;
@class UIEvent;
@class UITextView;
@class SaveButton;

SWIFT_CLASS("_TtC7GeoBase23ProjectDetailController")
@interface ProjectDetailController : UIViewController <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified projectLabel;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified notesTextView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified dateLabel;
@property (nonatomic, weak) IBOutlet SaveButton * _Null_unspecified saveButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified exportButton;
@property (nonatomic, copy) NSString * _Nonnull project;
@property (nonatomic, copy) NSString * _Nonnull date_created;
@property (nonatomic, copy) NSString * _Nonnull notes;
@property (nonatomic, strong) NSManagedObject * _Nullable existingItem;
@property (nonatomic) BOOL update;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (BOOL)textFieldShouldReturn:(UITextField * _Nonnull)textField;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (IBAction)saveButton:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7GeoBase10SaveButton")
@interface SaveButton : UIButton
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7GeoBase18SettingsController")
@interface SettingsController : UITableViewController
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified myTableView;
@property (nonatomic, copy) NSArray<NSString *> * _Null_unspecified tableMembers;
@property (nonatomic, strong) UISwitch * _Nonnull northSwitch;
@property (nonatomic, strong) UITextField * _Nonnull dataPrefix;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)northSwitchDidChange:(UISwitch * _Nonnull)switchState;
- (void)restoreSwitchesStates;
- (void)saveSwitchesStates;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7GeoBase9Stereonet")
@interface Stereonet : UIView
- (void)drawRect:(CGRect)rect;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7GeoBase14ViewController")
@interface ViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
