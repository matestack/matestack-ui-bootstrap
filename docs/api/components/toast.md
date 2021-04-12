# Toast

The Bootstrap `Toast` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_toast(*args, &block)`

Returns a bootstrap Toast containing text or content specified by a block. Also the Toast is customizable with the following options.

**Optional options**

* `header` - Expects a string or a hash with `icon`, `icon_class` `title` and `subtitle` as possible keys, that should go inside the header component
* `body` - Expects a string that should go inside toast's body component
* `important` - to adapt the role and aria-live level depending on the content. If it’s an important message like an error, use `important: true`, otherwise use `important: false` attributes
* `delay` - expect a number which will delay hiding the toast in ms
* `autohide` - If set true, toast component will automatically hide
* `animation` - If set true, css fade transition will be applied to the toast
* `slots` - Using slots option to extend customization of your `header` beyond the standard option
* `:show_on` - Expects an event as string on which the toast will be showed calling bootstraps `show` method.
* `:hide_on` - Expects an event as string on which the toast will be hidden calling bootstraps `hide` method.
* `:dispose_on` - Expects an event as string on which the toast will be disposed calling bootstraps `dispose` method.
* Additionally, you can add custom `class`, `attributes` or `data` attributes to the toast component
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding Toast div.

## Examples

### Example 1: Basic Toast

```ruby
bs_toast header: { title: "Bootstrap", subtitle: "11 mins ago" },
      body: "Hello, world! This is a toast message."
```

returns

```markup
<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <strong class="mr-auto">Bootstrap</strong>
    <small>11 mins ago</small>
    <button type="button" class="btn-close" data-dismiss="toast" aria-label="Close"></button>
  </div>
  <div class="toast-body">
    Hello, world! This is a toast message.
  </div>
</div>
```

### Example 2: Color schemes

```ruby
bs_toast class: "bg-primary text-white",
      header: { title: "Bootstrap", subtitle: "11 mins ago" },
      body: "Hello, world! This is a toast message."
```

returns

```markup
<div class="toast bg-primary text-white" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <strong class="mr-auto">Bootstrap</strong>
    <small>11 mins ago</small>
    <button type="button" class="btn-close" data-dismiss="toast" aria-label="Close"></button>
  </div>
  <div class="toast-body">
    Hello, world! This is a toast message.
  </div>
</div>
```

### Example 3: Trigger Javascript Behaviors with onclick methode

```ruby
bs_toast show_on: "showToast", hide_on: "hideToast",
  body: "Hello, world! This is a toast message."

onclick emit: "showToast" do
  bs_btn "Show Toasts"
end
onclick emit: "hideToast" do
  bs_btn "Hide Toasts"
end
```

