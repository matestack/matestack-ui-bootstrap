# Matestack Bootstrap Component: Col

The Bootstrap `` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### sm, md, lg, xl, xxl - optional
Expects an Integer <= 12. This parameter set the size of the column by the given breakpoint

### default - optional
Expects an Integer <= 12. `default: 12` is equal to `col-12` in bootstrap 

### order, order_sm, order_md, order_lg, order_xl, order_xxl - optional
Expects an Integer <= 12. Set the order of the column by the given breakpoint

### offset, offset_sm, offset_md, offset_lg, offset_xl, offset_xxl - optional
Expects an Integer <= 12. Move columns to the right using offset parameter by the given breakpoint

### align_self - optional
Expects `start`, `center`, `end`. Align vertically within the column

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic

```ruby
row do
  col md: 12, lg: 6, xl: 4 do
    # content here
  end
end
```

returns

```html
<div class="row">
  <div class="col-md-12 col-lg-6 col-xl-4">
    <!-- Content here -->
  </div>
</div>
```

### Example 2: Using offset option

```ruby
row do
  col md: 4 do
    plain ".col-md-4"
  end
  col md: 4, offset_md: 4 do
    plain ".col-md-4 .offset-md-4"
  end
end
```

returns

```html
<div class="row">
  <div class="col-md-4">.col-md-4</div>
  <div class="col-md-4 offset-md-4">.col-md-4 .offset-md-4</div>
</div>
```

### Example 3: Using the order option

```ruby
row do
  col sm: 12, md: 6, xl: 3 do          
    plain "Column 1"
  end
  col sm: 12, md: 6, xl: 3, order_md: 5 do          
    plain "Column 2"
  end
  col sm: 12, md: 6, xl: 3, order_md: 1 do
    plain "Column 3"
  end
end
```

returns

```html
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