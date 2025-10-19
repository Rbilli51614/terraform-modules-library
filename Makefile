fmt:
\tterraform fmt -recursive

validate:
\tterraform validate || true
\tfind examples -maxdepth 2 -name main.tf -execdir sh -c 'terraform init -backend=false && terraform validate' \\;

lint: fmt validate

