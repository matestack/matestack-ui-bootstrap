# ButtonGroup

The Bootstrap `button group` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `btn_group(*args, &block)`

Returns a bootstrap button-group containing content specified by a block. Also the button\_group is customizable with the following options.

**Optional options**

* `size` - Use `:sm` \(small\), `:md` \(medium\), `:lg` \(large\) to change size of the button group. The default is `nil`.
* `toolbar` - Set `true` for using button toolbar instead of button group
* `label` - Expects a String. Adding label to attributes `aria-label`
* `vertical` - Expects `true` or `false`. By default is set as `true`. This parameter determines whether the button group should align vertically
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding button group div.

## Examples

### Example 1:

```ruby
bs_btn_group label: "Basic example" do
  bs_btn variant: :secondary, text: "Left"
  bs_btn variant: :secondary, text: "Middle"
  bs_btn variant: :secondary, text: "Right"
end
```

returns

```markup
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-secondary">Left</button>
  <button type="button" class="btn btn-secondary">Middle</button>
  <button type="button" class="btn btn-secondary">Right</button>
</div>
```

### Example 2: Using size

```ruby
bs_btn_group size: :lg, label: "..." do ... end
bs_btn_group label: "..." do ... end
bs_btn_group size: :sm, label: "..." do ... end
```

returns

```markup
<div class="btn-group btn-group-lg" role="group" aria-label="...">...</div>
<div class="btn-group" role="group" aria-label="...">...</div>
<div class="btn-group btn-group-sm" role="group" aria-label="...">...</div>
```

### Example 3: Button Toolbar

```ruby
bs_btn_group toolbar: true, label: "Toolbar with button groups" do
  bs_btn_group label: "First group" do
    btn variant: :secondary, text: "1"
    btn variant: :secondary, text: "2"
    btn variant: :secondary, text: "3"
  end
  bs_btn_group label: "Second group" do 
    btn variant: :secondary, text: "1"
    btn variant: :secondary, text: "2"
    btn variant: :secondary, text: "3"
  end
end
```

returns

```markup
<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
  <div class="btn-group" role="group" aria-label="First group">
    <button type="button" class="btn btn-secondary">1</button>
    <button type="button" class="btn btn-secondary">2</button>
    <button type="button" class="btn btn-secondary">3</button>
  </div>
  <div class="btn-group" role="group" aria-label="Second group">
    <button type="button" class="btn btn-secondary">5</button>
    <button type="button" class="btn btn-secondary">6</button>
    <button type="button" class="btn btn-secondary">7</button>
  </div>
</div>
```

