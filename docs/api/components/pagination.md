# Pagination

The Bootstrap `pagination` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_pagination(*args, &block)`

Returns a bootstrap pagination containing list of items or content specified by a block. Also the pagination is customizable with the following options.

**Optional options**

* `:items` - Expects an array of hashes. Possible keys are: type, path, text and active
  * **type**: can be `:transition` or `:link`. By default it's set as `:transition`
  * **active**: adding active class to page-item if set `true`
* `:size` - There are 3 different sizes. small, medium and large. By default the size is set as medium. Pass `:sm` as argument for small size and `:lg` for large size
* `:aria_label` - Expects a String for attribute `aria-label`
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding pagination div.

## Examples

### Example 1: Basic page navigation

```ruby
bs_pagination aria_label: "Page navigation example", items: [
            { type: :link, path: "#", text: "Previous" },
            { type: :link, path: "#", text: "1", active: true },
            { type: :link, path: "#", text: "2" },
            { type: :link, path: "#", text: "3" },
            { type: :link, path: "#", text: "Next" },
          ]
```

returns

```markup
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link active" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
```

### Example 2: Using Size option

```ruby
bs_pagination aria_label: "...", size: :lg, items: [
            { path: "#", text: "1", active: true },
            { path: "#", text: "2" },
            { path: "#", text: "3" },
          ]
```

returns

```markup
<nav aria-label="...">
  <ul class="pagination pagination-lg">
    <li class="page-item active"><a class="page-link" href="#">1</li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
  </ul>
</nav>
```

