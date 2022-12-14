## Packages status

{% assign oses = "ubuntu, windows, macos" | split: ", " %}
{% assign toolchains = "android, ios" | split: ", " %}

<table>
<tr class="highlight">
    <th>Package</th>
    {% for os in oses %}
        <th>{{ os }}</th>
    {% endfor %}
    {% for toolchain in toolchains %}
        <th>{{ toolchain }}</th>
    {% endfor %}
</tr>

{% assign projects = site.data.projects | sort %}
{% for project in projects %}
{% assign job_ids = "" %}
<tr class="highlight" id="{{ project[0] }}">
    <td><a href="#{{ project[0] }}"><strong>{{ project[0] }}</strong></a></td>
    {% for os in oses %}
    <td>
        {% for job in project[1] %}
            {% unless job_ids contains job.id %}
                {% assign name = job.name | split: " " %}
                {% assign toolchain = name[1] | split: "-" %}
                    {% unless toolchains contains toolchain[0] %}
                        {% if name[2] contains os %}
                            <a href="{{ job.html_url }}" class="{{ job.conclusion }}">{{ name[1] }}</a><br>
                            {% assign job_ids = job_ids | append: job.id | append: "," %}
                        {% endif %}
                    {% endunless %}
            {% endunless %}
        {% endfor %}
    </td>
    {% endfor %}
    {% for toolchain in toolchains %}
    <td>
        {% for job in project[1] %}
            {% unless job_ids contains job.id %}
                {% assign name = job.name | split: " " %}
                {% if name[1] contains toolchain %}
                    <a href="{{ job.html_url }}" class="{{ job.conclusion }}">{{ name[1] }}</a><br>
                    {% assign job_ids = job_ids | append: job.id | append: "," %}
                {% endif %}
            {% endunless %}
        {% endfor %}
    </td>
    {% endfor %}
</tr>
{% endfor %}
</table>