<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" omit-xml-declaration="yes"/>

<xsl:template match="/">
<script>
	{
		"title": "<xsl:value-of select="//entry/@name" />",
		"termSlugs": {
			"category": [
				<xsl:for-each select="//entry/category"><xsl:if test="position() &gt; 1"><xsl:text>,</xsl:text></xsl:if>"<xsl:value-of select="@slug"/>"</xsl:for-each>
			]
		}
	}
</script>
	<xsl:for-each select="//entry">
		<xsl:variable name="number-examples" select="count(example)"/>
		<article>
			<xsl:copy-of select="desc/node()"/>
			<nav>
				<ul>
					<li>
						<a href="#overview">Overview</a>
					</li>
					<li>
						<a href="#options">Options</a>
						<ul>
							<xsl:for-each select="options/option">
								<li>
									<a href="#option-{@name}">
										<xsl:value-of select="@name"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</li>
					<li>
						<a href="#methods">Methods</a>
						<ul>
							<xsl:for-each select="methods/method">
								<li>
									<a href="#method-{@name}">
										<xsl:value-of select="@name"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</li>
					<li>
						<a href="#events">Events</a>
						<ul>
							<xsl:for-each select="events/event">
								<li>
									<a href="#event-{@name}">
										<xsl:value-of select="@name"/>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</li>
					<li>
						<a href="#theming">Theming</a>
					</li>
					<li>
						<a href="#examples">Examples</a>
					</li>
				</ul>
			</nav>
			<section id="overview">
				<header>
					<h2 class="underline">Overview</h2>
				</header>
				<p>
					<xsl:copy-of select="longdesc/node()"/>
				</p>
			</section>
			<section id="options">
				<header>
					<h2 class="underline">Options</h2>
				</header>
				<ul>
					<xsl:for-each select="options/option">
						<li id="option-{@name}">
							<h3>
								<xsl:value-of select="@name"/>
							</h3>
							<p>
								<strong>Type: </strong>
								<xsl:call-template name="render-types" />
							</p>
							<p>
								<strong>Default: </strong>
								<xsl:value-of select="@default"/>
							</p>
							<p>
								<xsl:copy-of select="desc/node()"/>
							</p>
							<xsl:if test="type/desc">
								Multiple types supported:
								<ul>
									<xsl:for-each select="type/desc">
										<li>
											<strong><xsl:value-of select="../@name"/></strong>: <xsl:copy-of select="node()"/>
										</li>
									</xsl:for-each>
								</ul>
							</xsl:if>
						</li>
					</xsl:for-each>
				</ul>
			</section>
			<section id="methods">
				<header>
					<h2 class="underline">Methods</h2>
				</header>
				<ul>
					<xsl:for-each select="methods/method">
						<li id="method-{@name}">
							<h3><xsl:value-of select="@name"/>(
     <xsl:for-each select="argument"><xsl:if test="position() &gt; 1">, </xsl:if><xsl:if test="@optional">[</xsl:if><xsl:value-of select="@name"/><xsl:if test="@optional">]</xsl:if></xsl:for-each>
     )</h3>
							<p>
								<xsl:copy-of select="desc/node()"/>
							</p>
							<xsl:call-template name="arguments"/>
						</li>
					</xsl:for-each>
				</ul>
			</section>
			<section id="events">
				<header>
					<h2 class="underline">Events</h2>
				</header>
				<ul>
					<xsl:for-each select="events/event">
						<li id="event-{@name}">
							<h3><xsl:value-of select="@name"/>(
     <xsl:for-each select="argument"><xsl:if test="position() &gt; 1">, </xsl:if><xsl:value-of select="@name"/></xsl:for-each>
     )</h3>
							<p>
								<xsl:copy-of select="desc/node()"/>
							</p>
							<xsl:call-template name="arguments"/>
						</li>
					</xsl:for-each>
				</ul>
			</section>
			<section id="theming">
				<header>
					<h2 class="underline">Theming</h2>
				</header>
				<xsl-copy-of select="theming/node()"/>
			</section>
			<section id="examples">
				<header>
					<h2 class="underline">Example<xsl:if test="$number-examples &gt; 1">s</xsl:if></h2>
				</header>
				<xsl:for-each select="example">
					<h4>
						<xsl:if test="$number-examples &gt; 1">Example: </xsl:if>
						<span class="desc">
							<xsl:value-of select="desc"/>
						</span>
					</h4>
					<pre>
						<code data-linenum="true"><xsl:choose><xsl:when test="html"><xsl:attribute name="class">example demo-code</xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="class">example</xsl:attribute></xsl:otherwise></xsl:choose>&lt;!doctype html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="utf-8"&gt;
&lt;title&gt;<xsl:value-of select="desc"/>&lt;/title&gt;
&lt;link rel="stylesheet" href="jquery-ui.css"&gt;<xsl:if test="css">
&lt;style&gt;<xsl:copy-of select="css/text()"/>  &lt;/style&gt;</xsl:if>
&lt;script src="jquery.js"&gt;&lt;/script&gt;
&lt;script src="jquery-ui.js"&gt;&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
<xsl:copy-of select="html/text()"/>
&lt;script&gt;<xsl:copy-of select="code/text()"/>&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</code>
					</pre>
					<xsl:if test="html">
						<h4>Demo:</h4>
						<div>
							<xsl:choose>
								<xsl:when test="html">
									<xsl:attribute name="class">demo code-demo</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="class">demo</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</xsl:if>
				</xsl:for-each>
			</section>
		</article>
	</xsl:for-each>
</xsl:template>
<!-- arguments -->
<xsl:template name="arguments">
	<xsl:if test="argument">
		<xsl:text> </xsl:text>
		<ul>
			<xsl:apply-templates select="argument"/>
		</ul>
	</xsl:if>
</xsl:template>
<!-- TODO consider optional arguments -->
<xsl:template match="argument">
	<li>
		<xsl:value-of select="@name"/>
		<xsl:text>: </xsl:text>
		<xsl:call-template name="render-types" />
		<xsl:if test="not(@null)">
			<xsl:if test="desc">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="desc"/>
			</xsl:if>
			<ul>
				<xsl:apply-templates select="property"/>
			</ul>
		</xsl:if>
	</li>
</xsl:template>
<!-- argument properties -->
<xsl:template match="argument/property">
	<li>
		<xsl:value-of select="@name"/>
		<xsl:text>: </xsl:text>
		<xsl:call-template name="render-types" />
		<xsl:if test="desc">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="desc"/>
		</xsl:if>
	</li>
</xsl:template>

<!--
	Render type(s) for a parameter or argument element.
	Type can either by a @type attribute or one or more <type> child elements.
-->
<xsl:template name="render-types">
	<xsl:if test="@type and type">
		<strong>ERROR: Use <i>either</i> @type or type elements</strong>
	</xsl:if>

	<!-- a single type -->
	<xsl:if test="@type">
		<xsl:call-template name="render-type">
			<xsl:with-param name="typename" select="@type" />
		</xsl:call-template>
	</xsl:if>

	<!-- elements. Render each type, comma seperated -->
	<xsl:if test="type">
		<xsl:for-each select="type">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:call-template name="render-type">
				<xsl:with-param name="typename" select="@name" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:if>
</xsl:template>

<xsl:template name="render-return-types">
	<xsl:if test="@return and return">
		<strong>ERROR: Use <i>either</i> @return or return element</strong>
	</xsl:if>

	<!-- return attribute -->
	<xsl:if test="@return">
		<xsl:call-template name="render-type">
			<xsl:with-param name="typename" select="@return" />
		</xsl:call-template>
	</xsl:if>

	<!-- a return element -->
	<xsl:if test="return">
		<xsl:for-each select="return">
			<xsl:if test="position() &gt; 1">
				<strong>ERROR: A single return element is expected</strong>
			</xsl:if>
			<xsl:call-template name="render-types" />
		</xsl:for-each>
	</xsl:if>
</xsl:template>

<!-- Render a single type -->
<xsl:template name="render-type">
	<xsl:param name="typename"/>
	<xsl:choose>
	<!--
		If the type is "Function" we special case and write the function signature,
		e.g. function(String)=>String
		- formal arguments are child elements to the current element
		- the return element is optional
	-->
	<xsl:when test="$typename = 'Function'">
		<text>Function(</text>
			<xsl:for-each select="argument">
				<xsl:if test="position() &gt; 1">, </xsl:if>
				<xsl:value-of select="@name" />
				<xsl:text>: </xsl:text>
				<xsl:call-template name="render-types" />
			</xsl:for-each>
		<text>)</text>
		<!-- display return type if present -->
		<xsl:if test="return or @return">
			=>
			<xsl:call-template name="render-return-types" />
		</xsl:if>
	</xsl:when>
	<xsl:otherwise>
		<!-- not function - just display typename -->
		<a href="http://api.jquery.com/Types#{$typename}"><xsl:value-of select="$typename" /></a>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
