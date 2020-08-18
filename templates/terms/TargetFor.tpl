{% for prop in term.expectedTypeFor %}
  {% if loop.first %}
	<br/><div id="incoming">Instances of {{ sdotermlink(term.id)|safe}} {{INSERT}} may appear as a value for the following properties</div>
	<table class="definition-table">
    <thead><tr><th>Property</th><th>On Types</th><th>Description</th></tr></thead>
  {% endif %}
  <tr><th class="prop-nam">{{ sdotermlink(prop.id)|safe}}</code></th>
      <td class="prop-ect">{% for ect in prop.domainIncludes %}{% if not loop.first %}&nbsp; or <br/>{% endif %}{{ sdotermlink(ect)|safe}}{% endfor %}</td>
      <td class="prop-desc">{{ prop.comment | safe}}
  </tr> 
  
  {% if loop.last %}
	 </table>
  {% endif %}
{% endfor %}
