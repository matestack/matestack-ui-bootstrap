# Container

The Bootstrap `container` component, implemented in Ruby.

## `bs_container(*args, &block)`

Returns a bootstrap container containing content specified by a block. Also the container is customizable with the following options.

**Optional options**

* `:size` - Expects a breakpoints `:xs, :sm, :md, :lg, :xl, :xxl`

**HTML attributes** This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic

```ruby
bs_container size: :fluid do
  # content here
end
```

returns

```markup
<div class="container-fluid">
  <!-- Content here -->
</div>
```

