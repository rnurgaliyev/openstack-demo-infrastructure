rs.initiate(
    {
      _id : "{{ graylog_mongodb_rs_name }}",
      members: [
        {% for node in graylog_nodes %}
        { _id : {{ loop.index-1 }}, host : "{{ node }}:27017" }{% if not loop.last %},{% endif %}
        
        {% endfor %}
      ]
    }
  )
