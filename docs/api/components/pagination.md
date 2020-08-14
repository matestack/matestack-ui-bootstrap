# Matestack Bootstrap Component: Pagination

The Bootstrap `pagination` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### items - optional
Expects a Hash with text (String) as key and link path as value `{text: path}`

### active_item - optional
Expects an Integer which indicate which element is active

### size - optional
There are 3 different sizes. small, medium and large. By default the size is set as medium. Pass `1` as argument for small size and `2` for large size

### label - optional
Expects a String for attribute `aria-label`

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: 

```ruby
pagination items: { "Previous": "#", "1": "#", "2": "#", "3": "#", "Next": "#" }, label: "Page navigation example"
```

returns

```html
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
```

### Example 2: Using Size option

```ruby
pagination items: { "1": "#", "2": "#", "3": "#" }, active_item: 1, size: 2,
label: "..."
```

returns

```html
<nav aria-label="...">
  <ul class="pagination pagination-lg">
    <li class="page-item active"><a class="page-link" href="#">1</li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
  </ul>
</nav>
```
