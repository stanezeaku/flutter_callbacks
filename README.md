# flutter_callbacks

Note: Passing data from child widget to parent widget is different from callbacks or send data from child widget to parent widget through an event function. However to pass data from child widget to parent widget the same way we pass data from parent widget to child widget through dependency injection, we can use RenderBox's parentData field. Which is how we can have things such as Positioned widget inside Stack.

There are two possible patterns to achieve this:
1. Function Callback Pattern
2. Of Pattern

Before we dive into how to implement the two patterns lets emphasize on the possible use case. 
callbacks can be used when there is data in a child widget that needs to be sent to the partent for a state change when an event is triggered in the child widget. Example: Let's assume we have a UI that displays and updates names on the screen based on the list of contacts. When a user clicks a contact from the list the name of the contact updates on the display screen. 

### Preview

![Preview](/introd.gif)

callback use case

---