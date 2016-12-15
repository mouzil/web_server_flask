#!/bin/sh
 /home/formateur/apache-jmeter-3.0/bin/jmeter -JHOST=localhost -JPORT=5000 -JNBR_USER=50  -Jjmeter.save.saveservice.output_format=xml  -Jjmeter.save.saveservice.response_data.on_error=true -n -t  /home/formateur/PycharmProjects/web_server_flask/jmeter_jmx/csrf_token_user_defined_variable.jmx -l /home/formateur/PycharmProjects/web_server_flask/jmeter_jmx/web_server_result.jtl

