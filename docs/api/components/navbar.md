# Matestack Bootstrap Component: Button

The Bootstrap `navbar` component, implemented in Ruby.

## Parameters

This component can handle various optional configuration params and can either yield content or display what ever gets passes to the `slots` configuration params

### list - optional
Expects a Hash which has a key and an hash object. This hash object must contain 3 keys: `type`, `path`, `text`.
`type`: expect either :transition or :link
`path` & `text`: expect a string

### list_classes - optional
You can add here additional class for navbar-nav list
By default the list is set to be on the right of the navbar and align at the center when it collapsed

### brand - optional
Expects a hash with a path as key and a content as value.
Content can be a string, image, etc.

### toggle_pos - optional
Expects `:left` or `:right`. This parameter determines whether the expand navigation toggle button should be on the left or right

### toggle_class - optional
For additional custom classes for more customization of navigation toggle button

### slots - optional
Expects a Hash with the key `custom_items`
This option allows for more customization. 
**Point of attention:** All the options/parameters above will be invaled by using this slots options

### fixed_top, fixed_bottom, sticky_top - optional
Expects `true`. By setting this parameter to `true` the related functionality will be activated. If not set, it will simple keep deactivated and you don't have to do anything in addition 

### hide_at
Expects a breakpoints `:xs, :sm, :md, :lg, :xl, :xxl`. By default it's set as :lg

### theme & color - optional
Expects standard bootstrap theme colors (:primary, :secondary, :success, :info, :warning, :danger, :light, :dark)
Although for theme parameter better use :light or :dark
**Point of attention:** If color parameter is not set, the backgroud color will be the same as theme 

### container_size - optional
The container inside the navbar is set as :fluid by default and can be set with any bootstrap breakpoints option 

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Render options[:text] param

```ruby
navbar list: {
      home: {type: :transition, path: "#", text: "Home"},
      link: {type: :transition, path: "#", text: "Link"},
    }, color: :light, theme: :light, list_class: "mr-auto mb-2 mb-lg-0", brand: {"#": "Navbar"} 
```

returns

```html
<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
    </div>
  </div>
</nav>
```

### Example 2: Yield a given block

```ruby
navbar list: {
  home: {type: :transition, path: "#", text: "Home"},
  link: {type: :transition, path: "#", text: "Link"},
}, color: :light, theme: :light, list_class: "mr-auto mb-2 mb-lg-0", brand: {"#": "Navbar"} do
  # yield a link component 
  btn style: :outline_success, class: "justify-content-end", text: "Main button"
end
```

returns

```html
<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
      <button class="btn btn-outline-success justify-content-end" type="button">Main button</button>
    </div>
  </div>
</nav>
```

### Example 3: Using the options[:disabled] configuration

```ruby

```

returns

```html

```