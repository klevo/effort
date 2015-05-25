# Effort - Personal To-do and Project manager

I've modeled this app for my own personal use, note keeping and personal project management loosely after [Basecamp](https://basecamp.com/). The single most important point for me is to have To-do lists that work in a particular way - that's why I've build this for myself.

I am open-sourcing it to see if somebody finds it useful and can maybe build on it. Let's see what happens.

This is a standard Rails 4 app, build the "Rails way". Test coverage is minimal, just enough for the purposes of this app at this stage.

![To-do lists](https://klevo.sk/wp-content/uploads/2015/05/effiort-todo-lists.png)

## Caveats

There is no authentication. This is one user app only and everything is accessible to anyone that can access your development environment from outside of your computer (you should be using a firewall anyway).

## It's fast

When you're not hacking on the code, but instead want to use the app to get some real work done, run it in `production`. This enables caching. This is where the app becomes as fast and responsive as any native desktop app.

### TODO for this README: 

- Mention MySQL 5.6 fulltext search
- Instructions on how to run in "production" on OS X
- Basic setup instructions

