# Example App Demonstrating render_to_string issue

## Setup

```sh
bundle install
rake db:migrate
```

## Demonstration of the issue

Go to http://localhost:3000

Enter something in chat input box and press send. Nothing happens. If you look
at the response from the server it's sending the opal javascript code back with
a content-type of `text/html; charset=utf-8`.

Note that changing:

```ruby
render type: :js, locals: { messages_html: render_to_string(@message) }
```

to:

```ruby
render type: :js, content_type: 'application/javascript', locals: { messages_html: render_to_string(@message) }
```

makes it work by changing the response headers content-type to `application/javascript; charset=utf-8`.
