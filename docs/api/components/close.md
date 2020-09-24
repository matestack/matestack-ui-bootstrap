# Matestack Bootstrap Component: Close

The Bootstrap `close` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `close(*args, &block)`
----

Returns a bootstrap close button for dismissing content like modals and alerts. Also the close is customizable with the following options. 

**Optional options**

* `dismiss` - specify which component the close button is used for

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding close div.

## Examples

### Example 1: Display basic close button

```ruby
close
```

returns

```html
<button type="button" class="close" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
```

### Example 2: Using close button for dismissing a modal content

```ruby
close dismiss: "modal"
```

returns

```html
<button type="button" class="close" aria-label="Close" data-dismiss="modal">
  <span aria-hidden="true">&times;</span>
</button>
```