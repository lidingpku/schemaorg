<div id="infoblock">
	<!-- Label /  termType  / canonical URI -->
    <h1>{{ term.label }}</h1>
    <em>A Schema.org {{ TERMTYPE }}</em>
    <br/>
	
	<!-- Pending/retired -->
    {% if term.pending %}This term is proposed for full integration into Schema.org, <a title="these terms are pending wider review. Feedback is welcomed!" href="docs/pending.home.html">pending</a> implementation feedback and adoption from applications and websites.<br/>{% endif %}
    {% if term.retired %}<strong>Note:</strong> This term has been <strong><a title="these terms have been retired from the vocabulary" href="docs/attic.home.html">retired</a></strong> from the vocabulary.</span><br/>{% endif %}
    <br/>
	
	<!-- Breadcrumb display of term inheritance -->
    <div class="superPaths">
    {% for superPath in term.superPaths %}
        {% for super in superPath %} {% if not loop.first %}{% if not loop.last %} -> {% endif %}{% endif %}
					{% if loop.index > 1 %}{% if loop.last %}{% if TERMTYPE == "Enumeration Value" %} :: {% else %} -> {% endif %}{% endif %}{% endif %}
					{{ sdotermlink(super)|safe }}{% endfor %}
        <br/>
    {% endfor %}
    </div>
    <!-- More Block -->
    <div>
            <div id='infobox' style='text-align: right;' role="checkbox" aria-checked="false">
                <label for="morecheck"><b><span style="cursor: pointer;">[more...]</span></b></label>
            </div>
            <input type='checkbox' checked="checked" style='display: none' id=morecheck><div id='infomsg' style='background-color: #EEEEEE; text-align: left; padding: 0.5em;'>
            <ul><li> <span class="canonicalUrl">Canonical URL: {{term.uri}}</span> </li>
            {% for eq in term.equivalents %}
                {% if loop.first %}<li>{% else %}<br/>{% endif %}
                Equivalent {% if TERMTYPE == "Property" %}Property{% else %}Class{% endif%}: {{eq.label}}
                {% if loop.last %}</li>{% endif %}
            {% endfor %}
                <li><a href='https://docs.google.com/a/google.com/forms/d/1krxHlWJAO3JgvHRZV9Rugkr9VYnMdrI10xbGsWt733c/viewform?entry.1174568178&entry.41124795={{term.uri}}&entry.882602760={{TERMTYPE}}'>Leave public feedback on this term &#128172;</a></li><li><a href='https://github.com/schemaorg/schemaorg/issues?q=is%3Aissue+is%3Aopen+{{term.label}}'>Check for open issues.</a></li></ul>
    </div>
    </div>
	
	<!-- Description of term -->
    <div class="description">{{term.comment|safe}}</div>
    {% for sup in term.supers %}
        {% if sup.termType == "Reference" %}
            {% if loop.first %}<br/><strong> Subclass of:</strong><ul>{%else %}<br/>{% endif %}
                <li>{{ sup.label }}</li>
            {% if loop.last %}</ul><br/>{% endif %}
        {% endif %}
    {% endfor %}
	
</div> <!-- infoblock -->
