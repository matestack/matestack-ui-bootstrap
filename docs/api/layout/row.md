# Row

The Bootstrap `row` component, implemented in Ruby.

## `bs_row(*args, &block)`

Returns a bootstrap row containing content specified by a block. Also the row is customizable with the following options.

**Optional options**

* `:vertical` - For vertical alignment. Expects parameter: `start`, `center`, `end`
* `:horizontal` - For horizontal alignment. Expects parameter: `start`, `center`, `end`, `around`, `between`, `evenly`

**HTML attributes** This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic

```ruby
bs_row horizontal: :start, vertical: :center do
  # content here
end
```

returns

```markup
<div class="row justify-content-start align-items-center">
  <!-- Content here -->
</div>
```

