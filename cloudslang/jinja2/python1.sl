namespace: test.cloudslang.jinja2

operation:
  name: python1

  inputs:
    - name

  python_action:
    script: |
      import os
      from jinja2 import Template, Environment, FileSystemLoader

      TEMPLATE_ENVIRONMENT = Environment(
          autoescape=False,
          loader=FileSystemLoader("/Users/pau/workspace/cslang-cli/content/test/cloudslang/jinja2/templates"),
          trim_blocks=False)

      template = TEMPLATE_ENVIRONMENT.get_template("template.html").render({"my_string":"test", "my_list":[1,2,3,4,5]})

      with open("/tmp/test.html", "w") as text_file:
        text_file.write(template)

      returnCode = 0

  results:
    - SUCCESS: ${ returnCode == 0 }
    - FAILURE
