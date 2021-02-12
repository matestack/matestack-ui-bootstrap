# Matestack Bootstrap Component: Navbar

The Bootstrap `navbar` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_navbar(*args, &block)`

Returns a bootstrap navbar. This component can handle various optional configuration params and can either display additional content specified by a block or display what ever gets passes to the `slots` configuration params

**Optional options**

* `:items` - Expects an array of Hashes. Each hash object can contain 3 keys: `type`, `path`, `text`.
  * `type`: can be either `:transition` or `:link`.
    * By default is `:transition`.
    * With transition, _active_ class will be handle automatically.
  * `path` & `text`: expect a string
* `:items_class` - You can add here additional class for navbar-nav list
  * By default the list is set to be on the left of the navbar and align at the center when it collapsed = `mr-auto mb-2 mb-lg-0`
* `:brand` - expect hash or string. Possible keys for hash: `text`, `path`, `img`. If the argument for brand is a string, navbar will display the given string as Brand text and path of the brand will be root path
* `:toggle` - expect hash or a symbol \(`:left` or `:right`\). This parameter determines whether the expand navigation toggle button should be on the left or right
  * possible keys for hash: `position`, `class`. With `class` you can pass on additional class for toggle button
* `:theme` & `:color` - Specify a theme for navbar. Theme represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. **Point of attention:** If color parameter is not set, the color will be the same as theme
* `:fixed_top`, `:fixed_bottom`, `:sticky_top` - Expects `true`. By setting this parameter to `true` the related functionality will be activated. If not set, it will simple keep deactivated and you don't have to do anything in addition
* `:hide_at` - set at which screen size the navbar shoulb be collapsed
  * Expects a breakpoints `:xs, :sm, :md, :lg, :xl, :xxl`.
  * By default it's set as `:lg`
* `:container_size` - The container inside the navbar is set as `:fluid` by default and can be set with any bootstrap breakpoints
* `slots` - Expects a Hash with the key `custom_items` This option allows for more customization. **Point of attention:** All the options/parameters for `toggle`, `brand` and `items` will be invaled by using this slots options
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding navbar div.

## Examples

### Example 1: Basic navbar with collapse functionality

```ruby
bs_navbar theme: :light, brand: "Navbar", items: [
        { path: "#", text: "Home" },
        { path: "#", text: "Link" }
      ]
```

returns

```markup
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
```

### Example 2: Yield a given block

```ruby
# adding custom class to nav class attribute: "text-center"
bs_navbar theme: :light, brand: "Navbar", class: "text-center", items: [
        { path: "#", text: "Home"},
        { path: "#", text: "Contact"} ] do
          btn text: "Login", variant: :outline_success, horizontal: :end
        end
```

returns

```markup
<nav class="navbar navbar-expand-lg navbar-light bg-light text-center">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
      <button class="btn btn-outline-success justify-content-end" type="button">Login</button>
    </div>
  </div>
</nav>
```

### Example 3: Using slots configuration

This configuration allows customization inside the navbar container

```ruby
bs_navbar slots: { custom_items: my_navbar }, color: :primary, theme: :dark

def my_navbar
  slot {
    span class: "navbar-text", text: "Navbar text with an inline element"
  }
end
```

returns

```markup
<nav class="navbar navbar-dard bg-primary">
  <div class="container-fluid">
    <span class="navbar-text">
      Navbar text with an inline element
    </span>
  </div>
</nav>
```

### Example 4: Render options fixed-top, fixed-bottom, sticky-top

Using the same navbar as example 3 but adding `sticky-top` option. `fixed-botton` and `sticky-top` can be added in similar way.

```ruby
bs_navbar slots: { custom_items: my_navbar }, color: :primary, theme: :dark, stick_top: true

def my_navbar
  slot {
    span class: "navbar-text", text: "Navbar text with an inline element"
  }
end
```

returns

```markup
<nav class="navbar navbar-dark bg-primary sticky-top">
  <div class="container-fluid">
    <span class="navbar-text">
      Navbar text with an inline element
    </span>
  </div>
</nav>
```

