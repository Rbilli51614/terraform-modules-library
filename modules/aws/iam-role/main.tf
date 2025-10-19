data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals { 
      type = "Service" 
      identifiers = [var.assume_role] 
      }
  }
}

resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

resource "aws_iam_policy" "inline" {
  name   = "${var.name}-policy"
  policy = var.policy_json
}

resource "aws_iam_role_policy_attachment" "att" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.inline.arn
}

output "role_arn" { value = aws_iam_role.this.arn }

