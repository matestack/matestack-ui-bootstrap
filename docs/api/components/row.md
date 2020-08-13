# Matestack Bootstrap Component: Row

The Bootstrap `row` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### vertical - optional
For vertical alignment. Expects parameter: `start`, `center`, `end`

### horizontal - optional
For horizontal alignment. Expects parameter: `start`, `center`, `end`, `around`, `between`, `evenly`

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic

```ruby
row horizontal: :start, vertical: :center do
  # content here
end
```

returns

```html
<div class="row justify-content-start align-items-center">
  <!-- Content here -->
</div>
```
