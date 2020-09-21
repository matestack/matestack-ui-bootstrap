# Matestack Bootstrap Component: Breadcrumb

The Bootstrap `breadcrumb` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `breadcrumb(*args, &block)`
----

Returns a bootstrap breadcrumb containing a hash of `items` with type, path and text. Also the breadcrumb is customizable with the following options. 

**Optional options**

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding spinner div.

**Further explanation**
type withing items hash can be either `link` or `transition`. By default it's set as `transition`

## Examples

### Example 1: 

```ruby
breadcrumb items: {
      first: {
        type: :link,
        path: "#",
        text: "Home",
      },
      second: {
        type: :link,
        text: "Data",
      }
    }
```

returns

```html
<div class="">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Data</li>
    </ol>
  </nav>
</div>
```