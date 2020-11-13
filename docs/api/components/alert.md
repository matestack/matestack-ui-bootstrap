# Matestack Bootstrap Component: Alert

The Bootstrap `alert` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `alert(*args, &block)`
----

Returns a bootstrap alert containing text and/or content specified by a block. Also the alert is customizable with the following options.

**Optional options**

* `:variant` - Specify a variant for the alert. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`

* `:title` - Expects a string specifying the content of the heading.
* `:title_size`- Set a different heading size. By default it is set to 4 corresponding to a "h4".

* `:text` - Passing content as String for alert. If a text and block is given, the block will be rendered below the text.

* `:dismissible` - Expects a boolean value. If set to `true`, a close button to dismiss the alert will be displayed.

* `:animated` - Expects a boolean value. If set to `true` the alert will be animated if dismissed. By default, it is set as `false`.

* `:close_on` - Expects an event as string on which the alert will be closed calling bootstraps `close` method.

* `:dispose_on` - Expects an event as string on which the alert will be disposed calling bootstraps `dispose` method.

* `&block` - Use a block to create custom content/markup inside an alert. If used together with `:text` the text will be displayed before the block.

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding alert div.

## Examples

### Basic alert with title and text

```ruby
alert color: :success, heading: "Well done!", text: 'Some alert message'
```

returns

```html
<div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Well done!</h4>
  <p>Some alert message</p>
</div>
```

### Animated, dismissible alert with content specified in a block
```ruby
alert color: :warning, animate: true, dismissible: true do
  strong text: "Holy guacamole!"
  plain "You should check in on some of those fields below."
end
```

returns

```html
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
```
### Alert closing on event triggered by button click

```ruby
alert close_on: 'close-alert', text: "Closing Alert test"  
onclick emit: "close-alert" do
  btn text: "close alert"
end
```

### Showing an alert after an event is triggered
*Not intended by Bootstrap but you can use matestack toggle mechanism to trigger an alert*

```ruby
toggle show_on: "my-event" do        
  alert heading: "Alert Heading", text: "This is an alert", animate: true, dismissible: true
end
onclick emit: "my-event" do
  btn text: "Show Alert"
end
```
