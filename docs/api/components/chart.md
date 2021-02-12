# Matestack Bootstrap Component: Chart

Chart.js integration, Bootstrap theming aware

## `bs_chart(*args)`

**Optional options**

Docs in progress. Please review the examples.

## Examples

### Example 1: Bar chart

```ruby
bs_chart class: "w-50", type: :bar, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: :primary
  },
], labels: ["x", "y", "z"]
```

### Example 2: Doughnut chart

```ruby
bs_chart type: :doughnut, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: [:orange, :secondary, :primary]
  },
], labels: ["x", "y", "z"]
```

### Example 3: Line chart

```ruby
bs_chart type: :line, datasets: [
  {
    label: "€",
    data: [x, y, z],
    borderColor: :primary,
    pointRadius: 0
  },
  {
    label: "€",
    data: [last_7_days, total, last_30_days],
    borderColor: :danger,
    fill: false
  },
], labels: ["x", "y", "z"], display_x_axes: false, display_y_axes: false
```

### Example 4: Pie chart

```ruby
bs_chart type: :pie, datasets: [
  {
    label: "€",
    data: [x, y, z],
    backgroundColor: [:orange, :secondary, :primary]
  },
], labels: ["x", "y", "z"]
```

