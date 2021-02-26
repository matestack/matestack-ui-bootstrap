# Matestack Bootstrap Component: Modal

The Bootstrap `modal` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_modal(*args, &block)`

Returns a bootstrap modal containing header, body, footer or content specified by a block. The component can be trigger remotely. Also the modal is customizable with the following options.

**Optional options**

* `:header` - expects a string or hash. the hash can have `class`, `text` or `size` as keys
* `:body` - expects a string or hash. the hash can have `class`, `text` as keys
* `:footer` - footer has a dismiss button, expects a hash or string for button text. possible keys for hash `:class, :text`
* `:fade` - If set true, it will slide down and fade in from the top of the page. By default it's set as true.
* `:size` - Modals have three optional sizes, available via modifier classes `:sm`, `:lg`, `:xl`. Default size is set when size option is not available
* `:fullscreen` - option to pop up a modal that covers the user viewport, available via modifier classes
* `:static` - if set true, the modal will not close when clicking outside it.
* `:keyboard` - set true to close the modal when escape key is pressed
* `:scrollable` - set true to create a scrollable modal that allows scroll the modal body
* `:centered` - set true to vertically center the modal
* `:modal_dialog_class` - set custom class for modal dialog element
* `:slots` - Using slots to yield custom components in modal components for `header`, `footer` or `body`
* **Javascript Triggers**
  * Expects an event as string on which the modal will perfrom those javascript methods
  * `:toggle_on`, `:show_on`, `:hide_on`, `:handle_update_on`, `:dispose_on`
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding modal div.

## Examples

### Example 1: Basic Modal triggered via data attributes

```ruby
bs_btn text: "Launch Modal", data: { "bs-toggle": 'modal', "bs-target": '#staticBackdrop' }
bs_modal id: 'staticBackdrop', header: "Modal Title", body: "Modal Messages", footer: "Close", static: true, keyboard: false

```

### Example 2: Basic Modal triggered Matestack events

```ruby
onclick emit: "toggle_modal" do
  bs_btn text: "Launch Modal"
end
bs_modal toggle_on: "toggle_modal", id: 'staticBackdrop', header: "Modal Title", body: "Modal Messages", footer: "Close", static: true, keyboard: false
```

### Example 2: Modal with custom header

```ruby
bs_modal header: { text: "Modal Title", class: "text-center", size: 1 },     
      body: "Modal Messages", footer: "Close"
```

_body and footer hashes are working in similarly_
