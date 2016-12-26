
Time traveling debugger
----

It's not very powerful but only a simple component in the page itself. It takes the `core` object from Recorder and renders the UI we need to operate on the Store.

```coffee
Devtools = require 'actions-in-recorder/lib/devtools'
```

Use in the CoffeeScript way, or you may try JSX for your taste:

```coffee
React.createElement Devtools,
  core: core # internal data from recorder
  width: window.innerWidth
  height: window.innerHeight # flexbox not powerful enough, use JavaScript
  path: @state.path # path of JSON tree reader, use `Immutable.List()` as default
  onPathChange: (newPath) -> @setState path: newPath
```

Notice the `path` is a component state of a parent component. So it will remain when it's reopened.

With the debugger, there are some basic features:

* A list of actions to navigate back and forward.
* Browse the data tree, which is very deep.
* Look at each action.
* Read diff results of each action.

![](https://pbs.twimg.com/media/CjsEkUFUYAAad8H.jpg:large)

The debugger is merely a component. To display or hide it, you still need some more code to deal with it. For example you can bind keyboard shortcut to toggle the debugger UI.
