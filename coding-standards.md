# C#, SQL, and Unit Testing Coding Standards and Naming Conventions

Below are our **C# coding standards**, naming conventions and best practices.


*    [Coding Style](#markdown-header-coding-style)
*    [Unit Testing Guidelines](#markdown-header-unit-testing-guidelines)
*    [SQL Guidelines](#markdown-header-sql-guidelines)
*    [Service Layer Guidelines](#markdown-header-service-layer-guidelines)



## Do
#### use prefix `_` followed by `camelCasing` naming convention for private readonly variables.

```c
public class ClientActivity
{
    private readonly ICalendarMonth _calendarMonth
    
    public void ClientActivity(ICalendarMonth calendarMonth)
    {
        _calendarMonth = calendarMonth;
    }

}
```

**Why**: This is the standard used by stylecop, resharper and microsoft 

---

## Do
#### use `PascalCasing` for class names, method names, private static variables.

```c
public class ClientActivity
{
    private static readonly double Ratio = 0.75;
    
    public void ClearStatistics()
    {
        //...
    }
    public void CalculateStatistics()
    {
        //...
    }
}
```

**Why**: consistent with the Microsoft's .NET Framework and easy to read.

---

## Do
#### use `camelCasing` for method arguments and local variables.

```c
public class UserLog
{
    public void Add(LogEvent logEvent)
    {
        int itemCount = logEvent.Items.Count;
        // ...
    }
}
```
**Why**: consistent with the Microsoft's .NET Framework and easy to read.

---
## Do Not
#### use `Hungarian` notation or any other type identification in identifiers

```c
// Correct
int counter;
string name;
 
// Avoid
int iCounter;
string strName;
```
**Why**: consistent with the Microsoft's .NET Framework and Visual Studio IDE makes determining types very easy (via tooltips). In general you want to avoid type indicators in any identifier.

---
## Do Not
#### use `Screaming Caps` for constants or read-only variables

```c
// Correct
public static const string ShippingType = "DropShip";
 
// Avoid
public static const string SHIPPINGTYPE = "DropShip";
```
**Why**: consistent with the Microsoft's .NET Framework. Caps grap too much attention.

---
## Do
#### use `PascalCasing` for abbreviations `3 characters or more` (2 chars are both uppercase)

```c
HtmlHelper htmlHelper;
FtpTransfer ftpTransfer;
UIControl uiControl;
```
**Why**: consistent with the Microsoft's .NET Framework. Caps would grap visually too much attention.


---
## Avoid
#### using `Abbreviations`. **Exception**: abbreviations commonly used as names, such as `Id, Xml, Ftp, Uri`

```c
// Correct
UserGroup userGroup;
Assignment employeeAssignment;
 
// Avoid
UserGroup usrGrp;
Assignment empAssignment;
 
// Exceptions
CustomerId customerId;
XmlDocument xmlDocument;
FtpHelper ftpHelper;
UriPart uriPart;
```
**Why**: consistent with the Microsoft's .NET Framework and prevents inconsistent abbreviations.

---
## Do
#### use method names explaining the action of method. The method name should tell what it Does.

```c
// Avoid
public void GetData(int accountId)
{
    //...
}
    
// Correct
public void GetAccountDetailsById(int acccountId)
{
    //...
}
```
**Why**: There is no need of Documentation explaining what the method Does explicitly.

---
## Do Not
#### use `Underscores` in identifiers.

```c
// Correct
public DateTime clientAppointment;
public TimeSpan timeLeft;
 
// Avoid
public DateTime client_Appointment;
public TimeSpan time_Left;
```
**Why**: consistent with the Microsoft's .NET Framework and makes code more natural to read (without 'slur'). Also avoids underline stress (inability to see underline).


---
## Do
#### use noun or noun phrases to name a class.

```c
public class Employee
{
}
public class BusinessLocation
{
}
public class DocumentCollection
{
}
```
**Why**: consistent with the Microsoft's .NET Framework and easy to remember.

## Do
#### prefix interfaces with the letter `I`.  Interface names are noun (phrases) or adjectives.

```c
public interface IShape
{
}
public interface IShapeCollection
{
}
public interface IGroupable
{
}
```
**Why**: consistent with the Microsoft's .NET Framework.

---
## Do
#### `name source files` according to their `main classes`. **Exception**: file names with partial classes reflect their source or purpose, e.g. designer, generated, etc.

```c
// Located in Task.cs
public partial class Task
{
    //...
}
// Located in Task.generated.cs
public partial class Task
{
    //...
}
```
**Why**: consistent with the Microsoft practices. Files are alphabetically sorted and partial classes remain adjacent.

---
## Do
#### use `singular names` for enums. **Exception**: bit field enums.

```c
// Correct
public enum Color
{
    Red,
    Green,
    Blue,
    Yellow,
    Magenta,
    Cyan
}

// Exception
[Flags]
public enum Dockings
{
    None = 0,
    Top = 1, 
    Right = 2, 
    Bottom = 4,
    Left = 8
}
```

**Why**: consistent with the Microsoft's .NET Framework and makes the code more natural to read. Plural flags because enum can hold multiple values (using bitwise 'OR').


---
# Coding Style
[Back To Top](#markdown-header-c-sql-and-unit-testing-coding-standards-and-naming-conventions)

## Do
#### use `Assert.AreEqual` or `Assert.AreNotEqual` over `Assert.IsTrue` and `Assert.IsFalse`
```c

//Avoid
Assert.IsTrue(results.Count() == 4);
Assert.IsFalse(results.Count() == 5);
    
//Correct
Assert.AreEqual(4, results.Count());
Assert.AreNotEqual(5, results.Count());
```

**Why**: When a unit test fails, the error message includes what is expected and what is actual. This makes it easier to debug a unit test should it fail.


## Do
#### `Always` use `explicit scope: private, public, protected, etc.`.

```c
// Avoid
class Something
{
    const int MaximumAge = 100;
    int Age { get; set; }
 
    void SayHello()
    {
        Console.WriteLine("Hello.");
    }
}

// Correct
public class Something
{
    private const int MaximumAge = 100;
    public int Age { get; set; }
 
    public void SayHello()
    {
        Console.WriteLine("Hello.");
    }
}
```

---
## Do
#### use `predefined type names` instead of system type names like `Int16, Single, UInt64, etc.`

```c
// Correct
string firstName;
int lastIndex;
bool isSaved;
 
// Avoid
String firstName;
Int32 lastIndex;
Boolean isSaved;
```
**Why**: consistent with the Microsoft's .NET Framework and makes code more natural to read. 

---
## Do
#### use implicit type `var` for local variable declarations. **Exception**: primitive types (`int, string, Double, etc`) use predefined names.

```c
var stream = File.Create(path);
var customers = new Dictionary();
 
// Exceptions
int index = 100;
string timeSheet;
bool isCompleted;
```
**Why**: removes clutter, particularly with complex generic types. Type is easily detected with Visual Studio tooltips.

---
## Do
#### Constructors `with no bodies` can be shortened to `one line`.

```c
public NotFoundException() {}
  
public NotFoundException(string message)
    : base(message) {}
```
**Why**: Maintains good organization.

## Do
#### Bring `base` or `this` constructors onto a separate line (`indented`).

```c
public NotFoundException(string message, string typeName, string identifier)
    : base(message)
{
    TypeName = typeName;
    Identifier = identifier;
}
```
**Why**: Easy identifies a base constructor is called, maintains good organization.


---
## Do
#### vertically align curly brackets.

```c
// Correct
class Program
{
    static void Main(string[] args)
    {
    }
}
```
**Why**: Microsoft has a different standard, but developers have overwhelmingly preferred vertically aligned brackets.

---
## Do
#### declare all `member variables` at the top of a class, with `static variables` at the very top.

```c
// Correct
public class Account
{
    public static string BankName;
    public static decimal Reserves;
 
    public string Number {get; set;}
    public DateTime DateOpened {get; set;}
    public DateTime DateClosed {get; set;}
    public decimal Balance {get; set;}
 
    // Constructor
    public Account()
    {
        // ...
    }
}
```
**Why**: generally accepted practice that prevents the need to hunt for variable declarations.

---
## Do Not
#### explicitly specify a type of an enum or values of enums (except bit fields)

```c
// Avoid
public enum Direction : long
{
    North = 1,
    East = 2,
    South = 3,
    West = 4
}
 
// Correct
public enum Direction
{
    North,
    East,
    South,
    West
}

// Exception
[Flags]
public enum Dockings
{
    None = 0,
    Top = 1, 
    Right = 2, 
    Bottom = 4,
    Left = 8
}
```

**Why**: can create confusion when relying on actual types and values.

---
## Do Not
#### `suffix` enum names `with Enum`

```c
// Avoid
public enum CoinEnum
{
    Penny,
    Nickel,
    Dime,
    Quarter,
    Dollar
}
 
// Correct
public enum Coin
{
    Penny,
    Nickel,
    Dime,
    Quarter,
    Dollar
}
```
**Why**: consistent with the Microsoft's .NET Framework and consistent with prior rule of no type indicators in identifiers.

---
## Do
#### `Reduce nesting` in favor a coding style of `fail fast` (and also `exit fast`)

```c
// Avoid
public void SomeMethod(ISomethingProvider somethingProvider)
{
    if (somethingProvider != null)
    {
        var things = _somethingElseProvider.GetThoseThings();
        // Lots of logic here that a maintainer has to scroll through.
    }
    else
    {
        // This should be moved to the top of the method
        throw new ArgumentNullException("somethingProvider");
    }
}

// Correct
public void SomeMethod(ISomethingProvider somethingProvider)
{
    // Check for known failure condition and exit quickly
    if (somethingProvider == null)
        throw new ArgumentNullException("somethingProvider");
 
    var things = _somethingElseProvider.GetThoseThings();
}
```
**Why**: When there is an exception to be thrown or a value to be returned with no further logic, perform that logic immediately rather than leaving it for an else clause. Reduces complexity and readability of code.

---
## Avoid
#### using `empty quotes ("")` use `string.Empty`.

```c
// Avoid
string message = "";
 
//Correct
string message = string.Empty;
```
**Why**:  It clarifies true intent.

---
## Do
#### use `Enums` over `integers` for status and other `flags` throughout the application. Always check if one is available in the `innRoad.Data.Enums` namespace. Cast `Enum` to `int` only when absolutely required.

```c
// Avoid
int reservationStatus = 3;
 
//Correct
var reservationStatus = ReservationStatus.Confirmed;
// Also Correct
ReservationStatus reservationStatus = ReservationStatus.Confirmed;
```
**Why**:  Readability.

---
## Preferred
#### use of `expression` within `.FirstOrDefault(expression)` rather than in `.Where(expression).FirstOrDefault()`

```c
//This is Preferred
roomIds.FirstOrDefault(x=>x.Id = 1);
roomIds.First(x=>x.Id = 1);
roomIds.Single(x=>x.Id = 1);

//Over this
roomIds.Where(x=>x.Id = 1).FirstOrDefault();
roomIds.Where(x=>x.Id = 1).First();
roomIds.Where(x=>x.Id = 1).Single();
```
**Why**:  It clarifies true intent and is concise.

---
## Preferred
#### use `.FirstOrDefault(x => x.Id = 1)` over `.First(x => x.Id = 1)` unless you're doing it for a reason.

```c
// First throws an exception when no data is returned. You should only uses this when a exemption is expected and then appropriately handled.
roomIds.First(x => x.Id = 1);

//Returns null if no rooms match condition. Handle null appropriately.
roomIds.FirstOrDefault(x => x.Id = 1);
```
**Why**: First() may result in additional logic added to catch block, when one simply wanted to take a different flow path when a null is returned.

---
## Preferred
#### use `ternary (? :) operator` over `if-else` statement.

```c
//This is Preferred
y = x > 10 ? x : 5

//Over this
if (x > 10)
{
    y = x;
}
else
{
    y = 5;
}
```
**Why**:  Readability

---
## Preferred
#### use `?? operator` over `if-else` statement for not null check.

```c
//This is Preferred
var y = x ?? string.Empty;

//Over this
if (x != null)
{
    y = x;
}
else
{
    y = string.Empty;
}
```
**Why**:  Readability 

---
## Preferred
#### use `string interpolation ($"")` over `string concatenation / StringBuilder`.

```c
//This is Preferred
string customerName = $"{customer.FirstName} {customer.LastName}";

//Over this
string customerName = customer.FirstName + " " + customer.LastName;
//Or this
StringBuilder builder = new StringBuilder();
builder.Append(customer.FirstName);
builder.Append(" ");
builder.Append(customer.LastName);

string customerName = builder.ToString();
```
**Why**:  Readability

---
## Preferred
* use `IEnumerable<T>` for collections

* classes that have public `IEnumerable<T>` properties are initialized with an empty collection

* methods that return `IEnumerable<T>` should not return a null

## Do
Refrain from using the `.ToList()` methods on the IEnumerables

**Why**:  `.ToList()` forces the immediate query evaluation and returns a `List<T>` that contains the query results.

## Do
Use `.Any()` rather than `.Count()` to determine if the collection is empty or not

**Why**:  `.Any()` looks at the first entry in the collection whereas `.Count()` iterates through the entire colection

## Do Not
Mix and match `public` and `private` methods in the class

Define 2 `#region`s - one for the public methods and the other for the private methods

## Do
Use the string's `.Equals()` method in conjunction with the `StringComparison.InvariantCultureIgnoreCase` enumeration when performing string comparisons.

Review Microsoft's recommendations and best practices for using strings: https://docs.microsoft.com/en-us/dotnet/standard/base-types/best-practices-strings?view=netframework-4.8

---
# Asynchronous Programming
[Back To Top](#markdown-header-c-sql-and-unit-testing-coding-standards-and-naming-conventions)

## Preferred
#### In async method, when awaiting multiple tasks
```c
public async Task DoSomethingAsync()
{
    Task task1 = SomeAsyncMethodCall();
    Task task2 = SomeAsyncMethodCall();
    Task task3 = SomeAsyncMethodCall();
    Task task4 = SomeAsyncMethodCall();
    Task task5 = SomeAsyncMethodCall();

    await Task.WhenAll(task1,
        task2,
        task3,
        task4,
        task5);
}

// Or

public async Task DoSomethingAsync()
{
    Task task1 = SomeAsyncMethodCall();
    Task task2 = SomeAsyncMethodCall();

    await task1;
    await task2;
}

// Over this

public async Task DoSomethingAsync()
{
    Task task1 = SomeAsyncMethodCall();
    Task task2 = SomeAsyncMethodCall();
    Task task3 = SomeAsyncMethodCall();
    Task task4 = SomeAsyncMethodCall();
    Task task5 = SomeAsyncMethodCall();

    Task.WaitAll(task1,
        task2,
        task3,
        task4,
        task5);
}
```

**Why**: WaitAll is a blocking call. 
The tread will be blocked until all the tasks are completed. 
When awaiting WhenAll, the thread will be able to do something useful.

# Unit Testing Guidelines
[Back To Top](#markdown-header-c-sql-and-unit-testing-coding-standards-and-naming-conventions)

## Do
#### Run unit test coverage reports to help cover code.
```c
* Install Report Generator Tool (One Time Setup)
dotnet tool install --global dotnet-reportgenerator-globaltool --version 4.0.11

* Run Unit Test
dotnet test <PathToSolution or UnitTestProject>

* Generate Report (Assumes currentDirectory is solutionPath)
reportgenerator "-reports:.\*\coverage.opencover.xml" "-targetdir:.\TestCoverageReport"

* Navigate to TestCoverageReport folder and open index.html to view test coverage results.
```



## Do
#### name your test cases with `[MethodToTest]_[TestCondition]_[ExpectedResult]`
```c
[TestMethod]
public async Task GetActivePoliciesAsync_ValidPolicyFilter_ReturnsList()
{
    ....
}
```

## Do
#### test only one code path
```c
[TestMethod]
public async Task GetActivePoliciesAsync_ValidPolicyFilter_ReturnsList()
{
    ....

    var results = await controller.GetActivePoliciesAsync(policyFilter);
    Assert.IsNotNull(results);
    Assert.IsInstanceOfType(results, typeof(List<ActivePolicy>));
    Assert.AreEqual(results.Count(), 4);

    ....
}
```


## Do
#### use the `[ExpectedException(typeof( ... ))]` attribute if the method under test will throw an exception
```c
[TestMethod]
public async Task CreateTransactionAsync_NoCreditCardToken_ThrowsException()
{
    Func<Task> action = () => serviceToTest.MethodToTest(parameters);
    await ExceptionAssert.ThrowsAsync<InvalidOperationException>(action, "Credit Card token number is empty.");
}

[TestMethod]
public async Task CreateTransactionAsync_NoTerritoryFound_ThrowsException()
{
    Func<Task> action = () => serviceToTest.MethodToTest(parameters);
    await ExceptionAssert.ThrowsAsync<InvalidOperationException>(action, "Territory with ID: '9999' is not found.");
}
```
## Do
#### test the individual public properties of the object if the method under test returns an object
```c
    [TestMethod]
    public void SchedulerService_ToDictionary_ReturnsCorrectDictionary()
    {
        EmailSchedulerRequest request = new EmailSchedulerRequest()
        {
            ReservationId = 6294888,
            ClientId = 479,
            PropertyId = 889,
            UserId = 4212,
            SourceId = 2611,
            PrevStartDate = DateTime.MinValue,              // set to DateTime.MinValue
            PrevEndDate = DateTime.MinValue,                // for new reservations, consider this as a date change so that Arrival\Departure date based triggers if configured, can be created
            StartDate = DateTime.UtcNow.AddDays(15).Date,
            EndDate = DateTime.UtcNow.AddDays(30).Date,
            PrevReservationStatus = -1,                     // set to -1 to trigger IsStatusChange event
            ReservationStatus = 3,
            PrevRatePlanId = 1,                             // set to same RatePlanID to prevent triggering IsRateChange event
            RatePlanId = 1,
            IsRoomChange = false,                           // set to false to prevent triggering IsRoomChange event
            IsRoomChangeParkingLot = false,                 // set to false to prevent triggering IsRoomChange event
            PropertyTimeZone = "Eastern Standard Time",
            IsRateChange = false
        };

        Dictionary<string, string> result = request.ToDictionary();

        Assert.AreEqual(request.ReservationId.ToString(), result["RefferenceId"]);
        Assert.AreEqual(request.ClientId.ToString(), result["ClientId"]);
        Assert.AreEqual(request.PropertyId.ToString(), result["PropertyId"]);
        Assert.AreEqual(request.UserId.ToString(), result["UserId"]);
        Assert.AreEqual(request.SourceId.ToString(), result["SourceId"]);
        Assert.AreEqual(request.PrevStartDate.ToString(), result["PrevStartDate"]);
        Assert.AreEqual(request.PrevEndDate.ToString(), result["PrevEndDate"]);
        Assert.AreEqual(request.StartDate.ToString(), result["StartDate"]);
        Assert.AreEqual(request.EndDate.ToString(), result["EndDate"]);
        Assert.AreEqual(request.PrevReservationStatus.ToString(), result["PrevReservationStatus"]);
        Assert.AreEqual(request.ReservationStatus.ToString(), result["ReservationStatusValue"]);
        Assert.AreEqual(request.PrevRatePlanId.ToString(), result["PrevRatePlanId"]);
        Assert.AreEqual(request.RatePlanId.ToString(), result["RatePlanID"]);
        Assert.AreEqual(request.IsRoomChange.ToString(), result["IsRoomChange"]);
        Assert.AreEqual(request.IsRoomChangeParkingLot.ToString(), result["IsRoomChangeParkingLot"]);
        Assert.AreEqual(request.PropertyTimeZone.ToString(), result["PropertyTimeZone"]);
        Assert.AreEqual(request.IsRateChange.ToString(), result["IsRateChange"]);
    }
``` 

## Do
#### setup the Mocks inside the test methods
```c
[TestMethod]
public async Task GetAvailableRatesAsync_NoRoomClasses_ReturnsEmptyList()
{
    var builder = new TestBuilder();
    builder.MockPropertyService.Setup(a => a.GetRoomClassesAsync(ValidPropertyId))
                               .ReturnsAsync(new List<RoomClassInfo>());
    builder.MockPropertyService.Setup(a => a.GetRulesAsync(ValidPropertyId, ValidSourceId, StartDate, EndDate, ValidRatePlanId))
                               .ReturnsAsync(PropertyRules);

    builder.MockRateService.Setup(a => a.GetRateMappingsAsync(ValidPropertyId, ValidSourceId, ValidRatePlanId, StartDate, EndDate))
                           .ReturnsAsync(RateRules);
    builder.MockRateService.Setup(a => a.GetCalendarRatesAsync(It.IsAny<RateFilter>()))
                           .ReturnsAsync(CalendarRates);

    var service = builder.Build();

    var result = await service.GetRoomClassRatesAsync(ValidPropertyId, ValidSourceId, ValidRatePlanId, StartDate, EndDate);
    Assert.IsNotNull(result);
    Assert.IsTrue(result.Count() == 0);
}
```


## Do
#### use the Mock's Verify() and VerifyAll() methods for controllers invoking service methods
```c
[TestMethod]
public async Task BookingController_NoDeposit_Succeeds()
{
    ....

    // No Deposit - Payment Gateway Service is never called
    builder.PaymentGatewayService.Verify(x => x.SaleAsync(It.IsAny<int>(), It.IsAny<Guarantee>()), Times.Never);
    builder.PaymentGatewayService.Verify(x => x.VoidAsync(It.IsAny<int>(), It.IsAny<PaymentGatewayResponse>()), Times.Never);
    
    // send email is called once
    builder.EmailService.Verify(x => x.SendConfirmationEmailAsync(It.IsAny<IPropertyContext>(), It.IsAny<int>(), It.IsAny<Customer>()), Times.Once);
    builder.EmailService.Verify(x => x.ScheduleReservationEmailsAsync(It.IsAny<IPropertyContext>(), It.IsAny<int>(), It.IsAny<int>(), It.IsAny<DateTime>(), It.IsAny<DateTime>(), It.IsAny<int>(), It.IsAny<int>()), Times.Once);

    builder.BookingService.VerifyAll();
    builder.VerifyLogInfoIsCalled();
}
```

---
# SQL Guidelines
[Back To Top](#markdown-header-c-sql-and-unit-testing-coding-standards-and-naming-conventions)


**Additional SQL Style Guidelines are available here: https://www.sqlstyle.guide/**


## Do
#### use `Spaces` over `Tabs` in sql files.

```
Configure Visual Studio to use spaces for Sql files.

In visual studio Click 'Debug > Options'

```

![Configure VS](images/visualStudioSettings.png)

```
Convert all tabs to spaces.

1) Select All (Ctrl+A)
2) Click 'Edit > Advanced > Untabify Selected lines`
```
![Convert Tabs to Spaces](images/convertTabsToSpaces.png)


##### Avoid mixing tabs and spaces. See screenshot below for example.
![Avoid Mixing Tabs and Spaces](images/mixedTabsAndSpaces.png)

**Why**: Readability in code reviews. The bitbucket compare tools do not handle alignment well when mixing `tabs` vs `spaces`.

## Do
#### use `SELECT column1, column2, etc.` over `SELECT *`
```sql
--Avoid
SELECT * 
FROM Room
WHERE Id = 1

--Correct
SELECT RoomId
     , RoomDescription
  FROM Room
 WHERE Id = 1

--Given
CREATE TABLE #temp (
    RoomId INT
  , RoomDescription DATETIME
    )

--Avoid
INSERT INTO #temp
    SELECT *
    FROM Room

--Correct
INSERT INTO #temp (RoomId, RoomDescription) 
    SELECT RoomId
         , RoomDescription
      FROM Room

```
**Why**: It clarifies true intent. Stored Procedures and other functionality may unknowninly break due to number of columns returned, or column order differs compared to previous versions of same functionaly. It is also more easily identifiable which queries have broken due to table schema changes.

---
## Do
####  use uppercase for the reserved keywords like `SELECT`, `FROM`, `WHERE`, `INSERT`, `etc`.
```sql
--Avoid
Select RoomId
     , RoomDescription
from Room
where Id = 1

--Correct
SELECT RoomId
     , RoomDescription 
  FROM Room
 WHERE Id = 1

```
**Why**: Readability and easy to distinguish columns from keywords.

---
## Do
####  include newlines/vertical space before `AND` or `OR`.
```sql
--Avoid
SELECT RoomId
     , RoomDescription 
     , RoomSetId
  FROM Room
 WHERE Id = 1 AND RoomSetId = 1

--Correct
SELECT RoomId
     , RoomDescription 
     , RoomSetId
  FROM Room
 WHERE Id = 1 
   AND RoomSetId = 1

```
**Why**: Readability and easy to distinguish columns from keywords.

---
## Preferred
####  Right align reserved keywords vertically 
```sql
--This is prefered
SELECT RoomId
     , RoomDescription 
     , RoomSetId
  FROM Room
 WHERE Id = 1 
   AND RoomSetId = 1

--Over this
SELECT RoomId
     , RoomDescription 
     , RoomSetId
FROM Room
WHERE Id = 1 
AND RoomSetId = 1

```
**Why**: Readability and easy to distinguish columns from keywords.

---
# Service Layer Guidelines
[Back To Top](#markdown-header-c-sql-and-unit-testing-coding-standards-and-naming-conventions)

## Do
#### enforce boundary rules for the classes defined in the innRoad.Data namespace. These classes should not be returned to the Controllers. 

## Do
#### define ViewModels in the innRoad.Api namespace when returning data to the Controllers.

## Do
#### use the Linq .Select() extension method to project at most 3 properties
```c
var properties = await propertyRepository.GetPropertiesByClientIdAsync(clientId);
    :
    :
    :
var result = properties.Select(p => new PropertyIndex { Id = p.Id, 
                                                        Name = p.Name, 
                                                        Status = p.Active });
return result;
```
## Do
#### use AutoMapper for 
* mapping 4 or more properties or 
* combining 2 more classes into a new class
```c
var property = await propertyRepository.GetAsync(propertyId);
var address = await propertyRepository.GetAddressAsync(propertyId, Data.Enums.AddressType.Physical);

PropertyViewModel propertyDetails = new PropertyViewModel();

mapper.Map(property, propertyDetails);
mapper.Map(address, propertyDetails);

return propAddressDetails;
```
