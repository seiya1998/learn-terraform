resource "aws_s3_bucket" "test_bucket_for_terraform" {
    bucket_prefix = "${var.env_name}-test"
}

# バケットポリシーの設定
resource "aws_s3_bucket_policy" "test_bucket_for_terraform" {
    # バケット名
    bucket = aws_s3_bucket.test_bucket_for_terraform.id

    # ポリシードキュメントの設定
    policy = data.aws_iam_policy_document.test_bucket_for_terraform.json
}

# ポリシードキュメントの設定（dataブロック）
data "aws_iam_policy_document" "test_bucket_for_terraform" {
    statement {
        effect = "Allow"

        # S3に対して、GetObjectとPutObjectのアクションを許可
        actions = [
            "s3:GetObject",
            "s3:PutObject",
        ]

        # どのリソースに対してアクセスを許可するか（全てのリソースを指定）
        resources = [
            "${aws_s3_bucket.test_bucket_for_terraform.arn}/*",
        ]

        # アクセスを許可するユーザーを指定
        principals {
            type = "AWS"
            identifiers = ["*"]
        }
    }
}