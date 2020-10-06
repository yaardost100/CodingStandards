# Javascript, React and Unit Testing Coding Standards and Naming Conventions

Below are our **Javascript coding standards**, naming conventions and best practices.

*	[Naming Conventions](#markdown-header-naming-conventions)
*	[Coding Style](#markdown-header-coding-style)
*   [React Guidelines](#markdown-header-react-guidelines)
*	[Unit Testing Guidelines](#markdown-header-unit-testing-guidelines)


# Naming Conventions
---
[Back To Top](#markdown-header-javascript-react-and-unit-testing-coding-standards-and-naming-conventions)

## Do
#### use `PascalCasing` for class names.

```js
class ClientActivity
{

}
```
**Why**: consistent with the javascript standard.

---

## Do
#### use `camelCasing` for function names, function arguments and local variables.

```js
add = (firstNumber, secondNumber) => firstNumber + secondNumber;

main = () => {
    const sum = add(100, 200);
    console.log(`The sum is ${sum}`);
}
```
**Why**: consistent with the javascript standard.

---
## Do Not
#### use `Hungarian` notation or any other type identification in identifiers

```js
// Correct
let counter;
let name;

// Avoid
let iCounter;
let strName;
```
**Why**: In general you want to avoid type indicators in any identifier.

---
## Do
#### use PascalCasing for acronyms or initialisms with 3 or more characters

```js
class HtmlHelper {}
class FtpTransfer {}
class UIControl {}
```
**Why**: Caps would grab visually too much attention.


---
## Avoid
#### using `Abbreviations`. **Exception**: abbreviations commonly used as names, such as `Id, Xml, Ftp, Uri`

```js
// Correct
let userGroup;
let employeeAssignment;

// Avoid
let usrGrp;
let empAssignment;

// Exceptions
let customerId;
let xmlDocument;
let ftpHelper;
let uriPart;
```
**Why**: prevents inconsistent abbreviations.

---
## Do
#### use function names explaining the action of the function. The function name should tell what it Does.

```js
// Avoid
getData = (accountId) =>
{
    //...
}

// Correct
getAccountDetailsById = (acccountId) =>
{
    //...
}
```
**Why**: There is no need of Documentation explaining what the function Does explicitly.

---
## Do Not
#### use `Underscores` in identifiers, except for when referencing the lodash or underscore libraries

```js
// Correct
let clientAppointment;
let timeLeft;

// Avoid
let client_Appointment;
let time_Left;

// Exceptions
import _ from 'lodash';
import _ from 'underscore';
```
**Why**: makes code more natural to read (without 'slur'). Also avoids underline stress (inability to see underline).


---
## Do
#### use noun or noun phrases to name a class.

```js
class Employee
{
}
class BusinessLocation
{
}
class DocumentCollection
{
}
```
**Why**: easy to remember and easy to understand

---

# Coding Style
---
[Back To Top](#markdown-header-javascript-react-and-unit-testing-coding-standards-and-naming-conventions)

## Do
#### `Always` use `ES6 syntax` for functions.

```js
// Avoid
function doSomething()
{

}

// Correct
doSomething = () => {

}
```

## Preferred
#### using `ES6 spread operator` for copying objects.

```js
// Avoid
const obj { a = 'a', b = 'b', c = 'c'}
const newObj = Object.Assign({}, obj, { b = 'd'});

// Correct
const obj {
    a = 'a',
    b = 'b',
    c = 'c'
}

const newObj = { ...obj, b = 'd'};
```

---
## Do
#### use `let` or `const` instead of `var`

```js
// Correct
let firstName;
const lastIndex;

// Avoid
var firstName;
var lastIndex;
```
**Why**: Adopt new ECMAScript syntax

---
## Do
#### use `object literal` and `object-shorthand` declaration

```js
const age = 28;
let person = {
    firstName: 'John',
    lastName: 'Doe',
    age,
    greet() {
        console.log('hi');
    }
}

```
**Why**: easier to see what properties and functions the object has

---
## Do
#### use `array literal` when declaring array.

```js
// Correct
let items = [];
```
**Why**: easy to understand and read.

---
## Do
#### use single quote `'` for string value

```js
// Correct
let name = 'John';

// Avoid
let name = "John";
```
**Why**: generally accepted practice and es-linting rule enforced

---
## Do
#### use strict comparison `===` and `!==` instead of `==` or `!=` when comparing objects

```js
// Correct
if(a === 1)

// Avoid
if(a == 1)
```
**Why**: want to compare the actual type

---
## Preferred
#### use string interpolation over `string concatenation`.

```js
//This is Preferred
string customerName = `${customer.FirstName} ${customer.LastName}`;

//Over this
string customerName = customer.FirstName + " " + customer.LastName;
```
**Why**:  Readability

---
## Preferred
#### placing object properties on separate lines.

```js
//This is Preferred
const obj = {
    propertyA: 'a',
    propertyB: 'b',
    propertyC
}

//Over this
const obj = { propertyA: 'a', propertyB: 'b', propertyC }
```
**Why**:  Readability



---
## Do
#### Use `PropertyDate.getDate()` for dates relative to the property.

```js
// Correct
import PropertyDate from '../../utils/propertyDate';
if (PropertyDate.getDate() >= '2018-07-20') {
    return noRoomsAvailableVacancySign();
}

// Avoid
if (moment().startOf('day') >= '2018-07-20') {
    return noRoomsAvailableVacancySign();
}
```
**Why**:  moment() will use the date in the user's location

# React Guidelines
---
[Back To Top](#markdown-header-javascript-react-and-unit-testing-coding-standards-and-naming-conventions)

## Do
#### define the propTypes and defaultProps at the bottom of the component declaration

```js
// Correct
class MyButton extends Component {
     constructor(props) {
         super(props);
     }
};

MyButton.propTypes = {
    text: PropTypes.string.isRequired
}

MyButton.defaultProps = {
    text: 'Submit'
}

export default MyButton;
```
**Why**: easy to read.

---
## Do
#### use `ES6 arrow function` for handler and non lifecyle hooks, to avoid writing the `bind(this)` in the constructor

```js
// avoid
class MyButton extends Component {
     constructor(props) {
         super(props);

        this.onClickHander.bind(this);
     }

     function onClickHandler(e){

     }
};

// correct
class MyButton extends Component {
     constructor(props) {
         super(props);
     }

     onClickHandler = (e) =>{

     }
};

```
**Why**: reduce boilerplate code

---
## Do Not
#### use `big arrow function style` for component lifecyle hooks

```js
//Correct
class MyButton extends Component {
     constructor(props) {
         super(props);
     }

    componentDidMount() {

    }

    render() {

    }
};

```
**Why**:  react community convention that make it easier to tell the lifecycle hooks apart from other functions

---
## Do
#### organize component and its related css and unit test files in the same folder

```
    --component
        --MyButton.js
        --MyButton.css
        --MyButton.test.js
```

**Why**:  Easy to find related files for a component and easy to relocate the component if needed.

---
## Do
#### use the following prefix for action types

```js

export const REQ_XYZ = 'REQ_XYZ';  //REQ for Request
export const RCV_XYZ = 'RCV_XYZ';  //RCV for Receive
export const CTH_XYZ = 'CTH_XYZ';  //CTH for Catch

```

**Why**:  This is the prefix that we use throughout the application.

---
## Do
#### create your state with the following properties as much as possible and use the errorData to store the error received from the catch().

```js
{
    isFetching: false,
    data: [] or null,
    error: false,
    errorData: null
}

```

**Why**:  we standardize on the state properties.

---
## Do Not
#### store the error into the state.data property

```js
// wrong
import createState from '../utils/state';

export default (state, action ) => {
    swith(action.type) {
        case 'CATCH_ERROR':
            return createState(state, { data: action.payload });
    }
}

// correct
import createState from '../utils/state';

export default (state, action ) => {
    swith(action.type) {
        case 'CATCH_ERROR':
            return createState(state, { errorData: action.payload, data: null });
    }
}

```

**Why**:  error should be stored in errorData property and valid response should be stored in data property

---
## Do
#### use util/state.js in the reducer to create new state

```js

import createState from '../utils/state';

export default (state, action ) => {
    swith(action.type) {
        case 'SomeType':
            return createState(state, { errorData: null });
    }
}

```

**Why**:  This method will reduce the boilerplate code and provide logic
to handle the error property correctly in your state


---

# Unit Testing Guidelines
---
[Back To Top](#markdown-header-javascript-react-and-unit-testing-coding-standards-and-naming-conventions)

## Do
#### write clear description about your test cases with `TestCondition -> ExpectedResult`
```js
describe('Test Method Name', () => {
    it('When the api call failed, expect the function to return error object', () => {

    })
})
```

## Do
#### test the individual public properties of the object if the method under test returns an object
```js
    describe('Test Method Name', () => {
    it('create user, all users properties are set correctly', () => {
        const user = someFunction.createUser();

        expect(user.name).toEqual('something');
        expect(user.email).toEqual('something');
    })
})
```

## Do
#### setup the Mocks inside the test methods when possible
```js

describe('Test Method Name', () => {
    let callback = jest.fn();

    it('When condition is not valid, return null user', () => {
        callback.mockImplementation(() => null);

        someFunction('invalid', callback);
    });

    it('When condition is valid, return valid user', () => {
        callback.mockImplementation(() => {name: 'John'});

        someFunction('valid', callback);
    })
}

```

---

# Read a store's data through selectors.
---

## Do
### Use the following naming for selectors

#### To get whole branch of store: `<storeKey>InfoSelector`
```js
const tokenInfoSelector = state => state.token;
```

#### To get custom data: `<name>Selector`
```js
const tokenSelector = state => state.token.data;
const tokensCountSelector = state => state.token.data.length;
```

---

# General JS and React Standards.
---

## Do
#### We actively use community standards to improve code quality in React based applications. If your current project doesn't have a LINTER implementation please refer the following links to learn how to code beyond the rules of this document.

[JavaScript](https://github.com/airbnb/javascript/blob/master/README.md)

[React](https://github.com/airbnb/javascript/blob/master/react/README.md)
