# Carousel

The Bootstrap `carousel` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_carousel(*args, &block)`

Returns a bootstrap carousel containing a hash of `items` with `path`, `title`, `text` and `interval`. Also the carousel is customizable with the following options.

**Optional options**

* `:controls` - If set `true`, the previous and next arrows will be visible
* `:indicators` - If set `true`, the bottom indicators will be visible
* `:fade` - If set `true`, the animation when switching between items will be faded animation instead of sliding animation
* `:start` - Set the active item for carousel at the beginning. Counting start at 0.
* `:variant` - If `:dark`, the dark carousel theme will be applied \(using css class carousel-dark\)
* `:cycle_on` - Cycles through the carousel items from left to right.
* `:pause_on` - Stops the carousel from cycling through items.
* `:prev_on` - Cycles to the previous item.
* `:next_on` - Cycles to the next item.
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding carousel div.

**Further explanation**

* `:items` array: each item can include a hash with `path`, `title`, `text` and `interval` where `path` is the image-url, `interval` is the amount of time to delay between automatically cycling to the next item, `title` and `text` is the caption of the item
* `:cycle_on`, `:pause_on`, `:prev_on`, `:next_on` are JavaScript behaviors which can be trigger for example by an onclick method

## Examples

### Example 1: Basic Carousel with 2 items

```ruby
bs_carousel items: [
          { path: image_url("matestack-data.png") },
          { path: image_url("matestack-data.png") }
        ]
```

returns

```markup
<div id="..." class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="matestack-data.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="matestack-data.png" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
```

### Example 2: Basic Carousel with captions and different interval

```ruby
# declare items array before using carousel component
items = [
    { path: image_url("matestack-data.png"),
      title: "First slide", text: "First slide text caption",
      interval: 20000 },
    { path: image_url("matestack-data.png"),
      title: "Second slide", text: "Second slide text caption",
      interval: 5000 }
]
bs_carousel items: items
```

returns

```markup
<div id="..." class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="20000">
      <img src="matestack-data.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide</h5>
        <p>First slide text caption</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="5000">
      <img src="matestack-data.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide</h5>
        <p>Second slide text caption</p>
      </div>
    </div>
  </div>
</div>
```

### Example 3: Using controls, indicators and faded animation

```ruby
items = [
  { path: image_url("matestack-data.png") },
  { path: image_url("matestack-data.png") }
]
bs_carousel controls: true, indicators: true, fade: true, items: items
```

returns

```markup
<div id="..." class="carousel slide carousel-fade" data-bs-ride="carousel">
  <ol class="carousel-indicators">
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="matestack-data.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="matestack-data.png" class="d-block w-100" alt="...">
    </div>
  </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
```

### Example 4: Trigger Carousel per event

_with `cycle_on`, `pause_on`, `prev_on`, `next_on` you can trigger the JavaScript behaviors of carousel per event_

_`cycle_on` and `pause_on` can be use similarly as the exmample with `prev_on` and `next_on` below_

```ruby
items = [
  { path: image_url("matestack-data.png") },
  { path: image_url("matestack-data.png") }
]
bs_carousel prev_on: "prev-carousel", next_on: "next-carousel", items: items

onclick emit: "prev-carousel" do
  bs_btn text: "Prev"
end
onclick emit: "next-carousel" do
  bs_btn text: "Next"
end
```

