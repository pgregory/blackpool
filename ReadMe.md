BlackPool
=========

BlackPool is an attempt to implement a web application framework
similar to Smalltalk's Seaside for the Io programming language. It is
'heretic' becouse, like Seaside, it does not follow the widely
accepted RESTful approach to web development.

## Requirements

* Io implementation with Sockets or Volcano support

## Samples

There are two examples in the `samples/` directory. You can start the
application by running it's server file, which you will find in the
application's home directory.

## Getting Started

Blackpool does not set up an server for you, instead you will have to
set up your own. I'm assuming you know how to do that, and are also
familiar with the Io programming language, which Blackpool uses.  Now,
I will introduce some Blackpool terminology. A component is a reusable
object which stores it's state, displays its interface using the
`renderOn(html)` method, and responds to any events from its
interface. A model is an abstract object that a Blackpool application
uses to represent information. The state of models is not saved,
unlike the state of components, which is stored using cookies.

In Blackpool, the `renderOn` method takes an Canvas object argument,
which is used to display html elements on using its methods. A
component is a normal Object, and the only method that it must
implement is `renderOn`, which not only allows it to be rendered in
the page, but also as part of another component, which allows building
up components to create an application. Here is a simple component:

```io
Counter := Object clone do(
  init := method(
    count ::= 0
  )

  renderOn := method(html,
    html h3 with( html text("Counter: " .. count))
    html link("--", block(count = count - 1))
    html space
    html space
    html link("=", block(count = 0))
    html space
    html space
    html link("++", block(count = count + 1))
  )
)
```

In this example, the component has only a single peice of state, the
`count` method. The state of the component, in this case, `count`, is
saved between reloads. When the link is clicked, the page reloads with
a new key, so that Blackpool knows to save this new state, and
redisplay the components. A key (in the format
`http://example.org/?_k=<key value>`) denotes what state the
application is currently in. Forms also work with this setup, using
the button method on the canvas element.  The rest of the code for
this example is in `samples/counter/`, and you can find a more complex
example, with nexted components and complex html elements in
`samples/todo/`.
