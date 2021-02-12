# Matestack Bootstrap Component: Breadcrumb

The Bootstrap `breadcrumb` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_breadcrumb(*args, &block)`
----

Returns a bootstrap breadcrumb containing content created from an array of `items` and/or content specified by a block. The breadcrumb is customizable with the following options.

**Optional options**

* `:items` - Expects an array of hashes. Each hash represents an item and is required to contain at least `:path` and `:text` keys. The items will be rendered as transitions with `:path` and `:text` from the hash. In case you want links instead of transitions add a `type: :link` to the item which should be rendered as link. If items are given and a block the items are rendered before the block.

* `:nav_class` - Expects a string. Use `:navclass` to add custom classes to the sourrounding "nav".

* `&block` - Use a block to create custom content/markup inside a breadcrumb. If used together with `:text` the text will be displayed before the block.

* Html attributes - all w3c confirm html attributes for ol's can be set via options and will be added to the items and block surrounding breadcrumb ol element which is in bootstrap surrounded by a nav.

## Examples

### Simple breadcrumb with transitions

```ruby
items = [
  { path: root_path, text: 'Home' },
  { path: products_path, text: 'Products' },
]
bs_breadcrumb items: items, class: 'my-breadcrumb'
```

Result:

```html
<nav aria-label="breadcrumb">
  <ol class="breadcrumb my-breadcrumb">
    <li class="breadcrumb-item">
      <a href="/">Home</a><!-- transition link -->
    </li>
    <li class="breadcrumb-item active" aria-current="page">
      <a href="/products">Products</a><!-- transition link -->
    </li>
  </ol>
</nav>
```
_Note: Attributes which are set to enable transition on "a" tags are not added for the case of simplicity._

### Breadcrumb with one transition and one link

```ruby
items = [
  { path: root_path, text: 'Home', type: :link },
  { path: products_path, text: 'Products' },
]
bs_breadcrumb items: items, class: 'my-breadcrumb'
```

Result:

```html
<nav aria-label="breadcrumb">
  <ol class="breadcrumb my-breadcrumb">
    <li class="breadcrumb-item">
      <a href="/">Home</a><!-- link -->
    </li>
    <li class="breadcrumb-item active" aria-current="page">
      <a href="/products">Products</a><!-- transition link -->
    </li>
  </ol>
</nav>
```
