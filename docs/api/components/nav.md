# Matestack Bootstrap Component: Nav

The Bootstrap `nav` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `navigation(*args, &block)`
----

Returns a bootstrap nav. Also the nav is customizable with the following options. 

**Optional options**

* `items` - expects an array with hashes with `type`, `path`, `text`, `active` or `disabled` as possible keys
  * Set `active` to true, if the current item is the active element

* `tabs` - If set true, a tabbed interface will be generated with the navigation component
* `pills` - If set true, a pills interface will be generated with the navigation component
* `fill` - If set true, all available space will be filled proportionately with your *.nav-items*
* `justified` - If set true, all horizontal space will be occupied by nav links, but unlike the *.nav-fill* above, every nav item will be the same width.
* `vertical` - If set true, navigation items will be stacked up
* `horizontal` - Change the horizontal alignment of your nav with flexbox utilities. By default, navs are left-aligned, but you can easily change them to `:center` or `:right` aligned.

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding nav div.

## Examples

### Example 1: Basic Navigation with center horizontal alignment

```ruby
navigation items: [
  { type: :link, path: "#", text: "Active", active: true },
  { type: :link, path: "#", text: "Home" },
  { type: :link, path: "#", text: "Link" }
], horizontal: :center
```

returns

```html
<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
</ul>
```

### Example 2: Vertical Navigation and with a disabled item

```ruby
navigation items: [
  { type: :link, path: "#", text: "Active", active: true },
  { type: :link, path: "#", text: "Home" },
  { type: :link, path: "#", text: "Link" },
  { type: :link, path: "#", text: "Disabled", disabled: true }
], vertical: true
```

returns

```html
<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>
```