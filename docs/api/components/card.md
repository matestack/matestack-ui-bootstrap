# Matestack Bootstrap Component: Card

The Bootstrap `card` component, implemented in Ruby.

**The Cards component has a lot of customization options which will not be covered here. Check out the official Bootstrap Doc*
(https://v5.getbootstrap.com/docs/5.0/components/card/)

## Parameters
This component can handle various optional configuration params and can yield content

### header - optional
Expects a string that should go inside the header component

### header_class - optional
Expects html or bootstrap class for elements within the `header` tag

### title - optional
Expects a string with the title that should go inside the card-body 

### title_size - optional 
Expects an Integer as size for heading element

### text - optional
Expects a string with the text that should go inside the card-body component

### img_path - optional
Expects a path to image component

### img_pos - optional
Expects `:bottom` or `:top`. This parameter will set the placement of the image in the bottom of the card component.
By default it's set as top image

### alt_text - optional
Expects a string for image's alt-text

### footer - optional
Expects a string that should go inside the footer component

### footer_class - optional
Expects html or bootstrap class for elements within the `footer` tag

## slots
Using slots to yield custom components in card components

### header slots - optional
yield custom block within header

### body slots - optional
yield custom block within body

### footer slots - optional 
yield custom block within footer

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic example

```ruby
card img_path: image_url("...png"), title: "Card title", text: "Some quick example text to build on the card title and make up the bulk of the card's content."
```

returns

```html
<div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
```

### Example 2: Using Slots for customize card body

```ruby
card img_path: image_url("...png"), text: "Some quick example text to build on the card title and make up the bulk of the card's content.",
  slots: { body: my_card_body }

def my_card_body
  slot {
    ul class: 'list-group list-group-flush' do
      li class: "list-group-item" do plain "Item 1" end
      li class: "list-group-item" do plain "Item 2" end
      li class: "list-group-item" do plain "Item 3" end
    end
    link class: 'btn btn-link', text: "Card link", path: "#"
    link class: 'btn btn-link', text: "Another link", path: "#"
  }
end
```

returns

```html
<div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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

### Example 3: Using Slots for customize card header and footer

```ruby
card text: "With supporting text below as a natural lead-in to additional content.", title: "Special title treatment", slots: { header: my_card_header, footer: my_card_footer }, footer_class: "text-muted", class: "text-center"

def my_card_header
  slot {
    ul class: "nav nav-tabs card-header-tabs" do
      li class: "nav-item" do 
        link class: "nav-link", path: "#", text: "Tab 1"  
      end
      li class: "nav-item" do 
        link class: "nav-link", path: "#", text: "Tab 2"  
      end
    end
  }
end

def my_card_footer
  slot {
    plain "2 days ago"
  }
end
```

returns

```html
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
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>
```

### Example 4: Yield a given block
**Point of attention:** Customer Component will be yield outside of the `card-body` tag. 

```ruby
card img_path: image_url("matestack-data.png"), title: "Card title", 
      text: "Some quick example text to build on the card title and make up the bulk of the card's content." do
  div class: "p-3" do
    btn text: "Card Button"
    btn text: "Another Button"
  end
end
```

returns

```html
<div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
  <div class="p-3">
    <button type="button" class="btn btn-primary">Card Button</button>
    <button type="button" class="btn btn-primary">Another Button</button>
  </div>
</div>
```