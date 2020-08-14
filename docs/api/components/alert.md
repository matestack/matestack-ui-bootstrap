# Matestack Bootstrap Component: Alert

The Bootstrap `alert` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### heading - optional
Expects a string with the text that should go inside the `<h>` tag.

### heading_size - optional
By default it is set as 4 -> `h4`. 

### text - optional
Expects a string with the text that should go inside the `<p>` tag.

### dismissible - optional
Expects a boolean value. If set as `true`, close button for dismiss the alert will appear

### color - optional
Expects bootrap predefined styles: `primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`, `link`
By default, it is set as `primary`

### animated - optional
Expects a boolean value. By default, it is set as `false`

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `class`.

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
