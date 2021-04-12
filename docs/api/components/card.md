# Card

The Bootstrap `card` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_card(*args, &block)`

Returns a bootstrap card containing text or content specified by a block. Also the card is customizable with the following options.

**Optional options**

* `header` - Expects a string or a hash with `class` and `text` as possible keys, that should go inside the header component
* `footer` - Expects a string or a hash with `class` and `text` as possible keys, that should go inside the footer component
* `body` - Expects a string or a hash with `class` and `text` as possible keys, with the text that should go inside the card-body component
* `title` - additional to the body text, you can add a string as title with pre-defined heading size \(`h5`\)
* `subtitle` - additional to the body text, you can add a string as subtitle with pre-defined heading size \(`h6`\)
* `img_path` - Insert an image component into the card body by giving the image path
* `img_pos` - Expects `:bottom` or `:top`. This parameter will set the placement of the image in the bottom of the card component. By default it's set as top image
* `alt_text` - Expects a string for image's alt-text
* `slots` - Using slots to yield custom components in card components for `header`, `footer` or `body`
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding card div.

## Examples

### Example 1: Basic example with simple body, footer and header text

```ruby
bs_card img_path: image_url("...png"),
      title: "Card title", body: "Some quick example text",
      header: "Card Header", footer: "Card Footer"
```

returns

```markup
<div class="card">
  <div class="card-header">
    Card Header
  </div>
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text</p>
  </div>
  <div class="card-footer">
    Card Footer
  </div>
</div>
```

### Example 2: Example with body and header as a hash

```ruby
bs_card body: "Some quick example text",
      header: { text: "Card header hash", class: "text-center h3" }
```

returns

```markup
<div class="card">
  <div class="card-header text-center h3">
    Card header hash
  </div>
  <div class="card-body">
    <p class="card-text">Some quick example text</p>
  </div>
</div>
```

### Example 3: Using Slots for customize card body

```ruby
bs_card slots: { body: method(:my_card_body) }

def my_card_body
  ul class: 'list-group list-group-flush' do
    li class: "list-group-item" do plain "Item 1" end
    li class: "list-group-item" do plain "Item 2" end
    li class: "list-group-item" do plain "Item 3" end
  end
  a "Card link", class: 'btn btn-link', path: "#"
  a "Another link", class: 'btn btn-link', path: "#"
end
```

returns

```markup
<div class="card">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Item 1</li>
    <li class="list-group-item">Item 2</li>
    <li class="list-group-item">Item 3</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
```

### Example 4: Using Slots for customize card header and footer

```ruby
bs_card body: "With supporting text below.", title: "Special title treatment",
    slots: { header: method(:my_card_header), footer: method(:my_card_footer) }, class: "text-center"

def my_card_header
  ul class: "nav nav-tabs card-header-tabs" do
    li class: "nav-item" do
      a "Tab 1", class: "nav-link", path: "#"
    end
    li class: "nav-item" do
      a "Tab 2", class: "nav-link", path: "#"
    end
  end
end

def my_card_footer
  plain "2 days ago"
end
```

returns

```markup
<div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item">
        <a class="nav-link" href="#">Tab 1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Tab 2</a>
      </li>
    </ul>
  </div>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
  </div>
  <div class="card-footer">
    2 days ago
  </div>
</div>
```

### Example 5: Yield a given block

**Point of attention:** Custom Component will be yield outside of the `card-body` tag.

```ruby
bs_card title: "Card title", body: "Some quick example text" do
  div class: "p-3" do
    bs_btn "Card Button"
    bs_btn "Another Button"
  end
end
```

returns

```markup
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text</p>
  </div>
  <div class="p-3">
    <button type="button" class="btn btn-primary">Card Button</button>
    <button type="button" class="btn btn-primary">Another Button</button>
  </div>
</div>
```

