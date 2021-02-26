# Matestack Bootstrap Component: Tab/Pill Nav

The Bootstrap `nav` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_tab_nav(*args, &block)`


Returns a bootstrap tab nav. Also the nav is customizable with the following options.

**Required options**

* `id`

**Optional options**

* `items` - expects an array with hashes with `id`, `text`, `active` as possible keys
  * Set `active` to true, if the current item is the active element
* `variant` - Either `:tabs` or `:pills`
* `fill` - If set true, all available space will be filled proportionately with your _.nav-items_
* `justified` - If set true, all horizontal space will be occupied by nav links, but unlike the _.nav-fill_ above, every nav item will be the same width.
* `vertical` - If set true, navigation items will be stacked up
* `horizontal` - Change the horizontal alignment of your nav with flexbox utilities. By default, navs are left-aligned, but you can easily change them to `:center` or `:right` aligned.
* `vertical_up_to_sm` - If set to to true, responsive utility classes are applied for desired responsive behavior
* `vertical_up_to_md` - If set to to true, responsive utility classes are applied for desired responsive behavior
* `vertical_up_to_xl` - If set to to true, responsive utility classes are applied for desired responsive behavior
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding nav div.

## `bs_tab_nav_content(*args, &block)`

**Required options**

* `id`, need to match desired tab trigger button

**Optional options**

* `active`, set `active` to true, if the current item is the active element


## Examples

### Example 1: Basic tab navigation with pills

```ruby
def response
  bs_tab_nav tab_nav_config do
    bs_tab_nav_content id: :a, active: true do
      plain "A"
    end
    bs_tab_nav_content id: :b do
      plain "B"
    end
    bs_tab_nav_content id: :c do
      plain "C"
    end
  end
end

def tab_nav_config
  {
    id: "navigation",
    items: [
      { id: :a, text: "Tab A", active: true},
      { id: :b, text: "Tab B" },
      { id: :c, text: "Tab C" }
    ],
    variant: :pills,
    class: "mb-5"
  }
end
```
