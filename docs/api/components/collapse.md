# Matestack Bootstrap Component: Collapse

The Bootstrap `collapse` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `collapse(*args, &block)`
----

Returns a bootstrap collapse containing text or content specified by a block. Also the collapse is customizable with the following options. 

**Optional options**

* `card` - can be 2 types of option depends on the argument it has been given. you can pass on a String or a hash with custom `class` and `text`
* `multi` - If set true, collapse element can show and hide by multiple sources
* `parent` - Set data attribute *data-parent* 
* `labeledby`- Set attribute *aria-labelledby*

* **Javascript Triggers:**
  * `toggle_on` - Expects an event as string on which the collapse will be showed or hidden
  * `:show_on` - Expects an event as string on which the collapse will be showed calling javascript `show` method. 
  * `:hide_on` - Expects an event as string on which the collapse will be hidden calling javascript `hide` method. 
  * `:dispose_on` - Expects an event as string on which the collapse will be disposed calling javascript `dispose` method. 
<br>
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding collapse div.

## Examples

### Example 1: Basic Collapse component using Javascript trigger

```ruby
onclick emit: "toggleCollapse" do
  btn text: "Toggle Collapse"
end
collapse toggle_on: "toggleCollapse", card: "Random text for card body content"
```

returns

```html
<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    Toggle Collapse
</button>

<div class="collapse" id="collapseExample">
  <div class="card card-body">
    Random text for card body content
  </div>
</div>
```

## Examples

### Example 2: Multiple Targets 

```ruby
paragraph do
  link class: "btn btn-primary", text: "Toggle first element", path: "#multiCollapseExample1", data: { toggle: "collapse" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample1", 'role': "button" }
  btn text: "Toggle second element", data: { toggle: "collapse",  target: "#multiCollapseExample2" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample2" }
  btn text: "Toggle both element", data: { toggle: "collapse",  target: ".multi-collapse" }, attributes: { 'aria-expanded': "false", 'aria-controls': "multiCollapseExample1 multiCollapseExample2" }
end

row do
  col do
    collapse id: "multiCollapseExample1", card: "Random text for card body content #1", multi: true
  end
  col do
    collapse id: "multiCollapseExample2", card: "Random text for card body content #2", multi: true
  end
end
```

```html
<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Toggle first element</a>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Toggle second element</button>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">Toggle both elements</button>
</p>
<div class="row">
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample1">
      <div class="card card-body">
        Random text for card body content #1
      </div>
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample2">
      <div class="card card-body">
        Random text for card body content #2
      </div>
    </div>
  </div>
</div>
```