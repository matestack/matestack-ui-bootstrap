# Col

The Bootstrap `column` component, implemented in Ruby.

## `bs_col(*args, &block)`

Returns a bootstrap column containing content specified by a block. Also the column is customizable with the following options.

**Optional options**

* `sm`, `md`, `lg`, `xl`, `xxl`: Expects an Integer &lt;= 12. This parameter set the size of the column by the given breakpoint
* `default` - Expects an Integer &lt;= 12. `default: 12` is equal to `col-12` in bootstrap
* `order`, `order_sm`, `order_md`, `order_lg`, `order_xl`, `order_xxl`: Expects an Integer &lt;= 12. Set the order of the column by the given breakpoint
* `offset`, `offset_sm`, `offset_md`, `offset_lg`, `offset_xl`, `offset_xxl`: Expects an Integer &lt;= 12. Move columns to the right using offset parameter by the given breakpoint
* `align_self` - Expects `start`, `center`, `end`. Align vertically within the column

**HTML attributes** This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic

```ruby
bs_row do
  bs_col md: 12, lg: 6, xl: 4 do
    # content here
  end
end
```

returns

```markup
<div class="row">
  <div class="col-md-12 col-lg-6 col-xl-4">
    <!-- Content here -->
  </div>
</div>
```

### Example 2: Using offset option

```ruby
bs_row do
  bs_col md: 4 do
    plain ".col-md-4"
  end
  bs_col md: 4, offset_md: 4 do
    plain ".col-md-4 .offset-md-4"
  end
end
```

returns

```markup
<div class="row">
  <div class="col-md-4">.col-md-4</div>
  <div class="col-md-4 offset-md-4">.col-md-4 .offset-md-4</div>
</div>
```

### Example 3: Using the order option

```ruby
bs_row do
  bs_col sm: 12, md: 6, xl: 3 do          
    plain "Column 1"
  end
  bs_col sm: 12, md: 6, xl: 3, order_md: 5 do          
    plain "Column 2"
  end
  bs_col sm: 12, md: 6, xl: 3, order_md: 1 do
    plain "Column 3"
  end
end
```

returns

```markup
<div class="row">
  <div class="col-sm-12 col-md-6 col-xl-4">
    Column 1
  </div>
  <div class="col-sm-12 col-md-6 col-xl-4 order-md-5">
    Column 2
  </div>
  <div class="col-sm-12 col-md-6 col-xl-4 order-md-1">
    Column 3
  </div>
</div>
```

