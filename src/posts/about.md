
What is actions-in-recorder?
----

> actions-in-recorder is a *Store* for React apps based on Immutable data.

A minimal Store, with some basic support of a simplified time travelling debugger. In ClojureScript, a small Atom is enough to represent a Store. So I want it to be as simple in CoffeeScript.

### Why another store?

I doubt about the complexity of Redux. With immutable data it's easy to deal with data in a tree, so we can just represent the Store with a single immutable object. No need for `combineReducers` and `connect`.

### Why not state + listener?

It looks complicated for some reasons:

* HMR support, i.e. hot module replacement for Store.
* Time travelling debugger support.

### Is it stable?

It was developed for a chat app in the summer of 2015 and took months to reach stable. It's not an active project in 2016 though.

### Why another router?

When you rethink the router with the paradigms in React, it's no more than a Component that dispatches action to the global store. So `router-as-view` was designed from groud up with this mind to make addressbar stateless like a component.

### Why Immutable by default?

React adopts the idea of immutable data from ClojureScript, which is a smart solution to our problems in React.js . But using immutable data and mutable objects together leads to complexity. So I want to limit the usage of actions-in-recorder in immutable data only.

### Why CoffeeScript?

Everything is an expression. Then it's trivial to use `if` and `switch` in the DOM DSL.
