# Matestack Bootstrap Component: carousel

The Bootstrap `carousel` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `carousel(*args, &block)`
----

Returns a bootstrap carousel containing a hash of `items` with `path`, `title`, `text` and `interval`. Also the carousel is customizable with the following options. 

**Optional options**

* `:controls` - If set `true`, the previous and next arrows will be visible
* `:indicators` - If set `true`, the bottom indicators will be visible
* `:fade` - If set `true`, the animation when switching between items will be faded animation instead of sliding animation
* `:start` - Set the active item for carousel at the beginning

* `:cycle_on` - Cycles through the carousel items from left to right.
* `:pause_on` - Stops the carousel from cycling through items.
* `:prev_on` - Cycles to the previous item. 
* `:next_on` - Cycles to the next item.

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding carousel div.

**Further explanation**
* `:items` array: each item can include a hash with `path`, `title`, `text` and `interval` where `path` is the image-url, `interval` is the amount of time to delay between automatically cycling to the next item, `title` and `text` is the description of the item

* `:cycle_on`, `:pause_on`, `:prev_on`, `:next_on` are JavaScript triggers which can be trigger for example by an onclick method

## Examples

### Example 1: Basic Carousel with 3 items

```ruby

```

returns

```html
<div class="">
  
</div>
```

### Example 2: Using controls, indicators and faded animation

```ruby

```

returns

```html
<div class="">
  
</div>
```

### Example 3: Trigger Carousel remotely

```ruby

```

returns

```html
<div class="">
  
</div>
```