# delivery-tracker-1

Target: https://delivery-tracker-1.matchthetarget.com


Looking at the target website, I see a few things on the home page.

At the top, there's a navbar that persists while visiting /users/edit. That means it's part of the template for the entire app, not just the home page

There's 4 sections, separated by horizontal rules. the first is the Delivery Tracker h1, with some text below.

Then, there's an entry form to add a package. Package would probably be a good name for the table.

So, here are the properties of the package class:

  There's description. It's stored as a string.
  There's supposed_to_arrive_on. It's stored as a date
  There's details. It's stored as text. Plain text only.

It all gets sent to the "/insert_delivery" route as a POST.

It includes a text description, a Supposed to arrive on date, a details text field, and there's a log delivery button at the bottom 

------------------------

Next is the list of the "Waiting on" packages. It's stored as an unordered list with bullet points. Each bullet point has teh description, a formatted supposed to arrive on date, and the description if applicable. there's also a button that says "Mark as received". That indicates there's a boolean value saying whether the item has been received or not.

So far, the model is this:

rails generate draft:resource delivery description:string details:text supposed_to_arrive_on:date received:boolean

There's a cancel my account button at the bottom that seems non-standard
