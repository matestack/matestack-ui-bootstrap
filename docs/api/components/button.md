# Button

The Bootstrap `button` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `btn(*args, &block)`

Returns a bootstrap button containing text or content specified by a block. Also the button is customizable with the following options.

**Optional options**

* `:variant` - Specify a variant for the button. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
* `:outline` - Set `true` for outline button styling
* `:size` - Use `:block, :sm, :md or :lg` to change the size of the button. The default is `nil`.
* `:type` - Specify the type button tags. By default is set as `button`. You can set is for example as `submit`, `reset`, etc.
* `:text` - Expects a string with the text that should go inside the button
* `:link` - Expects a hash with parameters for a link component, button will act as a link \(`a` tag with btn css classes\)
* `:transition` - Expects a hash with parameters for a transition component, button will act as a transition \(`a` tag with btn css classes\)
* `:action` - Expects a hash with parameters for a action component, button will act as a action \(`a` tag with btn css classes\)
* `:onclick` - Expects a hash with parameters for a onclick component, button will act as a onclick \(`a` tag with btn css classes\)
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding button div.

## Examples

### Example 1: Basic Bootstrap btn with predefined styes

The btn implemented in ruby has by default primary as styling

```ruby
bs_btn text: "Primary"
bs_btn variant: :secondary, text: "Secondary"
bs_btn variant: :success, text: "Success"
bs_btn variant: :danger, text: "Danger"
bs_btn variant: :warning, text: "Warning"
bs_btn variant: :info, text: "Info"
bs_btn variant: :light, text: "Light"
bs_btn variant: :dark, text: "Dark"
bs_btn variant: :link, text: "Link"

bs_btn variant: :primary, outline: true, text: "Outline Primary"
bs_btn variant: :secondary, outline: true, text: "Outline Secondary"
...
```

returns

```markup
<btn type="button" class="btn btn-primary">Primary</btn>
<btn type="button" class="btn btn-secondary">Secondary</btn>
<btn type="button" class="btn btn-success">Success</btn>
<btn type="button" class="btn btn-danger">Danger</btn>
<btn type="button" class="btn btn-warning">Warning</btn>
<btn type="button" class="btn btn-info">Info</btn>
<btn type="button" class="btn btn-light">Light</btn>
<btn type="button" class="btn btn-dark">Dark</btn>
<btn type="button" class="btn btn-link">Link</btn>

<btn type="button" class="btn btn-outline-primary"> Outline Primary</btn>
<btn type="button" class="btn btn-outline-secondary">Outline Secondary</btn>
```

### Example 2: Applying actions, transition, links or onclicks

```ruby
bs_btn action: { path: root_path, method: :post ... } do
  plain "Action"
end
bs_btn transition: { path: root_path ... } do
  plain "Transition"
end
bs_btn link: { path: root_path ... } do
  plain "Link"
end
bs_btn onclick: { emit: "test" ... } do
  plain "Onclick"
end
```

### Example 3: Yield a given block

```ruby
bs_btn id: 'foo', class: 'bar' do
  plain "Click me"
end
```

returns

```markup
<btn id="foo" type="button" class="btn btn-primary bar">
  Click me
</btn>
```

### Example 4: Using btn size parameter

```ruby
bs_btn variant: :success, size: :sm, text: "Small btn"
bs_btn variant: :secondary, size: :lg, text: "Large btn"
```

returns

```markup
<btn type="button" class="btn btn-success btn-sm">Small btn</btn>

<btn type="button" class="btn btn-secondary btn-lg">Large btn</btn>
```

