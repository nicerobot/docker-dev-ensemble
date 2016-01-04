# Usage

    #!/bin/bash
    read -s password && make USER='username' PASS="${password}"

where:

- `username` is your Datastax username.
- `password` is your Datastax password.
