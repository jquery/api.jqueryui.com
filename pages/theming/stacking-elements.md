<script>{
	"title": "Stacking Elements",
	"termSlugs": {
		"category": [ "theming" ]
	}
}</script>

Widgets that stack, or move in front of other elements, often present challenges
when placed into real world pages. It's usually easy to either change the z-index
or parent of the stacked element to avoid any collisions on the page. However,
jQuery UI needs a generic solution that doesn't require manually playing with
z-index values. This is accomplished via the `ui-front` class, and usually an
accompanying `appendTo` option on stacking widgets.



## The `ui-front` class

The `ui-front` class is very basic. It just sets a static `z-index` value on the
element. However, the existence of the class is used to indicate where stacking
elements should be appended. This allows us to take advantage of nested stacking
contexts, resulting in a default DOM position that works for most use cases.

*Note: When using `ui-front`, you must also set `position` to `relative`,
`absolute` or `fixed` in order for the `z-index` to be applied.*



## The stacking technique

Any widget that appends a stacking element to the page must use the `ui-front`
class, and in many cases should have an `appendTo` option. The following logic
should be applied to the stacking element:

* If a value is provided for the `appendTo` option, then append the stacking
element to the specified element.
* If the `appendTo` option is set to `null` (default), then the widget should
walk up the DOM from the associated element. For example, when the autocomplete
menu is appended to the DOM, the walking starts from the associated input element.
  * If an element with the `ui-front` class is found, append to that element.
  * If no element with the `ui-front` class is found, append to the body.
* The stacking element must also have `position` set to `relative`, `absolute`,
or `fixed` in order for the `z-index` from the `ui-front` class to be applied.
Using [/position/](.position()) will automatically set `position`.
