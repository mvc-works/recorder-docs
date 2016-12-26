
Guide
---

To install it:

```bash
npm i --save actions-in-recorder
```

The code to setup

```coffee
recorder = require 'actions-recorder'

recorder.setup
  initial: initialStore   # we will define this
  updater: updater        # we will define this
  inProduction: false     # set true for less memory usage

render = (core) ->
  # core is a immutable object containing more than store
  App = Page store: core.get('store')
  ReactDOM.render App, document.querySelector('.app')

# request to render once, subscribe to watch updates
recorder.request render
recorder.subscribe render
```

To dispatch an action:

```coffee
recorder.dispatch 'category/name', 'some arguments'
```

For initial Store, it's an immutable object:

```coffee
Immutable = require 'immutable'

# a counter for example
initialStore = Immutable.fromJS
  counter: 0
```

Updater is like reducer in Redux, try this:

```coffee
updater = (store, actionType, actionData) ->
  switch actionType
    when 'counter/inc' then store.update 'counter', (x) -> x + 1
    when 'counter/dec' then store.update 'counter', (x) -> x - 1
    else
      console.log "Strange action #{actionType}"
      store
```

By now action creators are coupled with View components.
