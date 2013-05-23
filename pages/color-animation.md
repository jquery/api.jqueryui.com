<script>{
	"title": "Color Animation",
	"excerpt": "Animate colors using .animate().",
	"termSlugs": {
		"category": [ "effects", "effects-core" ]
	}
}</script>

jQuery UI effects core adds the ability to animate color properties using `rgb()`,
`rgba()`, hex values, or even color names such as `"aqua"`. Simply include the
jQuery UI effects core file and [`.animate()`](http://api.jquery.com/animate/)
will gain support for colors.

The following properties are supported:

* `backgroundColor`
* `borderBottomColor`
* `borderLeftColor`
* `borderRightColor`
* `borderTopColor`
* `color`
* `columnRuleColor`
* `outlineColor`
* `textDecorationColor`
* `textEmphasisColor`

Support for color animation comes from the
[jQuery Color plugin](https://github.com/jquery/jquery-color). The Color plugin
provides several functions for working with colors. For full documentation, please
see the [jQuery Color documentation](https://github.com/jquery/jquery-color#readme).

## Class Animations

While there are use cases for directly animating individual color properties, it
is often a better approach to contain the styles in a class. jQuery UI provides
a few methods which will animate the addition or removal of a CSS class,
specifically [`.addClass()`](/addClass/), [`.removeClass()`](/removeClass/),
[`.toggleClass()`](/toggleClass/), and [`.switchClass()`](/switchClass/). These
methods will automatically determine which properties need to change and apply
the appropriate animations.
