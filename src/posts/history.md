
History
----

These libraries was created for [Jianliao](https://github.com/jianliaoim/), a React.js based chatroom app.

We were using Backbone and slowly migrated to React.js and Flux during Sep 2014 and July 2015. We found that React is slow and buggy in JavaScript objects so I decided to use immutable data. But I watched Redux for months and finally chose to create my own Redux alternative, since Redux is too much for our app.

In Aug 2015 I started the project `actions-recorder`. It was mostly a state plus an event listener at first, surely with basic support for Webpack HMR. Then features like time travelling debugger was added to expose the event logs just like Redux.

After using time travelling debugger for some days, I notice `react-router` is an anti-pattern with private mutable states. `react-redux-router` was not released at that time. So I created router-view to make sure *Single Source of Truth* is still true for our project.

In early 2015, the code of Jianliao is open sourced and `actions-recorder` is somehow locked. I forked a new repository called `actions-in-recorder` so that I can still update the code. Meanwhile I forked `router-view` with a new name called `router-as-view`.

Now it mostly lives in my personal projects.
