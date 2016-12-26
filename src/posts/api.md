
API
----

### `recorder.setup(options)`

Method to initialize the recorder:

```coffee
recorder.setup
  initial: initialStore
  updater: updater
  inProduction: false
```

* `initialStore`

Default store

* `updater`

A pure function to update the store. `(store0, actionType, actionData) -> store1`.

* `inProduction`

When it's set true, actions saved in the recorder with be cleared circularly to reduce memory usage.

### `recorder.hotSetup(options)`

Same as `recorder.setup` but only used during HMR. It's used for changing the `updater` and doing recalculation.

### `recorder.getStore()`

A function to grab Store from recorder.

### `recorder.getCore()`

`Core` is there the recorder keeps the data. It's an immutable object. You can also get store by `recorder.getCore().get('store')`.

### `recorder.request (core) ->`

Grab `core` and call the function once.

### `recorder.subscribe (core) ->`

Add a listener and call the function on changes.

### `recorder.unsubscribe(listener)`

Remove the listener.

### `recorder.dispatch(actionType, actionData)`

Dispatching an action means it will call `updater` function and update the Store inside recorder. Also the registered listener will be called after it's done.
