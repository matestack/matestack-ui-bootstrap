# Matestack Bootstrap Component: Alert

The Bootstrap `alert` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `alert(*args, &block)`
----

Returns a bootstrap alert containing text or content specified by a block. Also the alert is customizable with the following options. 

**Optional options**

* `:variant` - Specify a variant for the spinner. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`

* `title` - Expects a string with the text that should go inside the `<h>` tag.
* `title_size`- By default it is set as 4 -> `h4`. 

* `dismissible` - Expects a boolean value. If set as `true`, close button for dismiss the alert will appear

* `animated` - Expects a boolean value. By default, it is set as `false`

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding spinner div.

## Examples

### Example 1: 

```ruby
alert color: :success, heading: "Well done!", text: "Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content."
```

returns

```html
<div class="alert alert-success" role="alert">
  <h4 class="alert-heading">Well done!</h4>
  <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p>
</div>
```

### Example 2: Yield a custom text block 
```ruby
alert color: :warning, animated: true, dismissible: true do
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

### Example 3: Custom alert trigger 
*Not intended by Bootstrap but you can use matestack toggle mechanism to trigger an alert*

```ruby
toggle show_on: "myEvent" do        
  alert heading: "Alert Heading", text: "This is an alert", animated: true, dismissible: true
end
onclick emit: "myEvent" do
  btn text: "Show Alert"
end
```
