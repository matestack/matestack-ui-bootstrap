# Matestack Bootstrap Component: ListGroup

The Bootstrap `List group` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_list_group(*args, &block)`
----

Returns a bootstrap listgroup containing series of content. Also the listgroup is customizable with the following options.

**Optional options**

* `:items` - expects an array of hashes with `type`, `text`, `path`, `active`, `variant` as possible keys
  * `:variant` - Specify a variant for the button. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
  * `active` - If set true list item will have an active class

* `horizontal` - to change the layout of list group items from vertical to horizontal across all breakpoints.
* `horizontal_size` - choose `sm`, `md`, `lg`, `xl`, `xxl` to make a list group horizontal starting at that breakpoint’s min-width
* `checkbox` - If set true, Bootstrap’s checkboxes and radios within list group items will be placed
* `flush` - If set true, borders and rounded corners will be removed
* `tablist` - Set true if you want to use list_group as a tabbable panes

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding listgroup div.

## Examples

### Example 1: Basic example

```ruby
bs_list_group items: [
          { type: :link, text: "Cras justo odio"},
          { type: :link, text: "Dapibus ac facilisis in" },
          { type: :link, text: "Vestibulum at eros" }
        ]
```

returns

```html
  <ul class="list-group">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Vestibulum at eros</li>
</ul>
```
