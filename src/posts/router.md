
Router as View
---

Following the design choice made by actions-in-recorder. The router state should be saved in the global Store only.

There are some basic rules of how the router is designed:

* The address bar is like a UI component, so I make a component called `Addressbar`.
* A router changed is essentially a Store update, responded with UI changes.
* The appearance of the address bar is driven by the router state in the Store.

The address bar may look more like a `<input />` but seeing from Flux, it's more or less a component that renders an address bar, except for that some of it's events are hard to cancel:

```html
<div class="address-bar">
  <i>{this.props.state}</i>
  <input value="{this.props.url}" onChange={this.props.onChange} />
</div>
```

So the router is basicly implemented like an `input` element.

I'm not going to the details. You can find more at: https://github.com/mvc-works/router-as-view
