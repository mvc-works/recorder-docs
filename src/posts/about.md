
What is "Actions in Recorder"?
----

Using "Recorder" for short.

> Recorder is a *Store* for React apps based on Immutable data.

A minimal Store, with some basic support of a simplified time travelling debugger. In ClojureScrip, a small Atom is enough to represent a Store. So I want it to be as simple in CoffeeScript.

### Why another store?

I doubt in the complexity of Redux. Although I admire the achivements of Redux.

### Why not state + listener?

It looks complicated for some reasons:

* HMR support, i.e. hot module replacement for updaters.
* Time travelling debugger support

### Is it stable?

It was developed for a chat app in the summer of 2015 and took months to reach stable. So it is.

### Why another router?

I think redux router is wrong. Router is a component plus Store updates, not elements with internal updates.

### Why Immutable date by default?

I'm a great fan of ClojureScript.

### Why CoffeeScript?

I think JSX is wrong for us small apps.
