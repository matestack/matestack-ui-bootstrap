# Dropdown

The Bootstrap `dropdown` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_dropdown(*args, &block)`

Returns a bootstrap dropdown. Also the dropdown is customizable with the following options.

**Optional options**

* `:variant` - Specify a variant for the dropdown. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
* `:text` - Expects a string with the text that should go inside the dropdown button
* `btn_class` - adding custom class for dropdown button element
* `menu` - Expects an **array** of hash items with possible keys: `type`, `path`, `text` or a **hash** with `class` and `items` where the key `items` expects an array with hash items like above
* `direction` - Trigger dropdown menus above, below, right or left of the elements by adding direction attributes with `:up`, `:down`, `:right` or `:left`
* `align` - By default, a dropdown menu is automatically positioned 100% from the top and along the left side of its parent. By adding `align` attribute, you can change alignment of the menu
* `offset` - Offset of the dropdown relative to its target. By default is 0
* `reference` - Reference element of the dropdown menu. Accepts the values of `toggle`, `parent`, or an HTMLElement reference. By default is `toggle`
* `slots` - Adding customize Split Button to the dropdown menu button with `split_btn` key in `slots` option
* Additionally, you can add custom `class`, `id` or `data` attributes to the dropdown component
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding dropdown div.

## Examples

### Example 1: Single Button

```ruby
bs_dropdown "Dropdown button", id: "dropdownMenuButton", variant: :secondary, menu: [
  { type: :link, path: "#", text: "Action" },
  { type: :link, path: "#", text: "Another action" }
]
```

returns

```markup
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
    Dropdown button
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
  </ul>
</div>
```

### Example 2: Split Button

```ruby
bs_dropdown slots: { split_btn: method(:my_slot) },
  menu: [
    { type: :link, path: "#", text: "Action" },
    { type: :link, path: "#", text: "Another action" },
    { type: :divider },
    { type: :link, path: "#", text: "Separated link" }
  ]

def my_slot
  btn text: "Split Button"
end
```

returns

```markup
<div class="btn-group">
  <button type="button" class="btn btn-primary">Action</button>
  <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false">
    <span class="visually-hidden">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="#">Separated link</a></li>
  </ul>
</div>
```
