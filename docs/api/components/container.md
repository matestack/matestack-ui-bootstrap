# Matestack Bootstrap Component: Container

The Bootstrap `container` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content


### size - optional
Expects a breakpoints `:xs, :sm, :md, :lg, :xl, :xxl`

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic
```ruby
container size: :fluid do 
  # content here
end
```

returns

```html
<div class="container-fluid">
  <!-- Content here -->
</div>
```
